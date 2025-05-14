import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboardingpaciente_widget.dart' show OnboardingpacienteWidget;
import 'package:flutter/material.dart';

class OnboardingpacienteModel
    extends FlutterFlowModel<OnboardingpacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
