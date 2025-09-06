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
import 'edit_member_detail_page_copy_copy_widget.dart'
    show EditMemberDetailPageCopyCopyWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMemberDetailPageCopyCopyModel
    extends FlutterFlowModel<EditMemberDetailPageCopyCopyWidget> {
  ///  Local state fields for this page.

  bool _isReadOnly = false;
  set isReadOnly(bool value) {
    _isReadOnly = value;
    debugLogWidgetClass(this);
  }

  bool get isReadOnly => _isReadOnly;

  String? _token;
  set token(String? value) {
    _token = value;
    debugLogWidgetClass(this);
  }

  String? get token => _token;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get My Main Link)] action in EditMemberDetailPageCopyCopy widget.
  ApiCallResponse? _getMyMainLinkRes;
  set getMyMainLinkRes(ApiCallResponse? value) {
    _getMyMainLinkRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getMyMainLinkRes => _getMyMainLinkRes;

  // Stores action output result for [Backend Call - API (Get Or Create link user)] action in EditMemberDetailPageCopyCopy widget.
  ApiCallResponse? _userProfile;
  set userProfile(ApiCallResponse? value) {
    _userProfile = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get userProfile => _userProfile;

  // Stores action output result for [Backend Call - API (Update link user)] action in Button widget.
  ApiCallResponse? _updateLinkUserRes;
  set updateLinkUserRes(ApiCallResponse? value) {
    _updateLinkUserRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get updateLinkUserRes => _updateLinkUserRes;

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
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel7;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel8;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel9;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel10;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel11;
  // Model for UserHeightInfoComponent.
  late UserNumberInfoComponentModel userHeightInfoComponentModel;
  // Model for UserWeightInfoComponent.
  late UserNumberInfoComponentModel userWeightInfoComponentModel;
  // Model for UserShoeSizeInfoComponent.
  late UserNumberInfoComponentModel userShoeSizeInfoComponentModel;
  // Model for UserClothingSizeInfoComponent.
  late UserStringInfoComponentModel userClothingSizeInfoComponentModel;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel12;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel13;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel14;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel15;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel16;
  // Model for SelectButtonComponent component.
  late SelectButtonComponentModel selectButtonComponentModel17;
  // Model for UserPreferredFoodsInfoComponent.
  late UserStringInfoComponentModel userPreferredFoodsInfoComponentModel;
  // Model for UserAllergiesInfoComponent.
  late UserStringInfoComponentModel userAllergiesInfoComponentModel;
  // Model for UserHealthNotesInfoComponent.
  late UserStringInfoComponentModel userHealthNotesInfoComponentModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
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
    selectButtonComponentModel7 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel8 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel9 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel10 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel11 =
        createModel(context, () => SelectButtonComponentModel());
    userHeightInfoComponentModel =
        createModel(context, () => UserNumberInfoComponentModel());
    userWeightInfoComponentModel =
        createModel(context, () => UserNumberInfoComponentModel());
    userShoeSizeInfoComponentModel =
        createModel(context, () => UserNumberInfoComponentModel());
    userClothingSizeInfoComponentModel =
        createModel(context, () => UserStringInfoComponentModel());
    selectButtonComponentModel12 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel13 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel14 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel15 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel16 =
        createModel(context, () => SelectButtonComponentModel());
    selectButtonComponentModel17 =
        createModel(context, () => SelectButtonComponentModel());
    userPreferredFoodsInfoComponentModel =
        createModel(context, () => UserStringInfoComponentModel());
    userAllergiesInfoComponentModel =
        createModel(context, () => UserStringInfoComponentModel());
    userHealthNotesInfoComponentModel =
        createModel(context, () => UserStringInfoComponentModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    selectButtonComponentModel1.dispose();
    selectButtonComponentModel2.dispose();
    selectButtonComponentModel3.dispose();
    selectButtonComponentModel4.dispose();
    selectButtonComponentModel5.dispose();
    selectButtonComponentModel6.dispose();
    selectButtonComponentModel7.dispose();
    selectButtonComponentModel8.dispose();
    selectButtonComponentModel9.dispose();
    selectButtonComponentModel10.dispose();
    selectButtonComponentModel11.dispose();
    userHeightInfoComponentModel.dispose();
    userWeightInfoComponentModel.dispose();
    userShoeSizeInfoComponentModel.dispose();
    userClothingSizeInfoComponentModel.dispose();
    selectButtonComponentModel12.dispose();
    selectButtonComponentModel13.dispose();
    selectButtonComponentModel14.dispose();
    selectButtonComponentModel15.dispose();
    selectButtonComponentModel16.dispose();
    selectButtonComponentModel17.dispose();
    userPreferredFoodsInfoComponentModel.dispose();
    userAllergiesInfoComponentModel.dispose();
    userHealthNotesInfoComponentModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'userId': debugSerializeParam(
            widget?.userId,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=ShgKEAoGdXNlcklkEgZ2cGFtMTVyBAgDIAFQAVoGdXNlcklk',
            name: 'String',
            nullable: true,
          ),
          'familyRole': debugSerializeParam(
            widget?.familyRole,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=SjMKFAoKZmFtaWx5Um9sZRIGaHJ0ZmNxchsIGyABKhUaEwoKRmFtaWx5Um9sZRIFZDIwNjFQAVoKZmFtaWx5Um9sZQ==',
            name: 'FamilyRole',
            nullable: true,
          ),
          'bloodTypeAbo': debugSerializeParam(
            widget?.bloodTypeAbo,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=SjcKFgoMYmxvb2RUeXBlQWJvEgZ6Znlna3JyHQgbIAEqFxoVCgxCbG9vZFR5cGVBYm8SBWNxa2R2UAFaDGJsb29kVHlwZUFibw==',
            name: 'BloodTypeAbo',
            nullable: true,
          ),
          'bloddTypeRh': debugSerializeParam(
            widget?.bloddTypeRh,
            ParamType.Enum,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=SjUKFQoLYmxvZGRUeXBlUmgSBmc4eTdjcXIcCBsgASoWGhQKC0Jsb29kVHlwZVJoEgVzcjh3OVABWgtibG9kZFR5cGVSaA==',
            name: 'BloodTypeRh',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isReadOnly': debugSerializeParam(
            isReadOnly,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=QiQKEwoKaXNSZWFkT25seRIFMmZ6dTMqBxIFZmFsc2VyBAgFIAFQAVoKaXNSZWFkT25seWIcRWRpdE1lbWJlckRldGFpbFBhZ2VDb3B5Q29weQ==',
            name: 'bool',
            nullable: false,
          ),
          'token': debugSerializeParam(
            token,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            searchReference:
                'reference=QhoKDgoFdG9rZW4SBXlvczE0KgISAHIECAMgAFABWgV0b2tlbmIcRWRpdE1lbWJlckRldGFpbFBhZ2VDb3B5Q29weQ==',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'getMyMainLinkRes': debugSerializeParam(
            getMyMainLinkRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'userProfile': debugSerializeParam(
            userProfile,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'updateLinkUserRes': debugSerializeParam(
            updateLinkUserRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
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
          'selectButtonComponentModel7 (SelectButtonComponent)':
              selectButtonComponentModel7?.toWidgetClassDebugData(),
          'selectButtonComponentModel8 (SelectButtonComponent)':
              selectButtonComponentModel8?.toWidgetClassDebugData(),
          'selectButtonComponentModel9 (SelectButtonComponent)':
              selectButtonComponentModel9?.toWidgetClassDebugData(),
          'selectButtonComponentModel10 (SelectButtonComponent)':
              selectButtonComponentModel10?.toWidgetClassDebugData(),
          'selectButtonComponentModel11 (SelectButtonComponent)':
              selectButtonComponentModel11?.toWidgetClassDebugData(),
          'userHeightInfoComponentModel (UserHeightInfoComponent)':
              userHeightInfoComponentModel?.toWidgetClassDebugData(),
          'userWeightInfoComponentModel (UserWeightInfoComponent)':
              userWeightInfoComponentModel?.toWidgetClassDebugData(),
          'userShoeSizeInfoComponentModel (UserShoeSizeInfoComponent)':
              userShoeSizeInfoComponentModel?.toWidgetClassDebugData(),
          'userClothingSizeInfoComponentModel (UserClothingSizeInfoComponent)':
              userClothingSizeInfoComponentModel?.toWidgetClassDebugData(),
          'selectButtonComponentModel12 (SelectButtonComponent)':
              selectButtonComponentModel12?.toWidgetClassDebugData(),
          'selectButtonComponentModel13 (SelectButtonComponent)':
              selectButtonComponentModel13?.toWidgetClassDebugData(),
          'selectButtonComponentModel14 (SelectButtonComponent)':
              selectButtonComponentModel14?.toWidgetClassDebugData(),
          'selectButtonComponentModel15 (SelectButtonComponent)':
              selectButtonComponentModel15?.toWidgetClassDebugData(),
          'selectButtonComponentModel16 (SelectButtonComponent)':
              selectButtonComponentModel16?.toWidgetClassDebugData(),
          'selectButtonComponentModel17 (SelectButtonComponent)':
              selectButtonComponentModel17?.toWidgetClassDebugData(),
          'userPreferredFoodsInfoComponentModel (UserPreferredFoodsInfoComponent)':
              userPreferredFoodsInfoComponentModel?.toWidgetClassDebugData(),
          'userAllergiesInfoComponentModel (UserAllergiesInfoComponent)':
              userAllergiesInfoComponentModel?.toWidgetClassDebugData(),
          'userHealthNotesInfoComponentModel (UserHealthNotesInfoComponent)':
              userHealthNotesInfoComponentModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=EditMemberDetailPageCopyCopy',
        searchReference:
            'reference=OhxFZGl0TWVtYmVyRGV0YWlsUGFnZUNvcHlDb3B5UAFaHEVkaXRNZW1iZXJEZXRhaWxQYWdlQ29weUNvcHk=',
        widgetClassName: 'EditMemberDetailPageCopyCopy',
      );
}
