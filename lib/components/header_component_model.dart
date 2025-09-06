import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'header_component_widget.dart' show HeaderComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderComponentModel extends FlutterFlowModel<HeaderComponentWidget> {
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
          'text': debugSerializeParam(
            widget?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HeaderComponent',
            searchReference:
                'reference=ShQKDgoEdGV4dBIGd2ZzcHQycgIIA1AAWgR0ZXh0',
            name: 'String',
            nullable: true,
          ),
          'icon': debugSerializeParam(
            widget?.icon,
            ParamType.Widget,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HeaderComponent',
            searchReference:
                'reference=ShgKDgoEaWNvbhIGejl1c251cgYICyoCMAJQAFoEaWNvbg==',
            name: 'Widget',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=HeaderComponent',
        searchReference:
            'reference=Og9IZWFkZXJDb21wb25lbnRQAFoPSGVhZGVyQ29tcG9uZW50',
        widgetClassName: 'HeaderComponent',
      );
}
