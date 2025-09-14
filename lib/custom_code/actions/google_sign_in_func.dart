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

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<AuthUserStruct?> googleSignInFunc() async {
  try {
    if (kIsWeb) {
      /*
      final success =
          await SupaFlow.client.auth.signInWithOAuth(OAuthProvider.google);
      if (!success) return null;

      final user = SupaFlow.client.auth.currentUser;
      return _mapSupabaseUserToAuthUser(user);*/
      return null;
    }

    final googleSignIn = GoogleSignIn(
      scopes: ['profile', 'email'],
      clientId: isAndroid
          ? '1082934337567-98a4nbjl1i5u8alea4imfkt2qqdujfi6.apps.googleusercontent.com'
          : '1082934337567-be1hlakt00e77hlifvui8r8jf1tpglnp.apps.googleusercontent.com',
      serverClientId:
          '1082934337567-5s9c01kv2qiom238p2bje6327uv8pnhl.apps.googleusercontent.com',
    );

    await googleSignIn.signOut().catchError((_) => null);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    final authResponse = await SupaFlow.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return _mapSupabaseUserToAuthUser(
        authResponse.user, authResponse.session?.accessToken);
  } catch (e) {
    print('Google Sign-In Error: $e');
    return null; // 에러 시 null 반환으로 앱 크래시 방지
  }
}

/// Supabase User → AuthUserStruct 변환
AuthUserStruct _mapSupabaseUserToAuthUser(User? user, String? idToken) {
  if (user == null || idToken == null) return AuthUserStruct();
  print('Google Sign-In User: ${user.id}');
  print('Google Sign-In ID Token: ${idToken}');
  return AuthUserStruct(id: user.id, email: user.email ?? '', idToken: idToken);
}
