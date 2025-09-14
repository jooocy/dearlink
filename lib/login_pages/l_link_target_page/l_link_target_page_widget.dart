import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'l_link_target_page_model.dart';
export 'l_link_target_page_model.dart';

class LLinkTargetPageWidget extends StatefulWidget {
  const LLinkTargetPageWidget({super.key});

  static String routeName = 'L_LinkTargetPage';
  static String routePath = '/lLinkTargetPage';

  @override
  State<LLinkTargetPageWidget> createState() => _LLinkTargetPageWidgetState();
}

class _LLinkTargetPageWidgetState extends State<LLinkTargetPageWidget>
    with RouteAware {
  late LLinkTargetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LLinkTargetPageModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LLinkTargetPageWidget oldWidget) {
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

    return FutureBuilder<ApiCallResponse>(
      future: UsersAPIGroup.findOrCreateByEmailCall.call(
        authToken: currentJwtToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).oceanBlueBG,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final lLinkTargetPageFindOrCreateByEmailResponse = snapshot.data!;
        _model.debugBackendQueries[
                'UsersAPIGroup.findOrCreateByEmailCall_statusCode_Scaffold_gpuarqcz'] =
            debugSerializeParam(
          lLinkTargetPageFindOrCreateByEmailResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LinkTargetPage',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'UsersAPIGroup.findOrCreateByEmailCall_responseBody_Scaffold_gpuarqcz'] =
            debugSerializeParam(
          lLinkTargetPageFindOrCreateByEmailResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=L_LinkTargetPage',
          name: 'String',
          nullable: false,
        );
        debugLogWidgetClass(_model);

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).oceanBlueBG,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/LinkTargetBackground.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/DearLink.png',
                          width: 90.0,
                          height: 30.0,
                          fit: BoxFit.contain,
                          cacheWidth: 180,
                          cacheHeight: 60,
                        ),
                      ),
                      Text(
                        '만나서 반가워요!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HakgyoansimNadeuriOTF',
                              color: FlutterFlowTheme.of(context).oceanBlue50,
                              fontSize: 36.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        width: 300.0,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        child: Text(
                          '이제 당신의 Link를 시작할 준비가 되었어요. \n함께 마음을 나눠볼까요?',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 85.0,
                    constraints: BoxConstraints(
                      maxHeight: 255.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/a22z3_.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).coolGrey0,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20.0,
                        color: Color(0xFFEBF7FE),
                        offset: Offset(
                          4.0,
                          4.0,
                        ),
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '초대 코드를 받으셨나요?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(LLinkCodePageWidget.routeName);
                          },
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: '초대코드 입력하기',
                              options: FFButtonOptions(
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).oceanBlue20,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 52.0,
                    decoration: BoxDecoration(),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context
                            .pushNamed(LSelectLinkTargetPageWidget.routeName);
                      },
                      text: '바로 시작하기',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).oceanBlue60,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
