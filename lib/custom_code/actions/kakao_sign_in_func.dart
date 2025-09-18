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

    // 1) SDK init
    print('[1] KakaoSdk.init');
    kakao.KakaoSdk.init(
      nativeAppKey: 'f9174d627b4ce572e5e257a3c52295e8',
      javaScriptAppKey: 'f9174d627b4ce572e5e257a3c52295e8',
    );

    // 2) 설치 여부
    final installed = await kakao.isKakaoTalkInstalled();
    print('[2] isKakaoTalkInstalled: $installed');

    // 3) 로그인
    print('[3] Try loginWith${installed ? 'KakaoTalk' : 'KakaoAccount'}');
    kakao.OAuthToken token = installed
        ? await kakao.UserApi.instance.loginWithKakaoTalk()
        : await kakao.UserApi.instance.loginWithKakaoAccount();

    if (kDebugMode) {
      final t = token.accessToken;
      print(
          '[3] accessToken: ${t.isNotEmpty ? '${t.substring(0, 16)}...' : 'EMPTY'}');
    }

    // 4) 카카오 유저
    final kakaoUser = await kakao.UserApi.instance.me();
    print(
        '[4] kakaoUser.id=${kakaoUser.id}, email=${kakaoUser.kakaoAccount?.email}');

    // 5) Supabase 가입/로그인
    final email = kakaoUser.kakaoAccount?.email ?? '${kakaoUser.id}@kakao.com';
    final password = 'kakao_${kakaoUser.id}';
    print('[5] Supabase signUp -> email=$email');

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
      print('[5] signUp OK');
    } on AuthException catch (e) {
      print('[5] signUp AuthException: ${e.message}');
      if (!e.message.contains('already registered')) rethrow;
    }

    print('[6] Supabase signInWithPassword');
    final authResponse = await SupaFlow.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final supabaseJWT = authResponse.session?.accessToken ?? '';
    if (kDebugMode) {
      print(
          '[6] SUPABASE JWT: ${supabaseJWT.isNotEmpty ? '${supabaseJWT.substring(0, 16)}...' : 'EMPTY'}');
    }
    print('[7] DONE');
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