import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'olvido_contrasena_widget.dart' show OlvidoContrasenaWidget;
import 'package:flutter/material.dart';

class OlvidoContrasenaModel extends FlutterFlowModel<OlvidoContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
