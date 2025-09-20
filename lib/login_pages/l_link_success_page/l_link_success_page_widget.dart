import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'l_link_success_page_model.dart';
export 'l_link_success_page_model.dart';

class LLinkSuccessPageWidget extends StatefulWidget {
  const LLinkSuccessPageWidget({
    super.key,
    required this.inviteCode,
  });

  final String? inviteCode;

  static String routeName = 'L_LinkSuccessPage';
  static String routePath = '/lLinkSuccessPage';

  @override
  State<LLinkSuccessPageWidget> createState() => _LLinkSuccessPageWidgetState();
}

class _LLinkSuccessPageWidgetState extends State<LLinkSuccessPageWidget>
    with RouteAware {
  late LLinkSuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isProcessing = false;
  String _statusMessage = '초대를 처리하는 중입니다...';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LLinkSuccessPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _processInviteCode();
    });
  }

  Future<void> _processInviteCode() async {
    if (widget!.inviteCode == null || widget!.inviteCode!.isEmpty) {
      setState(() {
        _statusMessage = '유효하지 않은 초대 링크입니다.';
        _isProcessing = false;
      });
      await Future.delayed(Duration(seconds: 2));
      context.pushNamed(LLoginMainPageWidget.routeName);
      return;
    }

    setState(() {
      _isProcessing = true;
      _statusMessage = '초대를 처리하는 중입니다...';
    });

    try {
      _model.apiResultci9 = await InviteAPIGroup.joinByCodeCall.call(
        inviteCode: widget!.inviteCode,
        authToken: currentJwtToken,
      );

      if ((_model.apiResultci9?.succeeded ?? true)) {
        // 성공 시
        setState(() {
          _statusMessage = '초대가 성공적으로 처리되었습니다!';
          _isProcessing = false;
        });

        // linkId 업데이트
        final linkId = getJsonField(
          (_model.apiResultci9?.jsonBody ?? ''),
          r'''$.data.mainLinkId''',
        );
        if (linkId != null) {
          FFAppState().linkId = linkId.toString();
        }

        await Future.delayed(Duration(seconds: 2));
        context.pushNamed(HomePageWidget.routeName);
      } else {
        // 실패 시
        final errorMessage = getJsonField(
          (_model.apiResultci9?.jsonBody ?? ''),
          r'''$.message''',
        )?.toString() ?? '초대 처리 중 오류가 발생했습니다.';
        
        setState(() {
          _statusMessage = errorMessage;
          _isProcessing = false;
        });

        await Future.delayed(Duration(seconds: 3));
        context.pushNamed(LLoginMainPageWidget.routeName);
      }
    } catch (e) {
      setState(() {
        _statusMessage = '네트워크 오류가 발생했습니다. 다시 시도해주세요.';
        _isProcessing = false;
      });

      await Future.delayed(Duration(seconds: 3));
      context.pushNamed(LLoginMainPageWidget.routeName);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LLinkSuccessPageWidget oldWidget) {
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
                    _isProcessing ? '초대를 처리하고 있어요...' : 
                    (_model.apiResultci9?.succeeded == true) ? '소중한 Link 연결이 \n완료되었어요!' :
                    '초대 처리 중 오류가 발생했어요',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'HakgyoansimNadeuriOTF',
                          color: _isProcessing ? 
                            FlutterFlowTheme.of(context).oceanBlue60 :
                            (_model.apiResultci9?.succeeded == true) ?
                              FlutterFlowTheme.of(context).oceanBlue50 :
                              FlutterFlowTheme.of(context).red30,
                          fontSize: 32.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: 300.0,
                    height: 60.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_isProcessing) ...[
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).oceanBlue60,
                                ),
                                strokeWidth: 2.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                          Text(
                            _statusMessage,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'HakgyoansimNadeuriOTF',
                                  color: FlutterFlowTheme.of(context).coolGrey70,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 52.0,
                decoration: BoxDecoration(),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: '바로 시작하기',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).oceanBlue60,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
  }
}
