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
import 'q_select_page_model.dart';
export 'q_select_page_model.dart';

class QSelectPageWidget extends StatefulWidget {
  const QSelectPageWidget({
    super.key,
    required this.question,
  });

  final QuestionStruct? question;

  static String routeName = 'Q_SelectPage';
  static String routePath = '/qSelectPage';

  @override
  State<QSelectPageWidget> createState() => _QSelectPageWidgetState();
}

class _QSelectPageWidgetState extends State<QSelectPageWidget> with RouteAware {
  late QSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QSelectPageModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(QSelectPageWidget oldWidget) {
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
                                      '어떤 여행 유형을 더 선호하시나요?',
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
                                      maxHeight:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final questionOptions = widget!
                                                .question?.options
                                                ?.map((e) => e)
                                                .toList()
                                                ?.toList() ??
                                            [];
                                        _model.debugGeneratorVariables[
                                                'questionOptions${questionOptions.length > 100 ? ' (first 100)' : ''}'] =
                                            debugSerializeParam(
                                          questionOptions.take(100),
                                          ParamType.DataStruct,
                                          isList: true,
                                          link:
                                              'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_SelectPage',
                                          name: 'QuestionOption',
                                          nullable: false,
                                        );
                                        debugLogWidgetClass(_model);

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: questionOptions.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, questionOptionsIndex) {
                                            final questionOptionsItem =
                                                questionOptions[
                                                    questionOptionsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model
                                                    .selectedQuestionOptions
                                                    .contains(
                                                        questionOptionsItem)) {
                                                  _model
                                                      .removeFromSelectedQuestionOptions(
                                                          questionOptionsItem);
                                                  safeSetState(() {});
                                                } else {
                                                  _model
                                                      .addToSelectedQuestionOptions(
                                                          questionOptionsItem);
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: _model
                                                          .selectedQuestionOptions
                                                          .contains(
                                                              questionOptionsItem)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .coolGrey0
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .oceanSea,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: _model
                                                            .selectedQuestionOptions
                                                            .contains(
                                                                questionOptionsItem)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .oceanBlue90
                                                        : Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration: BoxDecoration(
                                                        color: _model
                                                                .selectedQuestionOptions
                                                                .contains(
                                                                    questionOptionsItem)
                                                            ? Color(0x00000000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .coolGrey0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      child: Visibility(
                                                        visible: _model
                                                                .selectedQuestionOptions
                                                                .contains(
                                                                    questionOptionsItem) ==
                                                            true,
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .oceanBlue90,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      questionOptionsItem.label,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HakgyoansimNadeuriOTF',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .oceanBlue90,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 10.0))
                                                      .addToStart(SizedBox(
                                                          width: 20.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
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
                                if (_model.selectedQuestionOptions.isNotEmpty) {
                                  _model.aveAnswer2 =
                                      await QuestionsGroup.saveAnswerCall.call(
                                    linkId: FFAppState().linkId,
                                    questionId: widget!.question?.questionId,
                                    authToken: currentJwtToken,
                                    selectedOptionsList: _model
                                        .selectedQuestionOptions
                                        .map((e) => e.label)
                                        .toList(),
                                  );

                                  if ((_model.aveAnswer2?.succeeded ?? true)) {
                                    context.pushNamed(
                                      QAnswerSelectPageWidget.routeName,
                                      queryParameters: {
                                        'question': serializeParam(
                                          widget!.question,
                                          ParamType.DataStruct,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
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
