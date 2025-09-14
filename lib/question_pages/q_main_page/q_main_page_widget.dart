import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_main_page_model.dart';
export 'q_main_page_model.dart';

class QMainPageWidget extends StatefulWidget {
  const QMainPageWidget({super.key});

  static String routeName = 'Q_MainPage';
  static String routePath = '/question';

  @override
  State<QMainPageWidget> createState() => _QMainPageWidgetState();
}

class _QMainPageWidgetState extends State<QMainPageWidget> with RouteAware {
  late QMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QMainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultiid = await QuestionsGroup.generateDailyQuestionCall.call(
        linkId: FFAppState().linkId,
        authToken: currentJwtToken,
      );

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
          targetUserId: currentUserUid,
          authToken: currentJwtToken,
        );

        if ((_model.userProfile?.succeeded ?? true)) {
          final userInfoData = UserInfoStruct.maybeFromMap(getJsonField(
            (_model.userProfile?.jsonBody ?? ''),
            r'''$.data''',
          ));
          if (userInfoData != null) {
            FFAppState().userInfo = userInfoData;
          }
          
          final bloodTypeAbo = LinkUserProfileAPIGroup.getOrCreateLinkUserCall.bloodTypeAbo(
            (_model.userProfile?.jsonBody ?? ''),
          );
          if (bloodTypeAbo != null) {
            FFAppState().selectedBloodTypeAbo = bloodTypeAbo;
          }
          
          final bloodTypeRh = LinkUserProfileAPIGroup.getOrCreateLinkUserCall.bloodTypeRh(
            (_model.userProfile?.jsonBody ?? ''),
          );
          if (bloodTypeRh != null) {
            FFAppState().selectedBloodTypeRh = bloodTypeRh;
          }
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
  void didUpdateWidget(QMainPageWidget oldWidget) {
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

    return FutureBuilder<ApiCallResponse>(
      future: QuestionsGroup.getAnswersCall.call(
        linkId: FFAppState().linkId,
        authToken: currentJwtToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        final qMainPageGetAnswersResponse = snapshot.data!;
        _model.debugBackendQueries[
                'QuestionsGroup.getAnswersCall_statusCode_Scaffold_elva48wg'] =
            debugSerializeParam(
          qMainPageGetAnswersResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'QuestionsGroup.getAnswersCall_responseBody_Scaffold_elva48wg'] =
            debugSerializeParam(
          qMainPageGetAnswersResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
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
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 161.3,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.apiResultxlm = await QuestionsGroup
                                    .generateDailyQuestionTestCall
                                    .call();

                                safeSetState(() {});
                              },
                              child: Icon(
                                FFIcons.khearticon,
                                color: Color(0xFFFF8D8D),
                                size: 24.0,
                              ),
                            ),
                            Container(
                              width: 65.0,
                              height: 25.0,
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
                            Text(
                              functions.getTodayDateCopy(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: QuestionsGroup
                                  .getUnanswerdRandomQuestionCall
                                  .call(
                                linkId: FFAppState().linkId,
                                authToken: currentJwtToken,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final textGetUnanswerdRandomQuestionResponse =
                                    snapshot.data!;
                                _model.debugBackendQueries[
                                        'QuestionsGroup.getUnanswerdRandomQuestionCall_statusCode_Text_phm6xkjf'] =
                                    debugSerializeParam(
                                  textGetUnanswerdRandomQuestionResponse
                                      .statusCode,
                                  ParamType.int,
                                  link:
                                      'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
                                  name: 'int',
                                  nullable: false,
                                );
                                _model.debugBackendQueries[
                                        'QuestionsGroup.getUnanswerdRandomQuestionCall_responseBody_Text_phm6xkjf'] =
                                    debugSerializeParam(
                                  textGetUnanswerdRandomQuestionResponse
                                      .bodyText,
                                  ParamType.String,
                                  link:
                                      'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
                                  name: 'String',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (QuestionsGroup
                                                .getUnanswerdRandomQuestionCall
                                                .question(
                                                  textGetUnanswerdRandomQuestionResponse
                                                      .jsonBody,
                                                )
                                                ?.questionType ==
                                            'TEXT'
                                        ? false
                                        : false) {
                                      context.pushNamed(
                                        QTextPageWidget.routeName,
                                        queryParameters: {
                                          'question': serializeParam(
                                            QuestionsGroup
                                                .getUnanswerdRandomQuestionCall
                                                .question(
                                              textGetUnanswerdRandomQuestionResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else if (QuestionsGroup
                                            .getUnanswerdRandomQuestionCall
                                            .question(
                                              textGetUnanswerdRandomQuestionResponse
                                                  .jsonBody,
                                            )
                                            ?.questionType ==
                                        'SINGLE_SELECT') {
                                      context.pushNamed(
                                        QOXPageWidget.routeName,
                                        queryParameters: {
                                          'question': serializeParam(
                                            QuestionsGroup
                                                .getUnanswerdRandomQuestionCall
                                                .question(
                                              textGetUnanswerdRandomQuestionResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        QSelectPageWidget.routeName,
                                        queryParameters: {
                                          'question': serializeParam(
                                            QuestionsGroup
                                                .getUnanswerdRandomQuestionCall
                                                .question(
                                              textGetUnanswerdRandomQuestionResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      QuestionsGroup
                                          .getUnanswerdRandomQuestionCall
                                          .question(
                                            textGetUnanswerdRandomQuestionResponse
                                                .jsonBody,
                                          )
                                          ?.questionText,
                                      '행복한 하루되세요!',
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
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.55,
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).oceanSea,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(
                                          QuestionsGroup.getQuestionsCall.call(
                                        linkId: FFAppState().linkId,
                                        authToken: currentJwtToken,
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewGetQuestionsResponse =
                                  snapshot.data!;
                              _model.debugBackendQueries[
                                      'QuestionsGroup.getQuestionsCall_statusCode_ListView_n0gg01g1'] =
                                  debugSerializeParam(
                                listViewGetQuestionsResponse.statusCode,
                                ParamType.int,
                                link:
                                    'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
                                name: 'int',
                                nullable: false,
                              );
                              _model.debugBackendQueries[
                                      'QuestionsGroup.getQuestionsCall_responseBody_ListView_n0gg01g1'] =
                                  debugSerializeParam(
                                listViewGetQuestionsResponse.bodyText,
                                ParamType.String,
                                link:
                                    'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
                                name: 'String',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return Builder(
                                builder: (context) {
                                  final questions = QuestionsGroup
                                          .getQuestionsCall
                                          .questions(
                                            listViewGetQuestionsResponse
                                                .jsonBody,
                                          )
                                          ?.sortedList(
                                              keyOf: (e) => e.orderIndex,
                                              desc: true)
                                          ?.toList() ??
                                      [];
                                  _model.debugGeneratorVariables[
                                          'questions${questions.length > 100 ? ' (first 100)' : ''}'] =
                                      debugSerializeParam(
                                    questions.take(100),
                                    ParamType.DataStruct,
                                    isList: true,
                                    link:
                                        'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_MainPage',
                                    name: 'Question',
                                    nullable: false,
                                  );
                                  debugLogWidgetClass(_model);

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        10.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: questions.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder: (context, questionsIndex) {
                                        final questionsItem =
                                            questions[questionsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (questionsItem.isAnswered ==
                                                true) {
                                              if (questionsItem.questionType ==
                                                  'TEXT') {
                                                context.pushNamed(
                                                  QAnswerPageWidget.routeName,
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionsItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  QAnswerSelectPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionsItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            } else {
                                              if (questionsItem.questionType ==
                                                  'TEXT') {
                                                context.pushNamed(
                                                  QTextPageWidget.routeName,
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionsItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else if ((questionsItem
                                                          .questionType ==
                                                      'SINGLE_SELECT') &&
                                                  (questionsItem
                                                          .options.length ==
                                                      2)) {
                                                context.pushNamed(
                                                  QOXPageWidget.routeName,
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionsItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  QSelectPageWidget.routeName,
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionsItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 56.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.7,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 30.0,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .oceanWave,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Q${questionsItem.orderIndex.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'HakgyoansimNadeuriOTF',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .coolGrey0,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              questionsItem
                                                                  .questionText,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'HakgyoansimNadeuriOTF',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .coolGrey90,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 45.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color: questionsItem
                                                              .isAnswered
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .coolGrey90
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .coolGrey50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        questionsItem.isAnswered
                                                            ? '답변완료'
                                                            : '답변 전',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HakgyoansimNadeuriOTF',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .coolGrey0,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 30.0))
                        .around(SizedBox(height: 30.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.76),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Sand.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.cover,
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
