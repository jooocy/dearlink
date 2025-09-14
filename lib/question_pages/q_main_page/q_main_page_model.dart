import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'q_main_page_widget.dart' show QMainPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QMainPageModel extends FlutterFlowModel<QMainPageWidget> {
  ///  Local state fields for this page.

  bool _isReadOnly = true;
  set isReadOnly(bool value) {
    _isReadOnly = value;
    debugLogWidgetClass(this);
  }

  bool get isReadOnly => _isReadOnly;

  QuestionStruct? _selectedQuestion;
  set selectedQuestion(QuestionStruct? value) {
    _selectedQuestion = value;
    debugLogWidgetClass(this);
  }

  QuestionStruct? get selectedQuestion =>
      _selectedQuestion?..logger = () => debugLogWidgetClass(this);
  void updateSelectedQuestionStruct(Function(QuestionStruct) updateFn) {
    updateFn(selectedQuestion ??= QuestionStruct());
    debugLogWidgetClass(this);
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Generate daily question)] action in Q_MainPage widget.
  ApiCallResponse? _apiResultiid;
  set apiResultiid(ApiCallResponse? value) {
    _apiResultiid = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultiid => _apiResultiid;

  // Stores action output result for [Backend Call - API (Get My Main Link)] action in Q_MainPage widget.
  ApiCallResponse? _getMyMainLinkRes;
  set getMyMainLinkRes(ApiCallResponse? value) {
    _getMyMainLinkRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getMyMainLinkRes => _getMyMainLinkRes;

  // Stores action output result for [Backend Call - API (Get Or Create link user)] action in Q_MainPage widget.
  ApiCallResponse? _userProfile;
  set userProfile(ApiCallResponse? value) {
    _userProfile = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get userProfile => _userProfile;

  // Stores action output result for [Backend Call - API (Generate daily question Test)] action in Icon widget.
  ApiCallResponse? _apiResultxlm;
  set apiResultxlm(ApiCallResponse? value) {
    _apiResultxlm = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultxlm => _apiResultxlm;

  Completer<ApiCallResponse>? apiRequestCompleter;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isReadOnly': debugSerializeParam(
            isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
            searchReference:
                'reference=QiQKEwoKaXNSZWFkT25seRIFMmZ6dTMqBxIFZmFsc2VyBAgFIAFQAVoKaXNSZWFkT25seWIKUV9NYWluUGFnZQ==',
            name: 'bool',
            nullable: false,
          ),
          'selectedQuestion': debugSerializeParam(
            selectedQuestion,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
            searchReference:
                'reference=QjQKGQoQc2VsZWN0ZWRRdWVzdGlvbhIFOW56YWtyFwgUKhMSEQoIUXVlc3Rpb24SBXl3cXdkUAFaEHNlbGVjdGVkUXVlc3Rpb25iClFfTWFpblBhZ2U=',
            name: 'Question',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultiid': debugSerializeParam(
            apiResultiid,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'getMyMainLinkRes': debugSerializeParam(
            getMyMainLinkRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'userProfile': debugSerializeParam(
            userProfile,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultxlm': debugSerializeParam(
            apiResultxlm,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=Q_MainPage',
        searchReference: 'reference=OgpRX01haW5QYWdlUAFaClFfTWFpblBhZ2U=',
        widgetClassName: 'Q_MainPage',
      );
}
