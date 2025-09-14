import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'q_o_x_page_widget.dart' show QOXPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QOXPageModel extends FlutterFlowModel<QOXPageWidget> {
  ///  Local state fields for this page.
  /// User-selected group
  TargetGroup? _targetStatus = TargetGroup.NONE;
  set targetStatus(TargetGroup? value) {
    _targetStatus = value;
    debugLogWidgetClass(this);
  }

  TargetGroup? get targetStatus => _targetStatus;

  late LoggableList<QuestionOptionStruct> _selectedOptions = LoggableList([]);
  set selectedOptions(List<QuestionOptionStruct> value) {
    if (value != null) {
      _selectedOptions = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<QuestionOptionStruct> get selectedOptions =>
      _selectedOptions?..logger = () => debugLogWidgetClass(this);
  void addToSelectedOptions(QuestionOptionStruct item) =>
      selectedOptions.add(item);
  void removeFromSelectedOptions(QuestionOptionStruct item) =>
      selectedOptions.remove(item);
  void removeAtIndexFromSelectedOptions(int index) =>
      selectedOptions.removeAt(index);
  void insertAtIndexInSelectedOptions(int index, QuestionOptionStruct item) =>
      selectedOptions.insert(index, item);
  void updateSelectedOptionsAtIndex(
          int index, Function(QuestionOptionStruct) updateFn) =>
      selectedOptions[index] = updateFn(selectedOptions[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Save Answer)] action in Button widget.
  ApiCallResponse? _saveAnswer;
  set saveAnswer(ApiCallResponse? value) {
    _saveAnswer = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get saveAnswer => _saveAnswer;

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
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_OXPage',
            searchReference:
                'reference=Si8KEgoIcXVlc3Rpb24SBjk5YjI2ZnIZCBQgASoTEhEKCFF1ZXN0aW9uEgV5d3F3ZFABWghxdWVzdGlvbg==',
            name: 'Question',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'targetStatus': debugSerializeParam(
            targetStatus,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_OXPage',
            searchReference:
                'reference=QkoKFQoMdGFyZ2V0U3RhdHVzEgV5bnVlM3IcCBsgASoWGhQKC1RhcmdldEdyb3VwEgV3cnpuNnoTVXNlci1zZWxlY3RlZCBncm91cFABWgx0YXJnZXRTdGF0dXNiCFFfT1hQYWdl',
            name: 'TargetGroup',
            nullable: true,
          ),
          'selectedOptions': debugSerializeParam(
            selectedOptions,
            ParamType.DataStruct,
            isList: true,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_OXPage',
            searchReference:
                'reference=QjsKGAoPc2VsZWN0ZWRPcHRpb25zEgV4Mm42anIfEgIIFCoZEhcKDlF1ZXN0aW9uT3B0aW9uEgUzZjhyNVABWg9zZWxlY3RlZE9wdGlvbnNiCFFfT1hQYWdl',
            name: 'QuestionOption',
            nullable: false,
          )
        },
        actionOutputs: {
          'saveAnswer': debugSerializeParam(
            saveAnswer,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_OXPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=Q_OXPage',
        searchReference: 'reference=OghRX09YUGFnZVABWghRX09YUGFnZQ==',
        widgetClassName: 'Q_OXPage',
      );
}
