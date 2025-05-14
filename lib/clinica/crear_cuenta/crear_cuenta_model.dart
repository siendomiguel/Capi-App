import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_cuenta_widget.dart' show CrearCuentaWidget;
import 'package:flutter/material.dart';

class CrearCuentaModel extends FlutterFlowModel<CrearCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CheckboxPoliticas widget.
  bool? checkboxPoliticasValue;
  // State field(s) for emailAddressDoc widget.
  FocusNode? emailAddressDocFocusNode;
  TextEditingController? emailAddressDocTextController;
  String? Function(BuildContext, String?)?
      emailAddressDocTextControllerValidator;
  String? _emailAddressDocTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for passwordDoc widget.
  FocusNode? passwordDocFocusNode;
  TextEditingController? passwordDocTextController;
  late bool passwordDocVisibility;
  String? Function(BuildContext, String?)? passwordDocTextControllerValidator;
  String? _passwordDocTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ChoiceChipsTipoCuenta widget.
  FormFieldController<List<String>>? choiceChipsTipoCuentaValueController;
  String? get choiceChipsTipoCuentaValue =>
      choiceChipsTipoCuentaValueController?.value?.firstOrNull;
  set choiceChipsTipoCuentaValue(String? val) =>
      choiceChipsTipoCuentaValueController?.value = val != null ? [val] : [];
  // State field(s) for CheckboxPoliticasDoc widget.
  bool? checkboxPoliticasDocValue;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    emailAddressDocTextControllerValidator =
        _emailAddressDocTextControllerValidator;
    passwordDocVisibility = false;
    passwordDocTextControllerValidator = _passwordDocTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    emailAddressDocFocusNode?.dispose();
    emailAddressDocTextController?.dispose();

    passwordDocFocusNode?.dispose();
    passwordDocTextController?.dispose();
  }
}
