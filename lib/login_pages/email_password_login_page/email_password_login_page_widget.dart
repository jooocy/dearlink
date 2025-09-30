import '/auth/supabase_auth/auth_util.dart';
import '/auth/supabase_auth/email_auth.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'email_password_login_page_model.dart';
export 'email_password_login_page_model.dart';

class EmailPasswordLoginPageWidget extends StatefulWidget {
  const EmailPasswordLoginPageWidget({super.key});

  static String routeName = 'EmailPasswordLoginPage';
  static String routePath = '/emailPasswordLoginPage';

  @override
  State<EmailPasswordLoginPageWidget> createState() =>
      _EmailPasswordLoginPageWidgetState();
}

class _EmailPasswordLoginPageWidgetState
    extends State<EmailPasswordLoginPageWidget> {
  late EmailPasswordLoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailPasswordLoginPageModel());
    
    // Initialize controllers
    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
                        '로그인',
                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'HakgyoansimNadeuriOTF',
                          color: FlutterFlowTheme.of(context).oceanBlue70,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '이메일과 비밀번호로 로그인하세요',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
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
                      // Login Button
                      FFButtonWidget(
                        onPressed: () async {
                          final emailText = _model.emailController?.text ?? '';
                          final passwordText = _model.passwordController?.text ?? '';
                          
                          if (emailText.isEmpty || passwordText.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('이메일과 비밀번호를 입력해주세요.'),
                                backgroundColor: FlutterFlowTheme.of(context).red30,
                              ),
                            );
                            return;
                          }

                          try {
                            // Use Supabase email sign in
                            final user = await emailSignInFunc(
                              emailText,
                              passwordText,
                            );

                            if (user != null) {
                              // User successfully signed in
                              // Check if user has links
                              _model.myLinksResponse = await LinksAPIGroup.myLinksCall.call(
                                authToken: currentJwtToken,
                              );

                              if (_model.myLinksResponse?.succeeded ?? false) {
                                final linkUsers = LinksAPIGroup.myLinksCall.linkUsers(
                                  _model.myLinksResponse?.jsonBody ?? '',
                                );

                                if (linkUsers != null && linkUsers.isNotEmpty) {
                                  context.pushNamed(HomePageWidget.routeName);
                                } else {
                                  context.pushNamed(LLinkTargetPageWidget.routeName);
                                }
                              } else {
                                context.pushNamed(LLinkTargetPageWidget.routeName);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('이메일 또는 비밀번호가 올바르지 않습니다.'),
                                  backgroundColor: FlutterFlowTheme.of(context).red30,
                                ),
                              );
                            }
                          } catch (e) {
                            if (e.toString().contains('400')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('잘못된 요청입니다. 이메일과 비밀번호를 확인해주세요.'),
                                  backgroundColor: FlutterFlowTheme.of(context).red30,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('로그인 중 오류가 발생했습니다: ${e.toString()}'),
                                  backgroundColor: FlutterFlowTheme.of(context).red30,
                                ),
                              );
                            }
                          }

                          safeSetState(() {});
                        },
                        text: '로그인',
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
                      // Sign Up Link
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '계정이 없으신가요? ',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              color: FlutterFlowTheme.of(context).coolGrey70,
                              letterSpacing: 0.0,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(EmailPasswordRegisterPageWidget.routeName);
                            },
                            child: Text(
                              '회원가입',
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
