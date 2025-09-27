import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_o_x_page_model.dart';
export 'q_o_x_page_model.dart';

class QOXPageWidget extends StatefulWidget {
  const QOXPageWidget({
    super.key,
    required this.question,
  });

  final QuestionStruct? question;

  static String routeName = 'Q_OXPage';
  static String routePath = '/qOXPage';

  @override
  State<QOXPageWidget> createState() => _QOXPageWidgetState();
}

class _QOXPageWidgetState extends State<QOXPageWidget> with RouteAware {
  late QOXPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QOXPageModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(QOXPageWidget oldWidget) {
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

  Future<void> _checkMoodAndRoute(QuestionStruct question) async {
    print('=== DEBUG: Checking mood status for linkId: ${FFAppState().linkId} ===');
    try {
      final moodStatusResponse = await MoodAPIGroup.getMoodStatusCall.call(
        linkId: FFAppState().linkId,
        authToken: currentJwtToken,
      );

      if (moodStatusResponse?.succeeded ?? false) {
        final hasRecordedToday = MoodAPIGroup.getMoodStatusCall.hasRecordedToday(
          moodStatusResponse?.jsonBody,
        );
        
        print('=== DEBUG: Has recorded mood today: $hasRecordedToday ===');
        
        if (hasRecordedToday == false) {
          print('=== DEBUG: Redirecting to mood select page ===');
          context.pushNamed(
            MoodSelectPageWidget.routeName,
            queryParameters: {
              'question': serializeParam(
                question,
                ParamType.DataStruct,
              ),
            }.withoutNulls,
          );
        } else {
          print('=== DEBUG: Mood already selected, routing to answer page ===');
          context.pushNamed(
            QAnswerSelectPageWidget.routeName,
            queryParameters: {
              'question': serializeParam(
                question,
                ParamType.DataStruct,
              ),
            }.withoutNulls,
          );
        }
      } else {
        print('=== DEBUG: Failed to check mood status, routing to answer page ===');
        context.pushNamed(
          QAnswerSelectPageWidget.routeName,
          queryParameters: {
            'question': serializeParam(
              question,
              ParamType.DataStruct,
            ),
          }.withoutNulls,
        );
      }
    } catch (e) {
      print('=== DEBUG: Error checking mood status: $e, routing to answer page ===');
      context.pushNamed(
        QAnswerSelectPageWidget.routeName,
        queryParameters: {
          'question': serializeParam(
            question,
            ParamType.DataStruct,
          ),
        }.withoutNulls,
      );
    }
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
        backgroundColor: FlutterFlowTheme.of(context).oceanBlueBG,
        body: Stack(
          children: [
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
                      height: 48.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 20.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .oceanBlue50,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).coolGrey30,
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                            ),
                            Container(
                              width: 65.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).oceanBlue90,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '오늘의 질문',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'HakgyoansimNadeuriOTF',
                                        color: FlutterFlowTheme.of(context)
                                            .coolGrey0,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.question?.questionText,
                                  '알수없는 에러입니다.',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriOTF',
                                      color: FlutterFlowTheme.of(context)
                                          .oceanBlue90,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              constraints: BoxConstraints(
                                maxHeight: 164.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.targetStatus = TargetGroup.A;
                                      _model.selectedOptions = [];
                                      safeSetState(() {});
                                      _model.addToSelectedOptions(widget!
                                          .question!.options.firstOrNull!);
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color:
                                            _model.targetStatus == TargetGroup.A
                                                ? FlutterFlowTheme.of(context)
                                                    .coolGrey0
                                                : FlutterFlowTheme.of(context)
                                                    .oceanSea,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: _model.targetStatus ==
                                                  TargetGroup.A
                                              ? FlutterFlowTheme.of(context)
                                                  .oceanBlue90
                                              : Color(0x00000000),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget!.question?.options
                                                    ?.firstOrNull?.label,
                                                '선택 1',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'HakgyoansimNadeuriOTF',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .oceanBlue90,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          if (_model.targetStatus ==
                                              TargetGroup.A)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      _model.targetStatus = TargetGroup.B;
                                      _model.selectedOptions = [];
                                      safeSetState(() {});
                                      _model.addToSelectedOptions(widget!
                                          .question!.options.lastOrNull!);
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color:
                                            _model.targetStatus == TargetGroup.B
                                                ? FlutterFlowTheme.of(context)
                                                    .coolGrey0
                                                : FlutterFlowTheme.of(context)
                                                    .oceanSea,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: _model.targetStatus ==
                                                  TargetGroup.B
                                              ? FlutterFlowTheme.of(context)
                                                  .oceanBlue90
                                              : Color(0x00000000),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget!.question?.options
                                                    ?.lastOrNull?.label,
                                                '선택 2',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'HakgyoansimNadeuriOTF',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .oceanBlue90,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          if (_model.targetStatus ==
                                              TargetGroup.B)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .oceanBlue90,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 2.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ],
                ),
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
                        _model.saveAnswer =
                            await QuestionsGroup.saveAnswerCall.call(
                          linkId: FFAppState().linkId,
                          questionId: widget!.question?.questionId,
                          authToken: currentJwtToken,
                          selectedOptionsList: _model.selectedOptions
                              .map((e) => e.label)
                              .toList(),
                        );

                        if ((_model.saveAnswer?.succeeded ?? true)) {
                          // 답변 저장 후 감정 상태 확인
                          await _checkMoodAndRoute(widget!.question!);
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('실패'),
                                content:
                                    Text((_model.saveAnswer?.bodyText ?? '')),
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
                      }

                      safeSetState(() {});
                    },
                    text: '다음',
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
