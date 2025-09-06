import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'l_select_link_target_page_model.dart';
export 'l_select_link_target_page_model.dart';

class LSelectLinkTargetPageWidget extends StatefulWidget {
  const LSelectLinkTargetPageWidget({super.key});

  static String routeName = 'L_SelectLinkTargetPage';
  static String routePath = '/lSelectLinkTargetPage';

  @override
  State<LSelectLinkTargetPageWidget> createState() =>
      _LSelectLinkTargetPageWidgetState();
}

class _LSelectLinkTargetPageWidgetState
    extends State<LSelectLinkTargetPageWidget> with RouteAware {
  late LSelectLinkTargetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LSelectLinkTargetPageModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LSelectLinkTargetPageWidget oldWidget) {
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    constraints: BoxConstraints(
                      minHeight: 0.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '함께 마음을 나눌',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'HakgyoansimNadeuriOTF',
                                color: FlutterFlowTheme.of(context).coolGrey90,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          'Link 상대를 선택해주세요',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'HakgyoansimNadeuriOTF',
                                color: FlutterFlowTheme.of(context).oceanBlue50,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    constraints: BoxConstraints(
                      minHeight: 0.0,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.25,
                    ),
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
                            _model.targetStatus = TargetGroupStatus.FAMILY;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.43,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.43,
                                  constraints: BoxConstraints(
                                    minHeight: 0.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.targetStatus ==
                                              TargetGroupStatus.FAMILY
                                          ? Color(0x00000000)
                                          : FlutterFlowTheme.of(context)
                                              .oceanSea,
                                      FlutterFlowTheme.of(context).oceanSea,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.targetStatus ==
                                              TargetGroupStatus.FAMILY
                                          ? FlutterFlowTheme.of(context)
                                              .oceanBlue90
                                          : Color(0x00000000),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/8wgvs_2.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        '가족',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'HakgyoansimNadeuriOTF',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .oceanBlue90,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.targetStatus ==
                                    TargetGroupStatus.FAMILY)
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 10.0, 0.0),
                                      child: Icon(
                                        FFIcons.kcircleCheck,
                                        color: FlutterFlowTheme.of(context)
                                            .oceanBlue90,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.targetStatus = TargetGroupStatus.COUPLE;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.43,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.43,
                                  constraints: BoxConstraints(
                                    minHeight: 0.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.targetStatus ==
                                              TargetGroupStatus.COUPLE
                                          ? Color(0x00000000)
                                          : FlutterFlowTheme.of(context)
                                              .oceanSea,
                                      FlutterFlowTheme.of(context).oceanSea,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.targetStatus ==
                                              TargetGroupStatus.COUPLE
                                          ? FlutterFlowTheme.of(context)
                                              .oceanBlue90
                                          : Color(0x00000000),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/WhaleCouple.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        '연인',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'HakgyoansimNadeuriOTF',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .oceanBlue90,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.targetStatus ==
                                    TargetGroupStatus.COUPLE)
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 10.0, 0.0),
                                      child: Icon(
                                        FFIcons.kcircleCheck,
                                        color: FlutterFlowTheme.of(context)
                                            .oceanBlue90,
                                        size: 24.0,
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
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 52.0,
                  decoration: BoxDecoration(),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.targetStatus != TargetGroupStatus.NONE) {
                        _model.apiResultl1a = await CreateLinkCall.call(
                          authToken: currentJwtToken,
                          supabaseApikey: FFAppConstants.kSupabaseApikey,
                          category: _model.targetStatus?.name,
                        );

                        if ((_model.apiResultl1a?.succeeded ?? true)) {
                          context.pushNamed(HomePageWidget.routeName);
                        }
                      }

                      safeSetState(() {});
                    },
                    text: '선택하기',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: valueOrDefault<Color>(
                        _model.targetStatus != TargetGroupStatus.NONE
                            ? FlutterFlowTheme.of(context).oceanBlue60
                            : FlutterFlowTheme.of(context).oceanBlue0,
                        FlutterFlowTheme.of(context).oceanBlue0,
                      ),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'HakgyoansimNadeuriTTF',
                                color: FlutterFlowTheme.of(context).coolGrey0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
