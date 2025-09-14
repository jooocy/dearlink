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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'm_detail_page_model.dart';
export 'm_detail_page_model.dart';

class MDetailPageWidget extends StatefulWidget {
  const MDetailPageWidget({
    super.key,
    required this.userId,
  });

  final String? userId;

  static String routeName = 'M_DetailPage';
  static String routePath = '/memberDetailPage';

  @override
  State<MDetailPageWidget> createState() => _MDetailPageWidgetState();
}

class _MDetailPageWidgetState extends State<MDetailPageWidget> with RouteAware {
  late MDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getMyMainLinkRes = await LinksAPIGroup.getMyMainLinkCall.call(
        authToken: currentJwtToken,
      );

      if ((_model.getMyMainLinkRes?.succeeded ?? true)) {
        FFAppState().linkUsers = LinksAPIGroup.getMyMainLinkCall
            .others(
              (_model.getMyMainLinkRes?.jsonBody ?? ''),
            )!
            .toList()
            .cast<LinkUserStruct>();
        FFAppState().linkname = LinksAPIGroup.getMyMainLinkCall.linkName(
          (_model.getMyMainLinkRes?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
        _model.userProfile =
            await LinkUserProfileAPIGroup.getOrCreateLinkUserCall.call(
          linkId: FFAppState().linkId,
          targetUserId: widget!.userId,
          authToken: currentJwtToken,
        );

        if ((_model.userProfile?.succeeded ?? true)) {
          FFAppState().userInfo = UserInfoStruct.maybeFromMap(getJsonField(
            (_model.userProfile?.jsonBody ?? ''),
            r'''$.data''',
          ))!;
          FFAppState().selectedBloodTypeAbo =
              LinkUserProfileAPIGroup.getOrCreateLinkUserCall.bloodTypeAbo(
            (_model.userProfile?.jsonBody ?? ''),
          )!;
          FFAppState().selectedBloodTypeRh =
              LinkUserProfileAPIGroup.getOrCreateLinkUserCall.bloodTypeRh(
            (_model.userProfile?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('에러'),
                content: Text('유저정보를 불러오는데 실패했습니다.'),
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
      } else {
        context.safePop();
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
  void didUpdateWidget(MDetailPageWidget oldWidget) {
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
                'assets/images/Sky.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.879,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.95,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(MMainPageWidget.routeName);
                            },
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(),
                              child: FaIcon(
                                FontAwesomeIcons.angleLeft,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '저장',
                            options: FFButtonOptions(
                              width: 24.0,
                              height: 24.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x004B39EF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'HakgyoansimNadeuriTTF',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.9),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 161.3,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 140.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    LinksAPIGroup
                                                        .getMyMainLinkCall
                                                        .me(
                                                          (_model.getMyMainLinkRes
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .profileImageUrl,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MEditDetailPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'userId':
                                                                serializeParam(
                                                              widget!.userId,
                                                              ParamType.String,
                                                            ),
                                                            'familyRole':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .userInfo
                                                                  .familyRole,
                                                              ParamType.Enum,
                                                            ),
                                                            'bloodTypeAbo':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .userInfo
                                                                  .bloodTypeAbo,
                                                              ParamType.Enum,
                                                            ),
                                                            'bloddTypeRh':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .userInfo
                                                                  .bloodTypeRh,
                                                              ParamType.Enum,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Icon(
                                                        FFIcons.ksmall1,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .oceanBlue50,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFAppState().userInfo.nickname,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriOTF',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: FFAppState()
                                                                      .userInfo
                                                                      .birthDateKorean !=
                                                                  null &&
                                                              FFAppState()
                                                                      .userInfo
                                                                      .birthDateKorean !=
                                                                  ''
                                                          ? '🎂${FFAppState().userInfo.birthDateKorean}'
                                                          : '',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: FFAppState()
                                                                  .userInfo
                                                                  .bloodTypeAbo !=
                                                              null
                                                          ? ' | ${FFAppState().userInfo.bloodTypeAbo?.name}'
                                                          : '',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: FFAppState()
                                                                  .userInfo
                                                                  .familyRoleKorean ==
                                                              ''
                                                          ? ' | ${FFAppState().userInfo.familyRoleKorean}'
                                                          : '',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'HakgyoansimNadeuriOTF',
                                                        letterSpacing: 0.0,
                                                      ),
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
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.63,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).oceanSea,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '신체 정보',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'HakgyoansimNadeuriOTF',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .userNumberInfoComponentModel1,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: Builder(
                                                              builder: (_) {
                                                            return DebugFlutterFlowModelContext(
                                                              rootModel: _model
                                                                  .rootModel,
                                                              child:
                                                                  UserNumberInfoComponentWidget(
                                                                isReadOnly: _model
                                                                    .isReadOnly,
                                                                initailValue:
                                                                    FFAppState()
                                                                        .userInfo
                                                                        .height,
                                                                endText: 'cm',
                                                                labelText: '키',
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .userNumberInfoComponentModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: Builder(
                                                              builder: (_) {
                                                            return DebugFlutterFlowModelContext(
                                                              rootModel: _model
                                                                  .rootModel,
                                                              child:
                                                                  UserNumberInfoComponentWidget(
                                                                labelText:
                                                                    '몸무게',
                                                                isReadOnly: _model
                                                                    .isReadOnly,
                                                                initailValue:
                                                                    LinkUserProfileAPIGroup
                                                                        .getOrCreateLinkUserCall
                                                                        .weight(
                                                                  (_model.userProfile
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                endText: 'kg',
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .userNumberInfoComponentModel3,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: Builder(
                                                              builder: (_) {
                                                            return DebugFlutterFlowModelContext(
                                                              rootModel: _model
                                                                  .rootModel,
                                                              child:
                                                                  UserNumberInfoComponentWidget(
                                                                labelText:
                                                                    '신발 사이즈',
                                                                isReadOnly: _model
                                                                    .isReadOnly,
                                                                initailValue:
                                                                    LinkUserProfileAPIGroup
                                                                        .getOrCreateLinkUserCall
                                                                        .shoeSize(
                                                                  (_model.userProfile
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                endText: '',
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .userStringInfoComponentModel1,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: Builder(
                                                              builder: (_) {
                                                            return DebugFlutterFlowModelContext(
                                                              rootModel: _model
                                                                  .rootModel,
                                                              child:
                                                                  UserStringInfoComponentWidget(
                                                                isReadOnly: _model
                                                                    .isReadOnly,
                                                                initailValue:
                                                                    FFAppState()
                                                                        .userInfo
                                                                        .clothingSize,
                                                                endText: ' ',
                                                                labelText:
                                                                    '옷 사이즈',
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 10.0))
                                                        .around(SizedBox(
                                                            height: 10.0)),
                                                  ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 15.0))
                                                  .around(
                                                      SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '건강 정보',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriOTF',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.92, 0.0),
                                                          child: Text(
                                                            '혈액형',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (FFAppState()
                                                                      .userInfo
                                                                      .bloodTypeAbo ==
                                                                  BloodTypeAbo
                                                                      .A)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .selectButtonComponentModel1,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child: Builder(
                                                                      builder:
                                                                          (_) {
                                                                    return DebugFlutterFlowModelContext(
                                                                      rootModel:
                                                                          _model
                                                                              .rootModel,
                                                                      child:
                                                                          SelectButtonComponentWidget(
                                                                        outputValue: FFAppState()
                                                                            .userInfo
                                                                            .bloodTypeAbo
                                                                            ?.name,
                                                                        width:
                                                                            27,
                                                                        height:
                                                                            37,
                                                                        displayText: BloodTypeAbo
                                                                            .A
                                                                            .name,
                                                                        isReadOnly:
                                                                            _model.isReadOnly,
                                                                        widgetValue: BloodTypeAbo
                                                                            .A
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              if (FFAppState()
                                                                      .userInfo
                                                                      .bloodTypeAbo ==
                                                                  BloodTypeAbo
                                                                      .B)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .selectButtonComponentModel2,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child: Builder(
                                                                      builder:
                                                                          (_) {
                                                                    return DebugFlutterFlowModelContext(
                                                                      rootModel:
                                                                          _model
                                                                              .rootModel,
                                                                      child:
                                                                          SelectButtonComponentWidget(
                                                                        outputValue: FFAppState()
                                                                            .userInfo
                                                                            .bloodTypeAbo
                                                                            ?.name,
                                                                        width:
                                                                            27,
                                                                        height:
                                                                            37,
                                                                        displayText: BloodTypeAbo
                                                                            .B
                                                                            .name,
                                                                        isReadOnly:
                                                                            _model.isReadOnly,
                                                                        widgetValue: BloodTypeAbo
                                                                            .B
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              if (FFAppState()
                                                                      .userInfo
                                                                      .bloodTypeAbo ==
                                                                  BloodTypeAbo
                                                                      .O)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .selectButtonComponentModel3,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child: Builder(
                                                                      builder:
                                                                          (_) {
                                                                    return DebugFlutterFlowModelContext(
                                                                      rootModel:
                                                                          _model
                                                                              .rootModel,
                                                                      child:
                                                                          SelectButtonComponentWidget(
                                                                        outputValue: FFAppState()
                                                                            .userInfo
                                                                            .bloodTypeAbo
                                                                            ?.name,
                                                                        width:
                                                                            27,
                                                                        height:
                                                                            37,
                                                                        displayText: BloodTypeAbo
                                                                            .O
                                                                            .name,
                                                                        isReadOnly:
                                                                            _model.isReadOnly,
                                                                        widgetValue: BloodTypeAbo
                                                                            .O
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .selectButtonComponentModel4,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child: Builder(
                                                                    builder:
                                                                        (_) {
                                                                  return DebugFlutterFlowModelContext(
                                                                    rootModel:
                                                                        _model
                                                                            .rootModel,
                                                                    child:
                                                                        SelectButtonComponentWidget(
                                                                      outputValue: FFAppState()
                                                                          .userInfo
                                                                          .bloodTypeAbo
                                                                          ?.name,
                                                                      width: 34,
                                                                      height:
                                                                          37,
                                                                      displayText:
                                                                          BloodTypeAbo
                                                                              .AB
                                                                              .name,
                                                                      isReadOnly:
                                                                          _model
                                                                              .isReadOnly,
                                                                      widgetValue:
                                                                          BloodTypeAbo
                                                                              .AB
                                                                              .name,
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.92, 0.0),
                                                          child: Text(
                                                            'Rh 선택',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (FFAppState()
                                                                      .userInfo
                                                                      .bloodTypeRh ==
                                                                  BloodTypeRh
                                                                      .POSITIVE)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .selectButtonComponentModel5,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child: Builder(
                                                                      builder:
                                                                          (_) {
                                                                    return DebugFlutterFlowModelContext(
                                                                      rootModel:
                                                                          _model
                                                                              .rootModel,
                                                                      child:
                                                                          SelectButtonComponentWidget(
                                                                        outputValue:
                                                                            FFAppState().selectedBloodTypeRh,
                                                                        width:
                                                                            44,
                                                                        height:
                                                                            38,
                                                                        displayText:
                                                                            'Rh +',
                                                                        isReadOnly:
                                                                            _model.isReadOnly,
                                                                        widgetValue: BloodTypeRh
                                                                            .POSITIVE
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .selectButtonComponentModel6,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child: Builder(
                                                                    builder:
                                                                        (_) {
                                                                  return DebugFlutterFlowModelContext(
                                                                    rootModel:
                                                                        _model
                                                                            .rootModel,
                                                                    child:
                                                                        SelectButtonComponentWidget(
                                                                      outputValue:
                                                                          FFAppState()
                                                                              .selectedBloodTypeRh,
                                                                      width: 44,
                                                                      height:
                                                                          38,
                                                                      displayText:
                                                                          'Rh -',
                                                                      isReadOnly:
                                                                          _model
                                                                              .isReadOnly,
                                                                      widgetValue: BloodTypeRh
                                                                          .NEGATIVE
                                                                          .name,
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .userStringInfoComponentModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: Builder(
                                                            builder: (_) {
                                                          return DebugFlutterFlowModelContext(
                                                            rootModel: _model
                                                                .rootModel,
                                                            child:
                                                                UserStringInfoComponentWidget(
                                                              isReadOnly: _model
                                                                  .isReadOnly,
                                                              initailValue:
                                                                  FFAppState()
                                                                      .userInfo
                                                                      .preferredFoods,
                                                              endText: ' ',
                                                              labelText:
                                                                  '선호하는 음식',
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .userStringInfoComponentModel3,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: Builder(
                                                            builder: (_) {
                                                          return DebugFlutterFlowModelContext(
                                                            rootModel: _model
                                                                .rootModel,
                                                            child:
                                                                UserStringInfoComponentWidget(
                                                              isReadOnly: _model
                                                                  .isReadOnly,
                                                              initailValue:
                                                                  FFAppState()
                                                                      .userInfo
                                                                      .allergies,
                                                              endText: ' ',
                                                              labelText: '알레르기',
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .userStringInfoComponentModel4,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: Builder(
                                                            builder: (_) {
                                                          return DebugFlutterFlowModelContext(
                                                            rootModel: _model
                                                                .rootModel,
                                                            child:
                                                                UserStringInfoComponentWidget(
                                                              isReadOnly: _model
                                                                  .isReadOnly,
                                                              initailValue:
                                                                  FFAppState()
                                                                      .userInfo
                                                                      .healthNotes,
                                                              endText: ' ',
                                                              labelText:
                                                                  '건강상 주의사항',
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(SizedBox(
                                                          height: 10.0))
                                                      .around(SizedBox(
                                                          height: 10.0)),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 15.0))
                                                .around(SizedBox(height: 15.0)),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 10.0))
                                          .addToStart(SizedBox(height: 10.0))
                                          .addToEnd(SizedBox(height: 50.0)),
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
