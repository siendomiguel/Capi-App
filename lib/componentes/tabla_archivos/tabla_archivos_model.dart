import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_archivos_widget.dart' show TablaArchivosWidget;
import 'package:flutter/material.dart';

class TablaArchivosModel extends FlutterFlowModel<TablaArchivosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EstudiosArchivosRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
