import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_exist_user_componenet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/edit_family_name_button/edit_family_name_button_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'm_main_page_model.dart';
export 'm_main_page_model.dart';

class MMainPageWidget extends StatefulWidget {
  const MMainPageWidget({super.key});

  static String routeName = 'M_MainPage';
  static String routePath = '/mMainPage';

  @override
  State<MMainPageWidget> createState() => _MMainPageWidgetState();
}

class _MMainPageWidgetState extends State<MMainPageWidget> with RouteAware {
  late MMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MMainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getMyMainLinkRes = await LinksAPIGroup.getMyMainLinkCall.call(
        authToken: currentJwtToken,
      );

      if ((_model.getMyMainLinkRes?.succeeded ?? true)) {
        FFAppState().linkUsers = LinksAPIGroup.getMyMainLinkCall
            .linkUsers(
              (_model.getMyMainLinkRes?.jsonBody ?? ''),
            )!
            .toList()
            .cast<LinkUserStruct>();
        FFAppState().linkname = LinksAPIGroup.getMyMainLinkCall.linkName(
          (_model.getMyMainLinkRes?.jsonBody ?? ''),
        )!;
        FFAppState().linkUserOthers = LinksAPIGroup.getMyMainLinkCall
            .others(
              (_model.getMyMainLinkRes?.jsonBody ?? ''),
            )!
            .toList()
            .cast<LinkUserStruct>();
        FFAppState().linkId = FFAppState().linkId;
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('에러'),
              content: Text(getJsonField(
                (_model.getMyMainLinkRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(MMainPageWidget oldWidget) {
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Sky.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.9,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -0.9),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 50.0,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (LinksAPIGroup.getMyMainLinkCall
                                  .me(
                                    (_model.getMyMainLinkRes?.jsonBody ?? ''),
                                  )
                                  ?.role ==
                              'owner') {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Container(
                                      height: 251.0,
                                      width: 320.0,
                                      child: EditFamilyNameButtonWidget(),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('에러'),
                                  content: Text('권한이 없습니다.'),
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
                        },
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFAppState().linkname,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriOTF',
                                      color: FlutterFlowTheme.of(context)
                                          .coolGrey90,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Icon(
                                FFIcons.ksmall1,
                                color: FlutterFlowTheme.of(context).coolGrey70,
                                size: 24.0,
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        constraints: BoxConstraints(
                          minHeight: 200.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x80FFFFFF),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '${FFAppState().linkname} 멤버',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'HakgyoansimNadeuriOTF',
                                          color: FlutterFlowTheme.of(context)
                                              .coolGrey90,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final linkUsers =
                                        FFAppState().linkUsers.toList();
                                    if (linkUsers.isEmpty) {
                                      return Center(
                                        child: Container(
                                          height: double.infinity,
                                          child: NoExistUserComponenetWidget(),
                                        ),
                                      );
                                    }
                                    _model.debugGeneratorVariables[
                                            'linkUsers${linkUsers.length > 100 ? ' (first 100)' : ''}'] =
                                        debugSerializeParam(
                                      linkUsers.take(100),
                                      ParamType.DataStruct,
                                      isList: true,
                                      link:
                                          'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=M_MainPage',
                                      name: 'LinkUser',
                                      nullable: false,
                                    );
                                    debugLogWidgetClass(_model);

                                    return ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: linkUsers.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, linkUsersIndex) {
                                        final linkUsersItem =
                                            linkUsers[linkUsersIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              MDetailPageWidget.routeName,
                                              queryParameters: {
                                                'userId': serializeParam(
                                                  linkUsersItem.userId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .coolGrey0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 90.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/Ellipse_9.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFAppState()
                                                                      .userInfo
                                                                      .nickname,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HakgyoansimNadeuriOTF',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFAppState()
                                                                              .userInfo
                                                                              .familyRoleKorean ==
                                                                          ''
                                                                      ? '| ${FFAppState().userInfo.familyRoleKorean}'
                                                                      : '',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HakgyoansimNadeuriOTF',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'HakgyoansimNadeuriOTF',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                          ),
                                                          Text(
                                                            '🎂${FFAppState().userInfo.birthDateKorean}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HakgyoansimNadeuriOTF',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 15.0))
                                .around(SizedBox(height: 15.0)),
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
