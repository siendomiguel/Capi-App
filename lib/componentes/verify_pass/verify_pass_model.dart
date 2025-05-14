import '/flutter_flow/flutter_flow_util.dart';
import 'verify_pass_widget.dart' show VerifyPassWidget;
import 'package:flutter/material.dart';

class VerifyPassModel extends FlutterFlowModel<VerifyPassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tf_password widget.
  FocusNode? tfPasswordFocusNode;
  TextEditingController? tfPasswordTextController;
  late bool tfPasswordVisibility;
  String? Function(BuildContext, String?)? tfPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - validarPassword] action in Button widget.
  bool? validaPass;

  @override
  void initState(BuildContext context) {
    tfPasswordVisibility = false;
  }

  @override
  void dispose() {
    tfPasswordFocusNode?.dispose();
    tfPasswordTextController?.dispose();
  }
}
