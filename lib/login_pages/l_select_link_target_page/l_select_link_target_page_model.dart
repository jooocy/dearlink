import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'l_select_link_target_page_widget.dart' show LSelectLinkTargetPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LSelectLinkTargetPageModel
    extends FlutterFlowModel<LSelectLinkTargetPageWidget> {
  ///  Local state fields for this page.
  /// User-selected group
  TargetGroupStatus? _targetStatus = TargetGroupStatus.NONE;
  set targetStatus(TargetGroupStatus? value) {
    _targetStatus = value;
    debugLogWidgetClass(this);
  }

  TargetGroupStatus? get targetStatus => _targetStatus;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Create link)] action in Button widget.
  ApiCallResponse? _apiResultl1a;
  set apiResultl1a(ApiCallResponse? value) {
    _apiResultl1a = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultl1a => _apiResultl1a;

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
        localStates: {
          'targetStatus': debugSerializeParam(
            targetStatus,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_SelectLinkTargetPage',
            searchReference:
                'reference=QlAKFQoMdGFyZ2V0U3RhdHVzEgV5bnVlM3IiCBsgASocGhoKEVRhcmdldEdyb3VwU3RhdHVzEgVxbGU4cnoTVXNlci1zZWxlY3RlZCBncm91cFABWgx0YXJnZXRTdGF0dXNiFkxfU2VsZWN0TGlua1RhcmdldFBhZ2U=',
            name: 'TargetGroupStatus',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultl1a': debugSerializeParam(
            apiResultl1a,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_SelectLinkTargetPage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=L_SelectLinkTargetPage',
        searchReference:
            'reference=OhZMX1NlbGVjdExpbmtUYXJnZXRQYWdlUAFaFkxfU2VsZWN0TGlua1RhcmdldFBhZ2U=',
        widgetClassName: 'L_SelectLinkTargetPage',
      );
}
