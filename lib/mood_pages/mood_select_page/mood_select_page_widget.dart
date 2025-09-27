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
import 'mood_select_page_model.dart';
export 'mood_select_page_model.dart';

class MoodSelectPageWidget extends StatefulWidget {
  const MoodSelectPageWidget({
    super.key,
    this.question,
  });

  final QuestionStruct? question;

  static String routeName = 'MoodSelectPage';
  static String routePath = '/moodSelect';

  @override
  State<MoodSelectPageWidget> createState() => _MoodSelectPageWidgetState();
}

class _MoodSelectPageWidgetState extends State<MoodSelectPageWidget>
    with RouteAware {
  late MoodSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('=== DEBUG: MoodSelectPage initState() called ===');
    
    _model = createModel(context, () => MoodSelectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _loadMoodOptions();
    });
  }

  bool _isLoading = false;
  String? _selectedMood;
  List<MoodOptionStruct> _moodOptions = [];
  
  Future<void> _loadMoodOptions() async {
    if (_isLoading) return;
    
    _isLoading = true;
    print('=== DEBUG: Loading mood options ===');
    
    try {
      _model.apiResultGetMoodOptions = await MoodAPIGroup.getMoodOptionsCall.call(
        authToken: currentJwtToken,
      );
      
      final options = MoodAPIGroup.getMoodOptionsCall.options(
        _model.apiResultGetMoodOptions?.jsonBody ?? '',
      ) ?? [];
      
      setState(() {
        _moodOptions = options;
      });
      
      print('=== DEBUG: Loaded ${options.length} mood options ===');
      for (var option in options) {
        print('Option: ${option.value} - ${option.label}');
      }
    } catch (e) {
      print('=== DEBUG: Error loading mood options: $e ===');
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _saveMood(String moodValue, String moodLabel) async {
    if (_isLoading) return;
    
    _isLoading = true;
    print('=== DEBUG: Saving mood: $moodValue ($moodLabel) ===');
    
    try {
      final response = await MoodAPIGroup.saveMoodCall.call(
        linkId: FFAppState().linkId,
        moodValue: moodValue,
        moodLabel: moodLabel,
        authToken: currentJwtToken,
      );
      
      if (response?.succeeded ?? false) {
        print('=== DEBUG: Mood saved successfully ===');
        
        // 성공 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오늘의 감정이 저장되었습니다!'),
            backgroundColor: Colors.green,
          ),
        );
        
        // 원래 질문의 답변 결과 페이지로 이동
        if (widget.question != null) {
          if (widget.question!.questionType == 'TEXT') {
            print('=== DEBUG: Navigating to QAnswerPageWidget after mood save ===');
            context.pushNamed(
              QAnswerPageWidget.routeName,
              queryParameters: {
                'question': serializeParam(
                  widget.question!,
                  ParamType.DataStruct,
                ),
              }.withoutNulls,
            );
          } else {
            print('=== DEBUG: Navigating to QAnswerSelectPageWidget after mood save ===');
            context.pushNamed(
              QAnswerSelectPageWidget.routeName,
              queryParameters: {
                'question': serializeParam(
                  widget.question!,
                  ParamType.DataStruct,
                ),
              }.withoutNulls,
            );
          }
        } else {
          // 질문 정보가 없으면 이전 페이지로 돌아가기
          context.safePop();
        }
      } else {
        print('=== DEBUG: Failed to save mood ===');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('감정 저장에 실패했습니다.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('=== DEBUG: Error saving mood: $e ===');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('오류가 발생했습니다: $e'),
          backgroundColor: Colors.red,
        ),
      );
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
  void didUpdateWidget(MoodSelectPageWidget oldWidget) {
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
    print('=== DEBUG: MoodSelectPage build() called ===');
    print('Selected mood: $_selectedMood');
    print('Mood options count: ${_moodOptions.length}');
    
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
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                                  '오늘의 감정',
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
                              '오늘은 어떤 감정을 느꼈어?',
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: _isLoading && _moodOptions.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              )
                            : Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                children: _moodOptions.map((option) {
                                  final isSelected = _selectedMood == option.value;
                                  
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        _selectedMood = option.value;
                                      });
                                      print('=== DEBUG: Selected mood: ${option.value} ===');
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minWidth: 85.0,
                                        // maxWidth: MediaQuery.sizeOf(context).width * 0.35,
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? FlutterFlowTheme.of(context).coolGrey0
                                            : FlutterFlowTheme.of(context).oceanSea,
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: isSelected
                                              ? FlutterFlowTheme.of(context).oceanBlue90
                                              : Color(0x00000000),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Color(0x00000000)
                                                  : FlutterFlowTheme.of(context).coolGrey0,
                                              borderRadius: BorderRadius.circular(100.0),
                                            ),
                                            child: Visibility(
                                              visible: isSelected,
                                              child: Icon(
                                                Icons.check_circle,
                                                color: FlutterFlowTheme.of(context).oceanBlue90,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Flexible(
                                            child: Text(
                                              option.label,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                                    color: FlutterFlowTheme.of(context).oceanBlue90,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FFButtonWidget(
                        onPressed: _selectedMood != null && !_isLoading
                            ? () async {
                                final selectedOption = _moodOptions.firstWhere(
                                  (option) => option.value == _selectedMood,
                                );
                                await _saveMood(selectedOption.value, selectedOption.label);
                              }
                            : null,
                        text: '완료',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: _selectedMood != null
                              ? FlutterFlowTheme.of(context).oceanBlue90
                              : FlutterFlowTheme.of(context).oceanBlue30,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'HakgyoansimNadeuriOTF',
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
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
