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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with RouteAware {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
        FFAppState().linkId = LinksAPIGroup.getMyMainLinkCall.linkId(
          (_model.getMyMainLinkRes?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
        _model.hasLinkusers = LinksAPIGroup.getMyMainLinkCall.others(
                  (_model.getMyMainLinkRes?.jsonBody ?? ''),
                ) !=
                null &&
            (LinksAPIGroup.getMyMainLinkCall.others(
              (_model.getMyMainLinkRes?.jsonBody ?? ''),
            ))!
                .isNotEmpty;
        safeSetState(() {});
      } else {
        context.pushNamed(LLinkTargetPageWidget.routeName);
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
  void didUpdateWidget(HomePageWidget oldWidget) {
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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/MainBackground.png',
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

                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('변경되었습니다.'),
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
                                valueOrDefault<String>(
                                  LinksAPIGroup.getMyMainLinkCall.linkName(
                                    (_model.getMyMainLinkRes?.jsonBody ?? ''),
                                  ),
                                  '우리만의 공간 이름을 지어보세요',
                                ),
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
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).coolGrey0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onLongPress: () async {
                          context.pushNamed(LLoginMainPageWidget.routeName);
                        },
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Icon(
                                  FFIcons.knotificationSquare,
                                  color:
                                      FlutterFlowTheme.of(context).oceanBlue50,
                                  size: 20.0,
                                ),
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
            Align(
              alignment: AlignmentDirectional(0.0, -0.1),
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/(_)_1.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (_model.hasLinkusers == true)
              Align(
                alignment: AlignmentDirectional(0.0, 0.7),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 350.0,
                  decoration: BoxDecoration(
                    color: Color(0x80FFFFFF),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(LLoginMainPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidHeart,
                                      color: FlutterFlowTheme.of(context).red30,
                                      size: 14.0,
                                    ),
                                    Text(
                                      '가족들의 답변을 확인해보세요',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '답변보기',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .oceanBlue60,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.angleRight,
                                      color: FlutterFlowTheme.of(context)
                                          .oceanBlue60,
                                      size: 20.0,
                                    ),
                                  ].divide(SizedBox(width: 3.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final linkUsers = LinksAPIGroup.getMyMainLinkCall
                                      .others(
                                        (_model.getMyMainLinkRes?.jsonBody ??
                                            ''),
                                      )
                                      ?.toList() ??
                                  [];
                              _model.debugGeneratorVariables[
                                      'linkUsers${linkUsers.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                linkUsers.take(100),
                                ParamType.DataStruct,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=HomePage',
                                name: 'LinkUser',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.9,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: linkUsers.length,
                                itemBuilder: (context, linkUsersIndex) {
                                  final linkUsersItem =
                                      linkUsers[linkUsersIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .coolGrey30,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Ellipse_9.png',
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          linkUsersItem.nickname,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    'HakgyoansimNadeuriOTF',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .coolGrey90,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          height: 24.0,
                                          constraints: BoxConstraints(
                                            minWidth: 80.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .coolGrey20,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            '답변 전이에요.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'HakgyoansimNadeuriOTF',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .coolGrey80,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (_model.hasLinkusers == false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.7),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 134.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).coolGrey0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FFIcons.khearticon,
                        color: Color(0xFFFF8D8D),
                        size: 22.0,
                      ),
                      Text(
                        '함께할 소중한 사람을 초대해주세요.',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              color: FlutterFlowTheme.of(context).oceanBlue50,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.getInviteCode = await InviteAPIGroup
                                    .getOrCreateActiveInviteCodeCall
                                    .call(
                                  authToken: currentJwtToken,
                                  linkId: FFAppState().linkId,
                                );

                                if ((_model.getInviteCode?.succeeded ?? true)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(InviteAPIGroup
                                            .getOrCreateActiveInviteCodeCall
                                            .code(
                                          (_model.getInviteCode?.jsonBody ??
                                              ''),
                                        )!),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  await actions.shareText(
                                    '${FFAppConstants.kUrlScheme}/linkSuccessPage?inviteCode=${InviteAPIGroup.getOrCreateActiveInviteCodeCall.code(
                                      (_model.getInviteCode?.jsonBody ?? ''),
                                    )}',
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: '초대링크 공유하기',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).oceanBlue60,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriTTF',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                context
                                    .pushNamed(InviteCodePageWidget.routeName);
                              },
                              text: '초대 코드 입력 & 보내기',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).coolGrey0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriTTF',
                                      color: FlutterFlowTheme.of(context)
                                          .oceanBlue60,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).oceanBlue60,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
