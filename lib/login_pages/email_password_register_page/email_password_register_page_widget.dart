import '/auth/supabase_auth/auth_util.dart';
import '/auth/supabase_auth/email_auth.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'email_password_register_page_model.dart';
export 'email_password_register_page_model.dart';

class EmailPasswordRegisterPageWidget extends StatefulWidget {
  const EmailPasswordRegisterPageWidget({super.key});

  static String routeName = 'EmailPasswordRegisterPage';
  static String routePath = '/emailPasswordRegisterPage';

  @override
  State<EmailPasswordRegisterPageWidget> createState() =>
      _EmailPasswordRegisterPageWidgetState();
}

class _EmailPasswordRegisterPageWidgetState
    extends State<EmailPasswordRegisterPageWidget> {
  late EmailPasswordRegisterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailPasswordRegisterPageModel());
    
    // Initialize controllers
    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
    _model.confirmPasswordController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
    _model.nicknameController ??= TextEditingController();
    _model.nicknameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Header
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '회원가입',
                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'HakgyoansimNadeuriOTF',
                          color: FlutterFlowTheme.of(context).oceanBlue70,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '이메일과 비밀번호로 회원가입하세요',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'HakgyoansimNadeuriOTF',
                          color: FlutterFlowTheme.of(context).coolGrey70,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Form
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Email Field
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.emailController,
                          focusNode: _model.emailFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '이메일',
                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            hintText: 'example@email.com',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue20,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            letterSpacing: 0.0,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailControllerValidator.asValidator(context),
                        ),
                      ),
                      // Password Field
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.passwordController,
                          focusNode: _model.passwordFocusNode,
                          autofocus: false,
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelText: '비밀번호',
                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            hintText: '비밀번호를 입력하세요',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue20,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordVisibility = !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).coolGrey60,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            letterSpacing: 0.0,
                          ),
                          validator: _model.passwordControllerValidator.asValidator(context),
                        ),
                      ),
                      // Confirm Password Field
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.confirmPasswordController,
                          focusNode: _model.confirmPasswordFocusNode,
                          autofocus: false,
                          obscureText: !_model.confirmPasswordVisibility,
                          decoration: InputDecoration(
                            labelText: '비밀번호 확인',
                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            hintText: '비밀번호를 다시 입력하세요',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue20,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.confirmPasswordVisibility = !_model.confirmPasswordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.confirmPasswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).coolGrey60,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            letterSpacing: 0.0,
                          ),
                          validator: _model.confirmPasswordControllerValidator.asValidator(context),
                        ),
                      ),
                      // Nickname Field
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: TextFormField(
                          controller: _model.nicknameController,
                          focusNode: _model.nicknameFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '닉네임',
                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            hintText: '닉네임을 입력하세요',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue20,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).red30,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            letterSpacing: 0.0,
                          ),
                          validator: _model.nicknameControllerValidator.asValidator(context),
                        ),
                      ),
                      // Register Button
                      FFButtonWidget(
                        onPressed: () async {
                          final emailText = _model.emailController?.text ?? '';
                          final passwordText = _model.passwordController?.text ?? '';
                          final confirmPasswordText = _model.confirmPasswordController?.text ?? '';
                          final nicknameText = _model.nicknameController?.text ?? '';
                          
                          if (emailText.isEmpty ||
                              passwordText.isEmpty ||
                              confirmPasswordText.isEmpty ||
                              nicknameText.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('모든 필드를 입력해주세요.'),
                                backgroundColor: FlutterFlowTheme.of(context).red30,
                              ),
                            );
                            return;
                          }

                          if (passwordText != confirmPasswordText) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('비밀번호가 일치하지 않습니다.'),
                                backgroundColor: FlutterFlowTheme.of(context).red30,
                              ),
                            );
                            return;
                          }

                          try {
                            // Use Supabase email create account
                            final user = await emailCreateAccountFunc(
                              emailText,
                              passwordText,
                            );

                            if (user != null) {
                              // Create user profile with nickname via API
                              _model.registerResponse = await UsersAPIGroup
                                  .findOrCreateByEmailCall
                                  .call(
                                supabaseApikey: FFAppConstants.kSupabaseApikey,
                                authToken: currentJwtToken,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('회원가입이 완료되었습니다!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              
                              // Go back to login page
                              context.safePop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('이메일 확인이 필요합니다. 이메일을 확인해주세요.'),
                                  backgroundColor: FlutterFlowTheme.of(context).red30,
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('회원가입 중 오류가 발생했습니다: ${e.toString()}'),
                                backgroundColor: FlutterFlowTheme.of(context).red30,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: '회원가입',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).oceanBlue60,
                          textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            color: Colors.white,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Login Link
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '이미 계정이 있으신가요? ',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              color: FlutterFlowTheme.of(context).coolGrey70,
                              letterSpacing: 0.0,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.safePop();
                            },
                            child: Text(
                              '로그인',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'HakgyoansimNadeuriOTF',
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
