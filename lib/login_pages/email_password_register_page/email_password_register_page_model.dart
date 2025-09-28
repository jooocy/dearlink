import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'email_password_register_page_widget.dart' show EmailPasswordRegisterPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailPasswordRegisterPageModel extends FlutterFlowModel<EmailPasswordRegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '이메일을 입력해주세요.';
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
      return '올바른 이메일 형식을 입력해주세요.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }

    if (val.length < 6) {
      return '비밀번호는 최소 6자 이상이어야 합니다.';
    }
    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  String? _confirmPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '비밀번호 확인을 입력해주세요.';
    }

    if (val != passwordController?.text) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }

  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameController;
  String? Function(BuildContext, String?)? nicknameControllerValidator;
  String? _nicknameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '닉네임을 입력해주세요.';
    }

    if (val.length < 2) {
      return '닉네임은 최소 2자 이상이어야 합니다.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Email Password Register)] action in Button widget.
  ApiCallResponse? _registerResponse;
  set registerResponse(ApiCallResponse? value) {
    _registerResponse = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get registerResponse => _registerResponse;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};

  @override
  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordControllerValidator = _confirmPasswordControllerValidator;
    nicknameControllerValidator = _nicknameControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    nicknameFocusNode?.dispose();
    nicknameController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {},
        actionOutputs: {
          'registerResponse': debugSerializeParam(
            registerResponse,
            ParamType.ApiResponse,
            link: 'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=EmailPasswordRegisterPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
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
        link: 'https://app.flutterflow.io/project/dear-link-em0ufw/tab=uiBuilder&page=EmailPasswordRegisterPage',
        searchReference: 'reference=OghIb21lUGFnZQ==',
        widgetClassName: 'EmailPasswordRegisterPage',
      );
}
