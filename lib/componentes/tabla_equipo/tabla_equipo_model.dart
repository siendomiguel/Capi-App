import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_equipo_widget.dart' show TablaEquipoWidget;
import 'package:flutter/material.dart';

class TablaEquipoModel extends FlutterFlowModel<TablaEquipoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? limiteClinica;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? userChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? updatedChatThread1;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Container widget.
  ApiCallResponse? createThreadId;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatThread1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
