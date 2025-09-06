import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/header_component2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_code_page_model.dart';
export 'invite_code_page_model.dart';

class InviteCodePageWidget extends StatefulWidget {
  const InviteCodePageWidget({super.key});

  static String routeName = 'InviteCodePage';
  static String routePath = '/inviteCodePage';

  @override
  State<InviteCodePageWidget> createState() => _InviteCodePageWidgetState();
}

class _InviteCodePageWidgetState extends State<InviteCodePageWidget>
    with RouteAware {
  late InviteCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InviteCodePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getActiveCode =
          await InviteAPIGroup.getOrCreateActiveInviteCodeCall.call(
        linkId: FFAppState().linkId,
        authToken: currentJwtToken,
      );

      _model.expiresAtDisplay =
          InviteAPIGroup.getOrCreateActiveInviteCodeCall.expiresAtDisplay(
        (_model.getActiveCode?.jsonBody ?? ''),
      )!;
      safeSetState(() {});
    });

    _model.textfieldTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textfieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(InviteCodePageWidget oldWidget) {
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).oceanBlue0,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.72,
                height: MediaQuery.sizeOf(context).height * 0.22,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/graphic_1.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '초대코드',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).oceanBlue90,
                              ),
                            ),
                            TextSpan(
                              text: '로 마음을 연결해보세요.',
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        maxLines: 2,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 183.0,
                              constraints: BoxConstraints(
                                maxWidth: 600.0,
                                maxHeight: 400.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 39.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.khearticon,
                                            color: FlutterFlowTheme.of(context)
                                                .red30,
                                            size: 18.0,
                                          ),
                                          Text(
                                            '초대코드를 공유해 주세요',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'HakgyoansimNadeuriOTF',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '초대코드',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriOTF',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  InviteAPIGroup
                                                      .getOrCreateActiveInviteCodeCall
                                                      .code(
                                                    (_model.getActiveCode
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  'randomCode',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriOTF',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .oceanBlue60,
                                                          letterSpacing: 0.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await actions.shareText(
                                              InviteAPIGroup
                                                  .getOrCreateActiveInviteCodeCall
                                                  .code(
                                                (_model.getActiveCode
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                            );
                                          },
                                          text: '코드 공유하기',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .oceanBlue60,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'HakgyoansimNadeuriTTF',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .coolGrey20,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    _model.expiresAtDisplay,
                                                    '99시 00분 00초',
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oceanBlue90,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '뒤 코드가 만료돼요',
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.apiResult1jl =
                                                  await InviteAPIGroup
                                                      .getOrCreateActiveInviteCodeCall
                                                      .call(
                                                linkId: FFAppState().linkId,
                                                authToken: currentJwtToken,
                                              );

                                              if ((_model.apiResult1jl
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.expiresAtDisplay =
                                                    InviteAPIGroup
                                                        .getOrCreateActiveInviteCodeCall
                                                        .expiresAtDisplay(
                                                  (_model.apiResult1jl
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              FFIcons.ksmall,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .coolGrey70,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '또는',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HakgyoansimNadeuriOTF',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 195.0,
                              constraints: BoxConstraints(
                                maxWidth: 600.0,
                                maxHeight: 400.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 39.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.khearticon,
                                            color: FlutterFlowTheme.of(context)
                                                .red30,
                                            size: 18.0,
                                          ),
                                          Text(
                                            '전달받은 초대코드 입력',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'HakgyoansimNadeuriOTF',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            child: TextFormField(
                                              controller: _model
                                                  .textfieldTextController,
                                              focusNode:
                                                  _model.textfieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textfieldTextController',
                                                Duration(milliseconds: 2000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriTTF',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: '초대 코드를 입력하세요',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'HakgyoansimNadeuriTTF',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .coolGrey50,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: (_model.textfieldFocusNode
                                                                    ?.hasFocus ??
                                                                false) ==
                                                            false
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .coolGrey50
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .oceanBlue50,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oceanBlue50,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
                                                                .coolGrey90,
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 8,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.none,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textfieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: (_model
                                                      .textfieldTextController
                                                      .text ==
                                                  '')
                                              ? null
                                              : () async {
                                                  _model.joinByCodeRes =
                                                      await InviteAPIGroup
                                                          .joinByCodeCall
                                                          .call(
                                                    inviteCode: _model
                                                        .textfieldTextController
                                                        .text,
                                                    authToken: currentJwtToken,
                                                  );

                                                  if ((_model.joinByCodeRes
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().linkId =
                                                        getJsonField(
                                                      (_model.joinByCodeRes
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data.mainLinkId''',
                                                    ).toString();
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                        HomePageWidget
                                                            .routeName);
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('에러'),
                                                          content:
                                                              Text(getJsonField(
                                                            (_model.joinByCodeRes
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                          text: '연결하기',
                                          icon: Icon(
                                            FFIcons.klink,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .oceanBlue50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'HakgyoansimNadeuriTTF',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor:
                                                FlutterFlowTheme.of(context)
                                                    .oceanBlue0,
                                            disabledTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .coolGrey0,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -0.9),
              child: wrapWithModel(
                model: _model.headerComponent2Model,
                updateCallback: () => safeSetState(() {}),
                child: Builder(builder: (_) {
                  return DebugFlutterFlowModelContext(
                    rootModel: _model.rootModel,
                    child: HeaderComponent2Widget(),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
