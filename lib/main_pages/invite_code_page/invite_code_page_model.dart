import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/header_component2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'invite_code_page_widget.dart' show InviteCodePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InviteCodePageModel extends FlutterFlowModel<InviteCodePageWidget> {
  ///  Local state fields for this page.

  String _expiresAtDisplay = '99시 99분 99초';
  set expiresAtDisplay(String value) {
    _expiresAtDisplay = value;
    debugLogWidgetClass(this);
  }

  String get expiresAtDisplay => _expiresAtDisplay;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Or Create Active Invite code)] action in InviteCodePage widget.
  ApiCallResponse? _getActiveCode;
  set getActiveCode(ApiCallResponse? value) {
    _getActiveCode = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getActiveCode => _getActiveCode;

  // Stores action output result for [Backend Call - API (Get Or Create Active Invite code)] action in Icon widget.
  ApiCallResponse? _apiResult1jl;
  set apiResult1jl(ApiCallResponse? value) {
    _apiResult1jl = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult1jl => _apiResult1jl;

  // State field(s) for textfield widget.
  FocusNode? textfieldFocusNode;
  TextEditingController? textfieldTextController;
  String? Function(BuildContext, String?)? textfieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Join By Code)] action in Button widget.
  ApiCallResponse? _joinByCodeRes;
  set joinByCodeRes(ApiCallResponse? value) {
    _joinByCodeRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get joinByCodeRes => _joinByCodeRes;

  // Model for HeaderComponent2 component.
  late HeaderComponent2Model headerComponent2Model;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    headerComponent2Model = createModel(context, () => HeaderComponent2Model());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    textfieldFocusNode?.dispose();
    textfieldTextController?.dispose();

    headerComponent2Model.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'expiresAtDisplay': debugSerializeParam(
            expiresAtDisplay,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=InviteCodePage',
            searchReference:
                'reference=QiUKGQoQZXhwaXJlc0F0RGlzcGxheRIFcmVlajcqAhIAcgQIAyABUAFaEGV4cGlyZXNBdERpc3BsYXliDkludml0ZUNvZGVQYWdl',
            name: 'String',
            nullable: false,
          )
        },
        widgetStates: {
          'textfieldText': debugSerializeParam(
            textfieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=InviteCodePage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'getActiveCode': debugSerializeParam(
            getActiveCode,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=InviteCodePage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResult1jl': debugSerializeParam(
            apiResult1jl,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=InviteCodePage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'joinByCodeRes': debugSerializeParam(
            joinByCodeRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=InviteCodePage',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'headerComponent2Model (HeaderComponent2)':
              headerComponent2Model?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=InviteCodePage',
        searchReference:
            'reference=Og5JbnZpdGVDb2RlUGFnZVABWg5JbnZpdGVDb2RlUGFnZQ==',
        widgetClassName: 'InviteCodePage',
      );
}
