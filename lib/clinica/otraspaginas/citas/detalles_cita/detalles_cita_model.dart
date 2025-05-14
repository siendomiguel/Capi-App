import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalles_cita_widget.dart' show DetallesCitaWidget;
import 'package:flutter/material.dart';

class DetallesCitaModel extends FlutterFlowModel<DetallesCitaWidget> {
  ///  Local state fields for this page.

  bool delay = false;

  String? zoomLink;

  String? apiStripe;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in detallesCita widget.
  ClinicaRecord? dataClinicaInitial;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? dataClinica;
  // Stores action output result for [Backend Call - API (Stripe Checkout Payment)] action in Button widget.
  ApiCallResponse? stripeCheckoutCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ServiciosRecord? dataService;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataDoctorCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataPacienteCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? newNotificacion;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataDoctor;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataPaciente;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? notifyConfirmMeeting;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
