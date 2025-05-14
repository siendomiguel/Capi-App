import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'acciones_citas_paciente_widget.dart' show AccionesCitasPacienteWidget;
import 'package:flutter/material.dart';

class AccionesCitasPacienteModel
    extends FlutterFlowModel<AccionesCitasPacienteWidget> {
  ///  Local state fields for this component.

  bool clicChat = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? queryChat;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Container widget.
  ApiCallResponse? createThreadId;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatThread1;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? dataDoctor;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServiciosRecord? dataService;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? dataPaciente;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  NotificacionesRecord? newNotificacion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
