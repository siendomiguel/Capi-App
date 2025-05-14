import '/flutter_flow/flutter_flow_util.dart';
import 'config_zoom_onboarding_widget.dart' show ConfigZoomOnboardingWidget;
import 'package:flutter/material.dart';

class ConfigZoomOnboardingModel
    extends FlutterFlowModel<ConfigZoomOnboardingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tf_zoomLink widget.
  FocusNode? tfZoomLinkFocusNode;
  TextEditingController? tfZoomLinkTextController;
  String? Function(BuildContext, String?)? tfZoomLinkTextControllerValidator;
  // State field(s) for Skype widget.
  FocusNode? skypeFocusNode;
  TextEditingController? skypeTextController;
  late bool skypeVisibility;
  String? Function(BuildContext, String?)? skypeTextControllerValidator;
  // State field(s) for Terminos widget.
  FocusNode? terminosFocusNode;
  TextEditingController? terminosTextController;
  late bool terminosVisibility;
  String? Function(BuildContext, String?)? terminosTextControllerValidator;

  @override
  void initState(BuildContext context) {
    skypeVisibility = false;
    terminosVisibility = false;
  }

  @override
  void dispose() {
    tfZoomLinkFocusNode?.dispose();
    tfZoomLinkTextController?.dispose();

    skypeFocusNode?.dispose();
    skypeTextController?.dispose();

    terminosFocusNode?.dispose();
    terminosTextController?.dispose();
  }
}
