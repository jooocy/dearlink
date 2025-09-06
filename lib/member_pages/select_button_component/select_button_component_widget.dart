import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_button_component_model.dart';
export 'select_button_component_model.dart';

class SelectButtonComponentWidget extends StatefulWidget {
  const SelectButtonComponentWidget({
    super.key,
    String? outputValue,
    int? width,
    this.height,
    String? displayText,
    bool? isReadOnly,
    required this.widgetValue,
  })  : this.outputValue = outputValue ?? 'good',
        this.width = width ?? 34,
        this.displayText = displayText ?? 'nice',
        this.isReadOnly = isReadOnly ?? true;

  final String outputValue;
  final int width;

  /// 34
  final int? height;

  final String displayText;
  final bool isReadOnly;
  final String? widgetValue;

  @override
  State<SelectButtonComponentWidget> createState() =>
      _SelectButtonComponentWidgetState();
}

class _SelectButtonComponentWidgetState
    extends State<SelectButtonComponentWidget> with RouteAware {
  late SelectButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectButtonComponentModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.maybeDispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(SelectButtonComponentWidget oldWidget) {
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

    return Visibility(
      visible:
          !widget!.isReadOnly || (widget!.outputValue == widget!.widgetValue),
      child: Container(
        width: widget!.width.toDouble(),
        height: widget!.height?.toDouble(),
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.outputValue == widget!.widgetValue
                ? FlutterFlowTheme.of(context).oceanBlue70
                : FlutterFlowTheme.of(context).coolGrey20,
            FlutterFlowTheme.of(context).coolGrey20,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget!.displayText,
              'AB',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'HakgyoansimNadeuriOTF',
                  color: widget!.outputValue == widget!.widgetValue
                      ? FlutterFlowTheme.of(context).coolGrey20
                      : Colors.black,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
