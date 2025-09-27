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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_text_page_model.dart';
export 'q_text_page_model.dart';

class QTextPageWidget extends StatefulWidget {
  const QTextPageWidget({
    super.key,
    required this.question,
  });

  final QuestionStruct? question;

  static String routeName = 'Q_TextPage';
  static String routePath = '/qTextPage';

  @override
  State<QTextPageWidget> createState() => _QTextPageWidgetState();
}

class _QTextPageWidgetState extends State<QTextPageWidget> with RouteAware {
  late QTextPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QTextPageModel());

    _model.textController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(QTextPageWidget oldWidget) {
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
            QAnswerPageWidget.routeName,
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
          QAnswerPageWidget.routeName,
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
        QAnswerPageWidget.routeName,
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
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.95,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Column(
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
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .coolGrey30,
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
                                      color: FlutterFlowTheme.of(context)
                                          .oceanBlue90,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '오늘의 질문',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'HakgyoansimNadeuriOTF',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        '알수없는 에러가 발생했습니다.',
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    constraints: BoxConstraints(
                                      minHeight: 144.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'HakgyoansimNadeuriTTF',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '답변을 입력해 주세요.',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'HakgyoansimNadeuriTTF',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .coolGrey50,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .oceanBlue50,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: EdgeInsets.all(15.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'HakgyoansimNadeuriOTF',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        minLines: 10,
                                        maxLength: 200,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 52.0,
                            decoration: BoxDecoration(),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.apiResult57u =
                                    await QuestionsGroup.saveAnswerCall.call(
                                  linkId: FFAppState().linkId,
                                  questionId: widget!.question?.questionId,
                                  answerText: _model.textController.text,
                                  authToken: currentJwtToken,
                                );

                                if ((_model.apiResult57u?.succeeded ?? true)) {
                                  // 답변 저장 후 감정 상태 확인
                                  await _checkMoodAndRoute(widget!.question!);
                                }

                                safeSetState(() {});
                              },
                              text: '다음',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.targetStatus != TargetGroupStatus.NONE
                                      ? FlutterFlowTheme.of(context).oceanBlue60
                                      : FlutterFlowTheme.of(context).oceanBlue0,
                                  FlutterFlowTheme.of(context).oceanBlue0,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'HakgyoansimNadeuriTTF',
                                      color: FlutterFlowTheme.of(context)
                                          .coolGrey0,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
