import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldOldPass widget.
  FocusNode? textFieldOldPassFocusNode;
  TextEditingController? textFieldOldPassTextController;
  late bool textFieldOldPassVisibility;
  String? Function(BuildContext, String?)?
      textFieldOldPassTextControllerValidator;
  // State field(s) for TextFieldNewPass widget.
  FocusNode? textFieldNewPassFocusNode;
  TextEditingController? textFieldNewPassTextController;
  late bool textFieldNewPassVisibility;
  String? Function(BuildContext, String?)?
      textFieldNewPassTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;

  @override
  void initState(BuildContext context) {
    textFieldOldPassVisibility = false;
    textFieldNewPassVisibility = false;
  }

  @override
  void dispose() {
    textFieldOldPassFocusNode?.dispose();
    textFieldOldPassTextController?.dispose();

    textFieldNewPassFocusNode?.dispose();
    textFieldNewPassTextController?.dispose();
  }
}
