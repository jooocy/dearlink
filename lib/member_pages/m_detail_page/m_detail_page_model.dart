import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/member_pages/select_button_component/select_button_component_widget.dart';
import '/member_pages/user_number_info_component/user_number_info_component_widget.dart';
import '/member_pages/user_string_info_component/user_string_info_component_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'm_detail_page_widget.dart' show MDetailPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MDetailPageModel extends FlutterFlowModel<MDetailPageWidget> {
  ///  Local state fields for this page.

  bool _isReadOnly = true;
  set isReadOnly(bool value) {
    _isReadOnly = value;
    debugLogWidgetClass(this);
  }

  bool get isReadOnly => _isReadOnly;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get My Main Link)] action in M_DetailPage widget.
  ApiCallResponse? _getMyMainLinkRes;
  set getMyMainLinkRes(ApiCallResponse? value) {
    _getMyMainLinkRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getMyMainLinkRes => _getMyMainLinkRes;

  // Stores action output result for [Backend Call - API (Get Or Create link user)] action in M_DetailPage widget.
  ApiCallResponse? _userProfile;
  set userProfile(ApiCallResponse? value) {
    _userProfile = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get userProfile => _userProfile;

  // Model for UserNumberInfoComponent component.
  late UserNumberInfoComponentModel userNumberInfoComponentModel1;
  // Model for UserNumberInfoComponent component.
  late UserNumberInfoComponentModel userNumberInfoComponentModel2;
  // Model for UserNumberInfoComponent component.
  late UserNumberInfoComponentModel userNumberInfoComponentModel3;
  // Model for UserStringInfoComponent component.
  late UserStringInfoComponentModel userStringInfoComponentModel1;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel1;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel2;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel3;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel4;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel5;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel6;
  // Model for UserStringInfoComponent component.
  late UserStringInfoComponentModel userStringInfoComponentModel2;
  // Model for UserStringInfoComponent component.
  late UserStringInfoComponentModel userStringInfoComponentModel3;
  // Model for UserStringInfoComponent component.
  late UserStringInfoComponentModel userStringInfoComponentModel4;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    userNumberInfoComponentModel1 =
        createModel(context, () => UserNumberInfoComponentModel());
    userNumberInfoComponentModel2 =
        createModel(context, () => UserNumberInfoComponentModel());
    userNumberInfoComponentModel3 =
        createModel(context, () => UserNumberInfoComponentModel());
    userStringInfoComponentModel1 =
        createModel(context, () => UserStringInfoComponentModel());
    selectButtonComponentModel1 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel2 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel3 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel4 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel5 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel6 =
        createModel(context, () => SelectButtonComponentModel());
    userStringInfoComponentModel2 =
        createModel(context, () => UserStringInfoComponentModel());
    userStringInfoComponentModel3 =
        createModel(context, () => UserStringInfoComponentModel());
    userStringInfoComponentModel4 =
        createModel(context, () => UserStringInfoComponentModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    userNumberInfoComponentModel1.dispose();
    userNumberInfoComponentModel2.dispose();
    userNumberInfoComponentModel3.dispose();
    userStringInfoComponentModel1.dispose();
    selectButtonComponentModel1.dispose();
    selectButtonComponentModel2.dispose();
    selectButtonComponentModel3.dispose();
    selectButtonComponentModel4.dispose();
    selectButtonComponentModel5.dispose();
    selectButtonComponentModel6.dispose();
    userStringInfoComponentModel2.dispose();
    userStringInfoComponentModel3.dispose();
    userStringInfoComponentModel4.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'userId': debugSerializeParam(
            widget?.userId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=M_DetailPage',
            searchReference:
                'reference=ShgKEAoGdXNlcklkEgZ2cGFtMTVyBAgDIAFQAVoGdXNlcklk',
            name: 'String',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isReadOnly': debugSerializeParam(
            isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=M_DetailPage',
            searchReference:
                'reference=QiQKEwoKaXNSZWFkT25seRIFMmZ6dTMqBxIFZmFsc2VyBAgFIAFQAVoKaXNSZWFkT25seWIMTV9EZXRhaWxQYWdl',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'getMyMainLinkRes': debugSerializeParam(
            getMyMainLinkRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=M_DetailPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'userProfile': debugSerializeParam(
            userProfile,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=M_DetailPage',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'userNumberInfoComponentModel1 (UserNumberInfoComponent)':
              userNumberInfoComponentModel1?.toWidgetClassDebugData(),
          'userNumberInfoComponentModel2 (UserNumberInfoComponent)':
              userNumberInfoComponentModel2?.toWidgetClassDebugData(),
          'userNumberInfoComponentModel3 (UserNumberInfoComponent)':
              userNumberInfoComponentModel3?.toWidgetClassDebugData(),
          'userStringInfoComponentModel1 (UserStringInfoComponent)':
              userStringInfoComponentModel1?.toWidgetClassDebugData(),
          'selectButtonComponentModel1 (SelectButtonComponent)':
              selectButtonComponentModel1?.toWidgetClassDebugData(),
          'selectButtonComponentModel2 (SelectButtonComponent)':
              selectButtonComponentModel2?.toWidgetClassDebugData(),
          'selectButtonComponentModel3 (SelectButtonComponent)':
              selectButtonComponentModel3?.toWidgetClassDebugData(),
          'selectButtonComponentModel4 (SelectButtonComponent)':
              selectButtonComponentModel4?.toWidgetClassDebugData(),
          'selectButtonComponentModel5 (SelectButtonComponent)':
              selectButtonComponentModel5?.toWidgetClassDebugData(),
          'selectButtonComponentModel6 (SelectButtonComponent)':
              selectButtonComponentModel6?.toWidgetClassDebugData(),
          'userStringInfoComponentModel2 (UserStringInfoComponent)':
              userStringInfoComponentModel2?.toWidgetClassDebugData(),
          'userStringInfoComponentModel3 (UserStringInfoComponent)':
              userStringInfoComponentModel3?.toWidgetClassDebugData(),
          'userStringInfoComponentModel4 (UserStringInfoComponent)':
              userStringInfoComponentModel4?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=M_DetailPage',
        searchReference: 'reference=OgxNX0RldGFpbFBhZ2VQAVoMTV9EZXRhaWxQYWdl',
        widgetClassName: 'M_DetailPage',
      );
}
