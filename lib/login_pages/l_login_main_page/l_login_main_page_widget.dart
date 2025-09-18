import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'l_login_main_page_model.dart';
export 'l_login_main_page_model.dart';

class LLoginMainPageWidget extends StatefulWidget {
  const LLoginMainPageWidget({super.key});

  static String routeName = 'L_LoginMainPage';
  static String routePath = '/lLoginMainPage';

  @override
  State<LLoginMainPageWidget> createState() => _LLoginMainPageWidgetState();
}

class _LLoginMainPageWidgetState extends State<LLoginMainPageWidget>
    with RouteAware {
  late LLoginMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LLoginMainPageModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LLoginMainPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/LoginMainBackground.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 120.0,
                  constraints: BoxConstraints(
                    minHeight: 120.0,
                    maxHeight: 600.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFEE500),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.customKakaoOAuth =
                                await actions.kakaoSignInFunc();
                            _model.apiResultlgw = await UsersAPIGroup
                                .findOrCreateByEmailCall
                                .call(
                              supabaseApikey: FFAppConstants.kSupabaseApikey,
                              authToken: currentJwtToken,
                            );

                            if ((_model.apiResultlgw?.succeeded ?? true)) {
                              _model.isLinkUser =
                                  await LinksAPIGroup.myLinksCall.call(
                                authToken: currentJwtToken,
                                supabaseApikey: FFAppConstants.kSupabaseApikey,
                              );

                              if (LinksAPIGroup.myLinksCall.linkUsers(
                                        (_model.isLinkUser?.jsonBody ?? ''),
                                      ) !=
                                      null &&
                                  (LinksAPIGroup.myLinksCall.linkUsers(
                                    (_model.isLinkUser?.jsonBody ?? ''),
                                  ))!
                                      .isNotEmpty) {
                                context.pushNamed(HomePageWidget.routeName);
                              } else {
                                context
                                    .pushNamed(LLinkTargetPageWidget.routeName);
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('에러'),
                                    content: Text('에런가'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('토큰'),
                                    content:
                                        Text(_model.customKakaoOAuth?.idToken ?? '토큰 없음'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('find or create error'),
                                    content: Text(UsersAPIGroup
                                        .findOrCreateByEmailCall
                                        .errorMessage(
                                      (_model.apiResultlgw?.jsonBody ?? ''),
                                    )!),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/kakao.png',
                                    width: 18.0,
                                    height: 18.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                '카카오로 시작하기',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriOTF',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).coolGrey0,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.customGoogleAuthLogin =
                                await actions.googleSignInFunc();
                            if (_model.customGoogleAuthLogin?.hasId() == true) {
                              FFAppState().authUser = AuthUserStruct(
                                id: _model.customGoogleAuthLogin?.id,
                                idToken: _model.customGoogleAuthLogin?.idToken,
                                email: _model.customGoogleAuthLogin?.email,
                              );
                              safeSetState(() {});
                              _model.findOrCreateAPIRes = await UsersAPIGroup
                                  .findOrCreateByEmailCall
                                  .call(
                                supabaseApikey: FFAppConstants.kSupabaseApikey,
                                authToken:
                                    _model.customGoogleAuthLogin?.idToken,
                              );

                              if ((_model.findOrCreateAPIRes?.succeeded ??
                                  true)) {
                                _model.linkUserList =
                                    await LinksAPIGroup.myLinksCall.call(
                                  authToken:
                                      _model.customGoogleAuthLogin?.idToken,
                                  supabaseApikey:
                                      FFAppConstants.kSupabaseApikey,
                                );

                                if ((_model.linkUserList?.succeeded ?? true)) {
                                  context.pushNamed(HomePageWidget.routeName);
                                } else {
                                  context.pushNamed(
                                      LLinkTargetPageWidget.routeName);
                                }
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('에러'),
                                    content: Text(valueOrDefault<String>(
                                      (_model.customGoogleAuthLogin?.toMap())
                                          ?.toString(),
                                      '\$.error',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Clip_path_group.png',
                                    width: 18.0,
                                    height: 18.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                '구글로 시작하기',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriOTF',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
