import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'l_link_success_page_widget.dart' show LLinkSuccessPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LLinkSuccessPageModel extends FlutterFlowModel<LLinkSuccessPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Join By Code)] action in L_LinkSuccessPage widget.
  ApiCallResponse? _apiResultci9;
  set apiResultci9(ApiCallResponse? value) {
    _apiResultci9 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultci9 => _apiResultci9;

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
        widgetParameters: {
          'inviteCode': debugSerializeParam(
            widget?.inviteCode,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LinkSuccessPage',
            searchReference:
                'reference=ShwKFAoKaW52aXRlQ29kZRIGNmtjNHYycgQIAyABUAFaCmludml0ZUNvZGU=',
            name: 'String',
            nullable: true,
          )
        }.withoutNulls,
        actionOutputs: {
          'apiResultci9': debugSerializeParam(
            apiResultci9,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LinkSuccessPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=L_LinkSuccessPage',
        searchReference:
            'reference=OhFMX0xpbmtTdWNjZXNzUGFnZVABWhFMX0xpbmtTdWNjZXNzUGFnZQ==',
        widgetClassName: 'L_LinkSuccessPage',
      );
}
