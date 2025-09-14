import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'q_select_page_widget.dart' show QSelectPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QSelectPageModel extends FlutterFlowModel<QSelectPageWidget> {
  ///  Local state fields for this page.
  /// User-selected group
  TargetGroup? _targetStatus = TargetGroup.NONE;
  set targetStatus(TargetGroup? value) {
    _targetStatus = value;
    debugLogWidgetClass(this);
  }

  TargetGroup? get targetStatus => _targetStatus;

  late LoggableList<QuestionOptionStruct> _selectedQuestionOptions =
      LoggableList([]);
  set selectedQuestionOptions(List<QuestionOptionStruct> value) {
    if (value != null) {
      _selectedQuestionOptions = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<QuestionOptionStruct> get selectedQuestionOptions =>
      _selectedQuestionOptions?..logger = () => debugLogWidgetClass(this);
  void addToSelectedQuestionOptions(QuestionOptionStruct item) =>
      selectedQuestionOptions.add(item);
  void removeFromSelectedQuestionOptions(QuestionOptionStruct item) =>
      selectedQuestionOptions.remove(item);
  void removeAtIndexFromSelectedQuestionOptions(int index) =>
      selectedQuestionOptions.removeAt(index);
  void insertAtIndexInSelectedQuestionOptions(
          int index, QuestionOptionStruct item) =>
      selectedQuestionOptions.insert(index, item);
  void updateSelectedQuestionOptionsAtIndex(
          int index, Function(QuestionOptionStruct) updateFn) =>
      selectedQuestionOptions[index] = updateFn(selectedQuestionOptions[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Save Answer)] action in Button widget.
  ApiCallResponse? _aveAnswer2;
  set aveAnswer2(ApiCallResponse? value) {
    _aveAnswer2 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get aveAnswer2 => _aveAnswer2;

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
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_SelectPage',
            searchReference:
                'reference=Si8KEgoIcXVlc3Rpb24SBnc5Z3I5dHIZCBQgASoTEhEKCFF1ZXN0aW9uEgV5d3F3ZFABWghxdWVzdGlvbg==',
            name: 'Question',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'targetStatus': debugSerializeParam(
            targetStatus,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_SelectPage',
            searchReference:
                'reference=QkoKFQoMdGFyZ2V0U3RhdHVzEgV5bnVlM3IcCBsgASoWGhQKC1RhcmdldEdyb3VwEgV3cnpuNnoTVXNlci1zZWxlY3RlZCBncm91cFABWgx0YXJnZXRTdGF0dXNiDFFfU2VsZWN0UGFnZQ==',
            name: 'TargetGroup',
            nullable: true,
          ),
          'selectedQuestionOptions': debugSerializeParam(
            selectedQuestionOptions,
            ParamType.DataStruct,
            isList: true,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_SelectPage',
            searchReference:
                'reference=QkMKIAoXc2VsZWN0ZWRRdWVzdGlvbk9wdGlvbnMSBTN1djZoch8SAggUKhkSFwoOUXVlc3Rpb25PcHRpb24SBTNmOHI1UAFaF3NlbGVjdGVkUXVlc3Rpb25PcHRpb25zYgxRX1NlbGVjdFBhZ2U=',
            name: 'QuestionOption',
            nullable: false,
          )
        },
        actionOutputs: {
          'aveAnswer2': debugSerializeParam(
            aveAnswer2,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_SelectPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=Q_SelectPage',
        searchReference: 'reference=OgxRX1NlbGVjdFBhZ2VQAVoMUV9TZWxlY3RQYWdl',
        widgetClassName: 'Q_SelectPage',
      );
}
