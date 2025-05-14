import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tabl_antecedentes_widget.dart' show TablAntecedentesWidget;
import 'package:flutter/material.dart';

class TablAntecedentesModel extends FlutterFlowModel<TablAntecedentesWidget> {
  ///  Local state fields for this component.

  bool isUpdate = false;

  DocumentReference? updateDocument;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for dd_Antecedentes widget.
  String? ddAntecedentesValue;
  FormFieldController<String>? ddAntecedentesValueController;
  // State field(s) for tf_detalles widget.
  FocusNode? tfDetallesFocusNode;
  TextEditingController? tfDetallesTextController;
  String? Function(BuildContext, String?)? tfDetallesTextControllerValidator;
  // State field(s) for dd_aplica widget.
  bool? ddAplicaValue;
  FormFieldController<bool>? ddAplicaValueController;
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
  AntecedentesRecord? crearAntecedente;

  @override
  void initState(BuildContext context) {
    tfNotasTextControllerValidator = _tfNotasTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tfDetallesFocusNode?.dispose();
    tfDetallesTextController?.dispose();

    tfNotasFocusNode?.dispose();
    tfNotasTextController?.dispose();
  }
}
