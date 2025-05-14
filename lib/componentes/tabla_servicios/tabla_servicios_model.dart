import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_servicios_widget.dart' show TablaServiciosWidget;
import 'package:flutter/material.dart';

class TablaServiciosModel extends FlutterFlowModel<TablaServiciosWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in tablaServicios widget.
  List<ServiciosRecord>? validarListaServicios;
  // Stores action output result for [Backend Call - Create Document] action in tablaServicios widget.
  ServiciosRecord? crearServicioDefault;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ServiciosRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  EspecialidadRecord? especialidad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
