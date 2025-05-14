import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tabla_cita_especifica_widget.dart' show TablaCitaEspecificaWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TablaCitaEspecificaModel
    extends FlutterFlowModel<TablaCitaEspecificaWidget> {
  ///  Local state fields for this component.

  DateTime? selectDay;

  bool searchActive = false;

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
  DateTime? datePicked;
  // Stores action output result for [Custom Action - busquedaPorDiaCitas] action in IconButton widget.
  List<CitasRecord>? searchCitas;
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
