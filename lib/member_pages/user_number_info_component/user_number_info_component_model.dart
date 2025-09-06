import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'user_number_info_component_widget.dart'
    show UserNumberInfoComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserNumberInfoComponentModel
    extends FlutterFlowModel<UserNumberInfoComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'isReadOnly': debugSerializeParam(
            widget?.isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=UserNumberInfoComponent',
            searchReference:
                'reference=SiUKFAoKaXNSZWFkT25seRIGODdpbnJmKgcSBWZhbHNlcgQIBSABUABaCmlzUmVhZE9ubHk=',
            name: 'bool',
            nullable: false,
          ),
          'initailValue': debugSerializeParam(
            widget?.initailValue,
            ParamType.double,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=UserNumberInfoComponent',
            searchReference:
                'reference=SiUKFgoMaW5pdGFpbFZhbHVlEgZpMTY0NngqAxIBMDoCAQJyAggCUABaDGluaXRhaWxWYWx1ZQ==',
            name: 'double',
            nullable: false,
          ),
          'endText': debugSerializeParam(
            widget?.endText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=UserNumberInfoComponent',
            searchReference:
                'reference=ShkKEQoHZW5kVGV4dBIGZ2RhN2s0cgQIAyAAUABaB2VuZFRleHQ=',
            name: 'String',
            nullable: true,
          ),
          'labelText': debugSerializeParam(
            widget?.labelText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=UserNumberInfoComponent',
            searchReference:
                'reference=ShsKEwoJbGFiZWxUZXh0EgZxdzFlMDRyBAgDIAFQAFoJbGFiZWxUZXh0',
            name: 'String',
            nullable: true,
          )
        }.withoutNulls,
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=UserNumberInfoComponent',
            name: 'String',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=UserNumberInfoComponent',
        searchReference:
            'reference=OhdVc2VyTnVtYmVySW5mb0NvbXBvbmVudFAAWhdVc2VyTnVtYmVySW5mb0NvbXBvbmVudA==',
        widgetClassName: 'UserNumberInfoComponent',
      );
}
