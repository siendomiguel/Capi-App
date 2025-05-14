import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tabla_signos_vitales_widget.dart' show TablaSignosVitalesWidget;
import 'package:flutter/material.dart';

class TablaSignosVitalesModel
    extends FlutterFlowModel<TablaSignosVitalesWidget> {
  ///  Local state fields for this component.

  bool isUpdate = false;

  DocumentReference? updateDocument;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for dd_signo widget.
  String? ddSignoValue;
  FormFieldController<String>? ddSignoValueController;
  // State field(s) for tf_valor widget.
  FocusNode? tfValorFocusNode;
  TextEditingController? tfValorTextController;
  String? Function(BuildContext, String?)? tfValorTextControllerValidator;
  String? _tfValorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for tf_notas widget.
  FocusNode? tfNotasFocusNode;
  TextEditingController? tfNotasTextController;
  String? Function(BuildContext, String?)? tfNotasTextControllerValidator;
  String? _tfNotasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SignosVitalesRecord? crearSigno;

  @override
  void initState(BuildContext context) {
    tfValorTextControllerValidator = _tfValorTextControllerValidator;
    tfNotasTextControllerValidator = _tfNotasTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tfValorFocusNode?.dispose();
    tfValorTextController?.dispose();

    tfNotasFocusNode?.dispose();
    tfNotasTextController?.dispose();
  }
}
