import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tabla_cita_especifica_paciente_widget.dart'
    show TablaCitaEspecificaPacienteWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TablaCitaEspecificaPacienteModel
    extends FlutterFlowModel<TablaCitaEspecificaPacienteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CitasRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ConsultaRecord? consultaQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
