import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/edit_family_name_button/edit_family_name_button_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool _hasLinkusers = true;
  set hasLinkusers(bool value) {
    _hasLinkusers = value;
    debugLogWidgetClass(this);
  }

  bool get hasLinkusers => _hasLinkusers;

  bool _isInviteSectionExpanded = false;
  set isInviteSectionExpanded(bool value) {
    _isInviteSectionExpanded = value;
    debugLogWidgetClass(this);
  }

  bool get isInviteSectionExpanded => _isInviteSectionExpanded;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get My Main Link)] action in HomePage widget.
  ApiCallResponse? _getMyMainLinkRes;
  set getMyMainLinkRes(ApiCallResponse? value) {
    _getMyMainLinkRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getMyMainLinkRes => _getMyMainLinkRes;

  // Stores action output result for [Backend Call - API (Get Or Create Active Invite code)] action in Button widget.
  ApiCallResponse? _getInviteCode;
  set getInviteCode(ApiCallResponse? value) {
    _getInviteCode = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getInviteCode => _getInviteCode;

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
          'hasLinkusers': debugSerializeParam(
            hasLinkusers,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HomePage',
            searchReference:
                'reference=QiYKFQoMaGFzTGlua3VzZXJzEgVqajEyOSoHEgVmYWxzZXIECAUgAVABWgxoYXNMaW5rdXNlcnNiCEhvbWVQYWdl',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'getMyMainLinkRes': debugSerializeParam(
            getMyMainLinkRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HomePage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'getInviteCode': debugSerializeParam(
            getInviteCode,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HomePage',
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
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=HomePage',
        searchReference: 'reference=OghIb21lUGFnZVABWghIb21lUGFnZQ==',
        widgetClassName: 'HomePage',
      );
}
