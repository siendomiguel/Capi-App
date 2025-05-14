import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscripcion_wait_widget.dart' show SubscripcionWaitWidget;
import 'package:flutter/material.dart';

class SubscripcionWaitModel extends FlutterFlowModel<SubscripcionWaitWidget> {
  ///  Local state fields for this component.

  bool verificado = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in subscripcionWait widget.
  ClinicaRecord? readClinica;
  // Stores action output result for [Backend Call - API (Consulta  Suscripcion activa)] action in subscripcionWait widget.
  ApiCallResponse? apiResultooc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
