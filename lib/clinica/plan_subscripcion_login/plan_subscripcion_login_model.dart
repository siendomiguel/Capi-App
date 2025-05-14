import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'plan_subscripcion_login_widget.dart' show PlanSubscripcionLoginWidget;
import 'package:flutter/material.dart';

class PlanSubscripcionLoginModel
    extends FlutterFlowModel<PlanSubscripcionLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? userClinica;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? starterCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createSuscription;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? suscriptionWithCustomer;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? clinicaPremium;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? premiumCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createPremiumSuscription;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? premiumSuscription;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? clinicaElite;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? eliteCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createEliteSubscription;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? eliteSubscription;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
