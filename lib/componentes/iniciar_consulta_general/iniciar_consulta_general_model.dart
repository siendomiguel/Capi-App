import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'iniciar_consulta_general_widget.dart' show IniciarConsultaGeneralWidget;
import 'package:flutter/material.dart';

class IniciarConsultaGeneralModel
    extends FlutterFlowModel<IniciarConsultaGeneralWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dd_servicio widget.
  String? ddServicioValue;
  FormFieldController<String>? ddServicioValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_servicio widget.
  ServiciosRecord? serviceID;
  // State field(s) for dd_paciente widget.
  String? ddPacienteValue;
  FormFieldController<String>? ddPacienteValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_paciente widget.
  UsersRecord? paceinteID;
  // State field(s) for dd_doctor widget.
  String? ddDoctorValue;
  FormFieldController<String>? ddDoctorValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_doctor widget.
  UsersRecord? docID;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataPaciente;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataDoctor;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CitasRecord? crearCita;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
