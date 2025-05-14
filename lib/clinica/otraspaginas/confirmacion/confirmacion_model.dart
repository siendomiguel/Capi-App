import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmacion_widget.dart' show ConfirmacionWidget;
import 'package:flutter/material.dart';

class ConfirmacionModel extends FlutterFlowModel<ConfirmacionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PagarCita widget.
  UsersRecord? doctorData;
  // Stores action output result for [Backend Call - Read Document] action in PagarCita widget.
  ClinicaRecord? dataClinica;
  // Stores action output result for [Backend Call - API (Stripe Checkout Payment)] action in PagarCita widget.
  ApiCallResponse? stripeCheckoutCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in PagarCita widget.
  UsersRecord? doctorDataTest;
  // Stores action output result for [Backend Call - Read Document] action in PagarCita widget.
  ClinicaRecord? dataClinicaTest;
  // Stores action output result for [Backend Call - API (Stripe Checkout Connect)] action in PagarCita widget.
  ApiCallResponse? checkoutStripeConnect;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
