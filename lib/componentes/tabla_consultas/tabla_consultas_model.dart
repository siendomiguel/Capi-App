import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_consultas_widget.dart' show TablaConsultasWidget;
import 'package:flutter/material.dart';

class TablaConsultasModel extends FlutterFlowModel<TablaConsultasWidget> {
  ///  Local state fields for this component.

  DateTime? selectDay;

  bool searchActive = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ConsultaRecord> simpleSearchResults = [];
  DateTime? datePicked;
  // Stores action output result for [Custom Action - busquedaPorDiaConsultas] action in IconButton widget.
  List<ConsultaRecord>? searchDay;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
