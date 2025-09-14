import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'edit_family_name_button_widget.dart' show EditFamilyNameButtonWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditFamilyNameButtonModel
    extends FlutterFlowModel<EditFamilyNameButtonWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'linkname is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Edit Link Name)] action in Button widget.
  ApiCallResponse? _apiResultber;
  set apiResultber(ApiCallResponse? value) {
    _apiResultber = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultber => _apiResultber;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditFamilyNameButton',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultber': debugSerializeParam(
            apiResultber,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditFamilyNameButton',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=EditFamilyNameButton',
        searchReference:
            'reference=OhRFZGl0RmFtaWx5TmFtZUJ1dHRvblAAWhRFZGl0RmFtaWx5TmFtZUJ1dHRvbg==',
        widgetClassName: 'EditFamilyNameButton',
      );
}
