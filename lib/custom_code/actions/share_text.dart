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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:share_plus/share_plus.dart';

Future<void> shareText(String text) async {
  Share.share(text);
}

Future<void> shareInviteLink(String inviteCode) async {
  // 실제로는 커스텀 스킴이 클릭되지 않으므로, 코드만 공유하는 것이 가장 실용적
  final textContent = '''
Dear Link에서 초대해요! 👋

💡 사용 방법:
1. Dear Link 앱을 다운로드하세요
2. 앱에서 "코드 입력" 버튼을 누르세요  
3. 아래 초대코드를 입력하세요

🎫 초대코드: $inviteCode

#DearLink #친구초대
  ''';
  
  Share.share(textContent);
}
