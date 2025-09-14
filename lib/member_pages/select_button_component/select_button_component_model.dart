import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'select_button_component_widget.dart' show SelectButtonComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectButtonComponentModel
    extends FlutterFlowModel<SelectButtonComponentWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'outputValue': debugSerializeParam(
            widget?.outputValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=Si4KFQoLb3V0cHV0VmFsdWUSBjh3ZWZneCoGEgRnb29kOgUDBAoNEHIECAMgAHoAUABaC291dHB1dFZhbHVl',
            name: 'String',
            nullable: false,
          ),
          'width': debugSerializeParam(
            widget?.width,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=Sh0KDwoFd2lkdGgSBjZ2NDJjaCoEEgIzNHIECAEgAFAAWgV3aWR0aA==',
            name: 'int',
            nullable: false,
          ),
          'height': debugSerializeParam(
            widget?.height,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=ShwKEAoGaGVpZ2h0EgZhNnBvc3lyBAgBIAB6AjM0UABaBmhlaWdodA==',
            name: 'int',
            nullable: true,
          ),
          'displayText': debugSerializeParam(
            widget?.displayText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=SiUKFQoLZGlzcGxheVRleHQSBmZ2M2dpbyoGEgRuaWNlcgQIAyAAUABaC2Rpc3BsYXlUZXh0',
            name: 'String',
            nullable: false,
          ),
          'isReadOnly': debugSerializeParam(
            widget?.isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=SiQKFAoKaXNSZWFkT25seRIGaWEwbHhvKgYSBHRydWVyBAgFIAFQAFoKaXNSZWFkT25seQ==',
            name: 'bool',
            nullable: false,
          ),
          'widgetValue': debugSerializeParam(
            widget?.widgetValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=SelectButtonComponent',
            searchReference:
                'reference=Sh0KFQoLd2lkZ2V0VmFsdWUSBmM2NHlsY3IECAMgAVAAWgt3aWRnZXRWYWx1ZQ==',
            name: 'String',
            nullable: true,
          )
        }.withoutNulls,
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=SelectButtonComponent',
        searchReference:
            'reference=OhVTZWxlY3RCdXR0b25Db21wb25lbnRQAFoVU2VsZWN0QnV0dG9uQ29tcG9uZW50',
        widgetClassName: 'SelectButtonComponent',
      );
}
