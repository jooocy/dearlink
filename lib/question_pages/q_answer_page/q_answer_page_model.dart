import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'q_answer_page_widget.dart' show QAnswerPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QAnswerPageModel extends FlutterFlowModel<QAnswerPageWidget> {
  ///  Local state fields for this page.

  bool _isReadOnly = true;
  set isReadOnly(bool value) {
    _isReadOnly = value;
    debugLogWidgetClass(this);
  }

  bool get isReadOnly => _isReadOnly;

  AnswerWIthUserStruct? _myAnswers;
  set myAnswers(AnswerWIthUserStruct? value) {
    _myAnswers = value;
    debugLogWidgetClass(this);
  }

  AnswerWIthUserStruct? get myAnswers =>
      _myAnswers?..logger = () => debugLogWidgetClass(this);
  void updateMyAnswersStruct(Function(AnswerWIthUserStruct) updateFn) {
    updateFn(myAnswers ??= AnswerWIthUserStruct());
    debugLogWidgetClass(this);
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Answers By Question)] action in Q_AnswerPage widget.
  ApiCallResponse? _apiResultGetAnswerByQuestion;
  set apiResultGetAnswerByQuestion(ApiCallResponse? value) {
    _apiResultGetAnswerByQuestion = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultGetAnswerByQuestion =>
      _apiResultGetAnswerByQuestion;

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
          'question': debugSerializeParam(
            widget?.question,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerPage',
            searchReference:
                'reference=Si8KEgoIcXVlc3Rpb24SBjhjMmN4cHIZCBQgASoTEhEKCFF1ZXN0aW9uEgV5d3F3ZFABWghxdWVzdGlvbg==',
            name: 'Question',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isReadOnly': debugSerializeParam(
            isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerPage',
            searchReference:
                'reference=QiQKEwoKaXNSZWFkT25seRIFMmZ6dTMqBxIFZmFsc2VyBAgFIAFQAVoKaXNSZWFkT25seWIMUV9BbnN3ZXJQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'myAnswers': debugSerializeParam(
            myAnswers,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerPage',
            searchReference:
                'reference=QjMKEgoJbXlBbnN3ZXJzEgUzOG91enIdCBQqGRIXCg5BbnN3ZXJXSXRoVXNlchIFYmJsbWVQAVoJbXlBbnN3ZXJzYgxRX0Fuc3dlclBhZ2U=',
            name: 'AnswerWIthUser',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultGetAnswerByQuestion': debugSerializeParam(
            apiResultGetAnswerByQuestion,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=Q_AnswerPage',
        searchReference: 'reference=OgxRX0Fuc3dlclBhZ2VQAVoMUV9BbnN3ZXJQYWdl',
        widgetClassName: 'Q_AnswerPage',
      );
}
