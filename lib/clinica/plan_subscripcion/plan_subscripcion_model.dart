import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'plan_subscripcion_widget.dart' show PlanSubscripcionWidget;
import 'package:flutter/material.dart';

class PlanSubscripcionModel extends FlutterFlowModel<PlanSubscripcionWidget> {
  ///  Local state fields for this page.

  bool hasActiveSusbription = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in planSubscripcion widget.
  ClinicaRecord? datosClinicaDesdePropietario;
  // Stores action output result for [Backend Call - API (Consulta  Suscripcion activa)] action in planSubscripcion widget.
  ApiCallResponse? apiResultvxt;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? starterCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createSuscription;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? premiumCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createSuscriptionPremium;
  // Stores action output result for [Backend Call - API (createCustomer)] action in Button widget.
  ApiCallResponse? eliteCustomer;
  // Stores action output result for [Backend Call - API (createCheckoutSessions)] action in Button widget.
  ApiCallResponse? createEliteSubscription;
  // State field(s) for TextFieldCodigo widget.
  FocusNode? textFieldCodigoFocusNode;
  TextEditingController? textFieldCodigoTextController;
  String? Function(BuildContext, String?)?
      textFieldCodigoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCodigoFocusNode?.dispose();
    textFieldCodigoTextController?.dispose();
  }
}
