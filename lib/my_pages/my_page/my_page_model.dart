import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'my_page_widget.dart' show MyPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPageModel extends FlutterFlowModel<MyPageWidget> {
  ///  Local state fields for this page.

  bool _isReadOnly = true;
  set isReadOnly(bool value) {
    _isReadOnly = value;
    debugLogWidgetClass(this);
  }

  bool get isReadOnly => _isReadOnly;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get My Main Link)] action in MyPage widget.
  ApiCallResponse? _getMyMainLinkRes;
  set getMyMainLinkRes(ApiCallResponse? value) {
    _getMyMainLinkRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getMyMainLinkRes => _getMyMainLinkRes;

  // Stores action output result for [Backend Call - API (Get Or Create link user)] action in MyPage widget.
  ApiCallResponse? _userProfile;
  set userProfile(ApiCallResponse? value) {
    _userProfile = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get userProfile => _userProfile;

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
        localStates: {
          'isReadOnly': debugSerializeParam(
            isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=MyPage',
            searchReference:
                'reference=QiQKEwoKaXNSZWFkT25seRIFMmZ6dTMqBxIFZmFsc2VyBAgFIAFQAVoKaXNSZWFkT25seWIGTXlQYWdl',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'getMyMainLinkRes': debugSerializeParam(
            getMyMainLinkRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=MyPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'userProfile': debugSerializeParam(
            userProfile,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=MyPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=MyPage',
        searchReference: 'reference=OgZNeVBhZ2VQAVoGTXlQYWdl',
        widgetClassName: 'MyPage',
      );
}
