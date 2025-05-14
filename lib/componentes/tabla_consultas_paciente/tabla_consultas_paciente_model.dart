import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_consultas_paciente_widget.dart' show TablaConsultasPacienteWidget;
import 'package:flutter/material.dart';

class TablaConsultasPacienteModel
    extends FlutterFlowModel<TablaConsultasPacienteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ConsultaRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
