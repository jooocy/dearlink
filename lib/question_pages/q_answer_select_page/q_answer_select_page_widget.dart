import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_answer_select_page_model.dart';
export 'q_answer_select_page_model.dart';

class QAnswerSelectPageWidget extends StatefulWidget {
  const QAnswerSelectPageWidget({
    super.key,
    required this.question,
  });

  final QuestionStruct? question;

  static String routeName = 'Q_AnswerSelectPage';
  static String routePath = '/answerSelect';

  @override
  State<QAnswerSelectPageWidget> createState() =>
      _QAnswerSelectPageWidgetState();
}

class _QAnswerSelectPageWidgetState extends State<QAnswerSelectPageWidget>
    with RouteAware {
  late QAnswerSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QAnswerSelectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _loadAnswerData();
    });
  }

  bool _isLoading = false;
  
  Future<void> _loadAnswerData() async {
    // 이미 로딩 중이거나 이미 로드된 경우 스킵
    if (_isLoading || (_model.apiResultGetAnswerByQuestion != null && _model.apiResultGetAnswerByQuestion?.succeeded == true)) {
      print('=== DEBUG: API already loaded or loading, skipping ===');
      return;
    }
    
    _isLoading = true;
    print('=== DEBUG: Starting API call for question: ${widget!.question?.questionId} ===');
    
    try {
      _model.apiResultGetAnswerByQuestion =
          await QuestionsGroup.getAnswersByQuestionCall.call(
        linkId: FFAppState().linkId,
        questionId: widget!.question?.questionId,
        authToken: currentJwtToken,
      );
      print('=== DEBUG: API call completed ===');
      print('API Response: ${_model.apiResultGetAnswerByQuestion?.jsonBody}');
      
      // API 호출 완료 후 UI 업데이트
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('=== DEBUG: API call failed: $e ===');
    } finally {
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(QAnswerSelectPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
    
    // 질문이 변경되었을 때만 API 호출
    if (oldWidget.question?.questionId != widget.question?.questionId) {
      _model.apiResultGetAnswerByQuestion = null; // 기존 결과 초기화
      _isLoading = false; // 로딩 상태 초기화
      _loadAnswerData();
    }
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
                height: MediaQuery.sizeOf(context).height * 1.0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          context.pushNamed(QMainPageWidget.routeName);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.khearticon,
                              color: Color(0xFFFF8D8D),
                              size: 24.0,
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
                            Text(
                              valueOrDefault<String>(
                                widget!.question?.questionText,
                                '행복한 하루 되세요!',
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
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  minHeight: 136.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).coolGrey0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .red30,
                                              size: 14.0,
                                            ),
                                            Text(
                                              '나의 답변',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'HakgyoansimNadeuriOTF',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .coolGrey90,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      StyledDivider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .oceanBlue0,
                                        lineStyle: DividerLineStyle.dashed,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 46.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oceabSkyGra,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '#행복',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HakgyoansimNadeuriOTF',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .oceanBlue70,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  // API 응답이 아직 로드되지 않았거나 빈 응답일 때 처리
                                                  final apiResponse = _model.apiResultGetAnswerByQuestion?.jsonBody;
                                                  if (apiResponse == null || apiResponse.toString().isEmpty) {
                                                    print('=== DEBUG: API not loaded yet ===');
                                                    return Container(
                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '답변을 불러오는 중...',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'HakgyoansimNadeuriOTF',
                                                            color: FlutterFlowTheme.of(context).coolGrey90,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  
                                                  // API 응답 전체 로그
                                                  print('=== DEBUG: API Response ===');
                                                  print('Full API Response: ${_model.apiResultGetAnswerByQuestion?.jsonBody}');
                                                  
                                                  // myAnswer 부분만 추출해서 로그
                                                  final myAnswerJson = getJsonField(
                                                    _model.apiResultGetAnswerByQuestion?.jsonBody ?? '',
                                                    r'''$.data.myAnswer''',
                                                  );
                                                  print('MyAnswer JSON: $myAnswerJson');
                                                  
                                                  // selectedOptions 직접 파싱 (null 체크 추가)
                                                  final selectedOptionsJson = getJsonField(
                                                    myAnswerJson,
                                                    r'''$.selectedOptions''',
                                                    true,
                                                  ) as List?;
                                                  print('SelectedOptions JSON: $selectedOptionsJson');
                                                  print('SelectedOptions Type: ${selectedOptionsJson.runtimeType}');
                                                  
                                                  final mySelectedAnsers = selectedOptionsJson
                                                      ?.map((e) => e.toString())
                                                      .toList() ?? [];
                                                  print('Parsed selectedOptions: $mySelectedAnsers');
                                                  print('Count: ${mySelectedAnsers.length}');
                                                  
                                                  // TEXT 타입 질문인 경우 selectedOptions가 없을 수 있음
                                                  final answerText = getJsonField(
                                                    myAnswerJson,
                                                    r'''$.answerText''',
                                                  )?.toString();
                                                  print('Answer Text: $answerText');
                                                  
                                                  // 무한 루프 방지를 위해 setState 제거
                                                  // API 응답이 완료되면 자동으로 UI가 업데이트됨
                                                  
                                                  _model.debugGeneratorVariables[
                                                          'mySelectedAnsers${mySelectedAnsers.length > 100 ? ' (first 100)' : ''}'] =
                                                      debugSerializeParam(
                                                    mySelectedAnsers.take(100),
                                                    ParamType.String,
                                                    isList: true,
                                                    link:
                                                        'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerSelectPage',
                                                    name: 'String',
                                                    nullable: false,
                                                  );
                                                  debugLogWidgetClass(_model);

                                                  // TEXT 타입 질문인 경우 answerText 표시
                                                  if (answerText != null && answerText.isNotEmpty) {
                                                    return Container(
                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                      padding: EdgeInsets.all(12.0),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      child: Text(
                                                        answerText,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'HakgyoansimNadeuriOTF',
                                                          color: FlutterFlowTheme.of(context).coolGrey90,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        mySelectedAnsers.length,
                                                        (mySelectedAnsersIndex) {
                                                      final mySelectedAnsersItem =
                                                          mySelectedAnsers[
                                                              mySelectedAnsersIndex];
                                                      return Container(
                                                        width: 46.0,
                                                        height: 24.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .oceabSkyGra,
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
                                                            mySelectedAnsersItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HakgyoansimNadeuriOTF',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .oceanBlue70,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 5.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 12.0))
                                              .around(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .red30,
                                          size: 14.0,
                                        ),
                                        Text(
                                          '모두의 답변',
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
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: double.infinity,
                                      constraints: BoxConstraints(
                                        minHeight: 300.0,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final otherAnswers = QuestionsGroup
                                                  .getAnswersByQuestionCall
                                                  .otherAnswers(
                                                    (_model.apiResultGetAnswerByQuestion
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.map((e) => e)
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                          _model.debugGeneratorVariables[
                                                  'otherAnswers${otherAnswers.length > 100 ? ' (first 100)' : ''}'] =
                                              debugSerializeParam(
                                            otherAnswers.take(100),
                                            ParamType.JSON,
                                            isList: true,
                                            link:
                                                'https://app.flutterflow.io/project/dear-link-em0ufw?tab=uiBuilder&page=Q_AnswerSelectPage',
                                            name: 'dynamic',
                                            nullable: false,
                                          );
                                          debugLogWidgetClass(_model);

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.vertical,
                                            itemCount: otherAnswers.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            itemBuilder:
                                                (context, otherAnswersIndex) {
                                              final otherAnswersItem =
                                                  otherAnswers[
                                                      otherAnswersIndex];
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                constraints: BoxConstraints(
                                                  minHeight: 111.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .coolGrey0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
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
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 32.0,
                                                              height: 32.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                otherAnswersItem
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              AnswerWIthUserStruct
                                                                      .maybeFromMap(
                                                                          otherAnswersItem)!
                                                                  .user
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'HakgyoansimNadeuriOTF',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .coolGrey90,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      StyledDivider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .oceanBlue0,
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashed,
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 46.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .oceabSkyGra,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '#행복',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'HakgyoansimNadeuriOTF',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).oceanBlue70,
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
                                                             Builder(
                                                               builder: (context) {
                                                                 // otherAnswers의 selectedOptions 디버깅
                                                                 print('=== DEBUG: OtherAnswer ===');
                                                                 print('OtherAnswerItem: $otherAnswersItem');
                                                                 
                                                                 final selectedOptionsJson = getJsonField(
                                                                   otherAnswersItem,
                                                                   r'''$.selectedOptions''',
                                                                   true,
                                                                 ) as List?;
                                                                 print('Other SelectedOptions JSON: $selectedOptionsJson');
                                                                 print('Other SelectedOptions Type: ${selectedOptionsJson.runtimeType}');
                                                                 
                                                                 final selectedOptions = selectedOptionsJson
                                                                     ?.map((e) => e.toString())
                                                                     .toList() ?? [];
                                                                 print('Other Parsed selectedOptions: $selectedOptions');
                                                                 print('Other Count: ${selectedOptions.length}');
                                                                 
                                                                 // 무한 루프 방지를 위해 setState 제거
                                                                 // API 응답이 완료되면 자동으로 UI가 업데이트됨
                                                                 
                                                                 return Row(
                                                                   mainAxisSize: MainAxisSize.max,
                                                                   children: List.generate(
                                                                     selectedOptions.length,
                                                                     (index) {
                                                                       final option = selectedOptions[index];
                                                                       print('Creating tag for option: $option');
                                                                       return Container(
                                                                         width: 46.0,
                                                                         height: 24.0,
                                                                         decoration: BoxDecoration(
                                                                           color: FlutterFlowTheme.of(context).oceabSkyGra,
                                                                           borderRadius: BorderRadius.circular(8.0),
                                                                         ),
                                                                         child: Align(
                                                                           alignment: AlignmentDirectional(0.0, 0.0),
                                                                           child: Text(
                                                                             option,
                                                                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                               fontFamily: 'HakgyoansimNadeuriOTF',
                                                                               color: FlutterFlowTheme.of(context).oceanBlue70,
                                                                               fontSize: 12.0,
                                                                               letterSpacing: 0.0,
                                                                             ),
                                                                           ),
                                                                         ),
                                                                       );
                                                                     },
                                                                   ).divide(SizedBox(width: 5.0)),
                                                                 );
                                                               },
                                                             ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 12.0))
                                                              .around(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 8.0))
                                      .around(SizedBox(height: 8.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
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
