import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'l_login_main_page_widget.dart' show LLoginMainPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LLoginMainPageModel extends FlutterFlowModel<LLoginMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - kakaoSignInFunc] action in Row widget.
  AuthUserStruct? _customKakaoOAuth;
  set customKakaoOAuth(AuthUserStruct? value) {
    _customKakaoOAuth = value;
    debugLogWidgetClass(this);
  }

  AuthUserStruct? get customKakaoOAuth => _customKakaoOAuth;

  // Stores action output result for [Backend Call - API (Find Or Create By  Email)] action in Row widget.
  ApiCallResponse? _apiResultlgw;
  set apiResultlgw(ApiCallResponse? value) {
    _apiResultlgw = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultlgw => _apiResultlgw;

  // Stores action output result for [Backend Call - API (My Links)] action in Row widget.
  ApiCallResponse? _isLinkUser;
  set isLinkUser(ApiCallResponse? value) {
    _isLinkUser = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get isLinkUser => _isLinkUser;

  // Stores action output result for [Custom Action - googleSignInFunc] action in Row widget.
  AuthUserStruct? _customGoogleAuthLogin;
  set customGoogleAuthLogin(AuthUserStruct? value) {
    _customGoogleAuthLogin = value;
    debugLogWidgetClass(this);
  }

  AuthUserStruct? get customGoogleAuthLogin => _customGoogleAuthLogin;

  // Stores action output result for [Backend Call - API (Find Or Create By  Email)] action in Row widget.
  ApiCallResponse? _findOrCreateAPIRes;
  set findOrCreateAPIRes(ApiCallResponse? value) {
    _findOrCreateAPIRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get findOrCreateAPIRes => _findOrCreateAPIRes;

  // Stores action output result for [Backend Call - API (My Links)] action in Row widget.
  ApiCallResponse? _linkUserList;
  set linkUserList(ApiCallResponse? value) {
    _linkUserList = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get linkUserList => _linkUserList;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        actionOutputs: {
          'customKakaoOAuth': debugSerializeParam(
            customKakaoOAuth,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'authUser',
            nullable: true,
          ),
          'apiResultlgw': debugSerializeParam(
            apiResultlgw,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'isLinkUser': debugSerializeParam(
            isLinkUser,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'customGoogleAuthLogin': debugSerializeParam(
            customGoogleAuthLogin,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'authUser',
            nullable: true,
          ),
          'findOrCreateAPIRes': debugSerializeParam(
            findOrCreateAPIRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'linkUserList': debugSerializeParam(
            linkUserList,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LoginMainPage',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=L_LoginMainPage',
        searchReference:
            'reference=Og9MX0xvZ2luTWFpblBhZ2VQAVoPTF9Mb2dpbk1haW5QYWdl',
        widgetClassName: 'L_LoginMainPage',
      );
}
