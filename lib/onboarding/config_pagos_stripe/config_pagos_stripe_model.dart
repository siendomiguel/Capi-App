import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'config_pagos_stripe_widget.dart' show ConfigPagosStripeWidget;
import 'package:flutter/material.dart';

class ConfigPagosStripeModel extends FlutterFlowModel<ConfigPagosStripeWidget> {
  ///  Local state fields for this component.

  bool consultarVinculacion = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for verVideo widget.
  bool? verVideoValue;
  // State field(s) for tf_stripePK widget.
  FocusNode? tfStripePKFocusNode;
  TextEditingController? tfStripePKTextController;
  late bool tfStripePKVisibility;
  String? Function(BuildContext, String?)? tfStripePKTextControllerValidator;
  // State field(s) for stripeSK_key widget.
  FocusNode? stripeSKKeyFocusNode;
  TextEditingController? stripeSKKeyTextController;
  late bool stripeSKKeyVisibility;
  String? Function(BuildContext, String?)? stripeSKKeyTextControllerValidator;
  // Stores action output result for [Backend Call - API (Revoke Auth Stripe Connect)] action in Button widget.
  ApiCallResponse? apiResultge7;

  @override
  void initState(BuildContext context) {
    tfStripePKVisibility = false;
    stripeSKKeyVisibility = false;
  }

  @override
  void dispose() {
    tfStripePKFocusNode?.dispose();
    tfStripePKTextController?.dispose();

    stripeSKKeyFocusNode?.dispose();
    stripeSKKeyTextController?.dispose();
  }
}
