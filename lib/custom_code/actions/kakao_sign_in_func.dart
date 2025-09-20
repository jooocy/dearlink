// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<AuthUserStruct?> kakaoSignInFunc() async {
  try {
    print('=== KAKAO SIGN-IN START ===');
    print('Platform: ${kIsWeb ? 'Web' : 'Mobile'}');

    // 1) 설치 여부 확인
    final installed = await kakao.isKakaoTalkInstalled();
    print('[1] isKakaoTalkInstalled: $installed');

    // 2) 로그인
    print('[2] Try loginWith${installed ? 'KakaoTalk' : 'KakaoAccount'}');
    kakao.OAuthToken token = installed
        ? await kakao.UserApi.instance.loginWithKakaoTalk()
        : await kakao.UserApi.instance.loginWithKakaoAccount();

    if (kDebugMode) {
      final t = token.accessToken;
      print(
          '[2] accessToken: ${t.isNotEmpty ? '${t.substring(0, 16)}...' : 'EMPTY'}');
    }

    // 3) 카카오 유저 정보
    final kakaoUser = await kakao.UserApi.instance.me();
    print(
        '[3] kakaoUser.id=${kakaoUser.id}, email=${kakaoUser.kakaoAccount?.email}');

    // 4) Supabase 가입/로그인
    final email = kakaoUser.kakaoAccount?.email ?? '${kakaoUser.id}@kakao.com';
    final password = 'kakao_${kakaoUser.id}';
    print('[4] Supabase signUp -> email=$email');

    try {
      await SupaFlow.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'kakao_id': kakaoUser.id,
          'nickname': kakaoUser.kakaoAccount?.profile?.nickname,
          'profile_image': kakaoUser.kakaoAccount?.profile?.profileImageUrl,
          'provider': 'kakao',
        },
      );
      print('[4] signUp OK');
    } on AuthException catch (e) {
      print('[4] signUp AuthException: ${e.message}');
      if (!e.message.contains('already registered')) rethrow;
    }

    print('[5] Supabase signInWithPassword');
    final authResponse = await SupaFlow.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final supabaseJWT = authResponse.session?.accessToken ?? '';
    if (kDebugMode) {
      print(
          '[5] SUPABASE JWT: ${supabaseJWT.isNotEmpty ? '${supabaseJWT.substring(0, 16)}...' : 'EMPTY'}');
    }
    print('[6] DONE');
    return _mapSupabaseUserToAuthUser(authResponse.user, supabaseJWT);
  } on AuthException catch (e, st) {
    print('=== KAKAO SIGN-IN AuthException ===');
    print('message: ${e.message}');
    print('stack: $st');
    return null;
  } catch (e, st) {
    print('=== KAKAO SIGN-IN ERROR ===');
    print('error: $e');
    print('stack: $st');
    return null;
  }
}

/// Supabase User → AuthUserStruct 변환
AuthUserStruct _mapSupabaseUserToAuthUser(User? user, String supabaseJWT) {
  if (user == null) return AuthUserStruct();

  return AuthUserStruct(
    id: user.id,
    email: user.email ?? '',
    idToken: supabaseJWT,
  );
}