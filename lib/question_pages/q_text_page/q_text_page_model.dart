import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'q_text_page_widget.dart' show QTextPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QTextPageModel extends FlutterFlowModel<QTextPageWidget> {
  ///  Local state fields for this page.
  /// User-selected group
  TargetGroup? _targetStatus = TargetGroup.NONE;
  set targetStatus(TargetGroup? value) {
    _targetStatus = value;
    debugLogWidgetClass(this);
  }

  TargetGroup? get targetStatus => _targetStatus;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '답변을 입력해 주세요. is required';
    }

    if (val.length > 200) {
      return '200자까지만 입력할 수 있어요. 조금만 줄여볼까요?';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Save Answer)] action in Button widget.
  ApiCallResponse? _apiResult57u;
  set apiResult57u(ApiCallResponse? value) {
    _apiResult57u = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult57u => _apiResult57u;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'question': debugSerializeParam(
            widget?.question,
            ParamType.DataStruct,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_TextPage',
            searchReference:
                'reference=Si8KEgoIcXVlc3Rpb24SBmRlcGkwYXIZCBQgASoTEhEKCFF1ZXN0aW9uEgV5d3F3ZFABWghxdWVzdGlvbg==',
            name: 'Question',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'targetStatus': debugSerializeParam(
            targetStatus,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_TextPage',
            searchReference:
                'reference=QkoKFQoMdGFyZ2V0U3RhdHVzEgV5bnVlM3IcCBsgASoWGhQKC1RhcmdldEdyb3VwEgV3cnpuNnoTVXNlci1zZWxlY3RlZCBncm91cFABWgx0YXJnZXRTdGF0dXNiClFfVGV4dFBhZ2U=',
            name: 'TargetGroup',
            nullable: true,
          )
        },
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_TextPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResult57u': debugSerializeParam(
            apiResult57u,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_TextPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=Q_TextPage',
        searchReference: 'reference=OgpRX1RleHRQYWdlUAFaClFfVGV4dFBhZ2U=',
        widgetClassName: 'Q_TextPage',
      );
}
