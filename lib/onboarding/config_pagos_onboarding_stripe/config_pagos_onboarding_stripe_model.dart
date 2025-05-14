import '/flutter_flow/flutter_flow_util.dart';
import 'config_pagos_onboarding_stripe_widget.dart'
    show ConfigPagosOnboardingStripeWidget;
import 'package:flutter/material.dart';

class ConfigPagosOnboardingStripeModel
    extends FlutterFlowModel<ConfigPagosOnboardingStripeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tf_stripePK widget.
  FocusNode? tfStripePKFocusNode1;
  TextEditingController? tfStripePKTextController1;
  late bool tfStripePKVisibility1;
  String? Function(BuildContext, String?)? tfStripePKTextController1Validator;
  // State field(s) for tf_stripePK widget.
  FocusNode? tfStripePKFocusNode2;
  TextEditingController? tfStripePKTextController2;
  late bool tfStripePKVisibility2;
  String? Function(BuildContext, String?)? tfStripePKTextController2Validator;

  @override
  void initState(BuildContext context) {
    tfStripePKVisibility1 = false;
    tfStripePKVisibility2 = false;
  }

  @override
  void dispose() {
    tfStripePKFocusNode1?.dispose();
    tfStripePKTextController1?.dispose();

    tfStripePKFocusNode2?.dispose();
    tfStripePKTextController2?.dispose();
  }
}
