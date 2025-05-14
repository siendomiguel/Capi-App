import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'acciones_paciente_list_widget.dart' show AccionesPacienteListWidget;
import 'package:flutter/material.dart';

class AccionesPacienteListModel
    extends FlutterFlowModel<AccionesPacienteListWidget> {
  ///  Local state fields for this component.

  bool clicButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? userChat;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Container widget.
  ApiCallResponse? createThreadId;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatThread1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
