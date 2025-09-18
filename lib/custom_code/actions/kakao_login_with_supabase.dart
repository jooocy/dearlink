// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

Future<dynamic> kakaoLoginWithSupabase() async {
  try {
    KakaoSdk.init(
      nativeAppKey: 'f9174d627b4ce572e5e257a3c52295e8',
      javaScriptAppKey: 'f9174d627b4ce572e5e257a3c52295e8',
    );

    // Kakao 로그인 시도
    kakao.OAuthToken token;
    if (await kakao.isKakaoTalkInstalled()) {
      token = await kakao.UserApi.instance.loginWithKakaoTalk();
    } else {
      token = await kakao.UserApi.instance.loginWithKakaoAccount();
    }

    // Kakao 유저 정보 가져오기
    kakao.User kakaoUser = await kakao.UserApi.instance.me();
    final client = supabase.Supabase.instance.client;

    // Supabase용 이메일과 비밀번호 구성
    final email = kakaoUser.kakaoAccount?.email ?? '${kakaoUser.id}@kakao.com';
    final password = 'kakao_${kakaoUser.id}';

    try {
      // Supabase 회원가입 시도
      await client.auth.signUp(
        email: email,
        password: password,
        data: {
          'kakao_id': kakaoUser.id,
          'nickname': kakaoUser.kakaoAccount?.profile?.nickname,
          'profile_image': kakaoUser.kakaoAccount?.profile?.profileImageUrl,
        },
      );

      // 가입 성공
      return {
        'success': true,
        'is_new_user': true,
        'email': email,
        'password': password,
      };
    } on supabase.AuthException catch (e) {
      if (e.message.contains('already registered')) {
        // 이미 가입된 경우: 로그인만 진행
        await client.auth.signInWithPassword(email: email, password: password);

        // 메타데이터에 provider 정보 추가
        await client.auth.updateUser(supabase.UserAttributes(
          data: {'provider': 'kakao'},
        ));

        return {
          'success': true,
          'is_new_user': false,
          'email': email,
          'password': password,
        };
      } else {
        // 예기치 못한 인증 오류
        return {
          'success': false,
          'error': e.message,
        };
      }
    }
  } catch (e) {
    // Kakao SDK 에러 또는 기타 예외
    return {
      'success': false,
      'error': e.toString(),
    };
  }
}
