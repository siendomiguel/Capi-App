import '/flutter_flow/flutter_flow_util.dart';
import 'busqueda_pacientes_general_widget.dart'
    show BusquedaPacientesGeneralWidget;
import 'package:flutter/material.dart';

class BusquedaPacientesGeneralModel
    extends FlutterFlowModel<BusquedaPacientesGeneralWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
