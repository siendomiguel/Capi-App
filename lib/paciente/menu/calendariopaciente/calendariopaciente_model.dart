import '/backend/backend.dart';
import '/componentes/estado_vacio/estado_vacio_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'calendariopaciente_widget.dart' show CalendariopacienteWidget;
import 'package:flutter/material.dart';

class CalendariopacienteModel
    extends FlutterFlowModel<CalendariopacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel1;
  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomCalendar widget.
  CitasRecord? citaActual;
  // Stores action output result for [Backend Call - Read Document] action in CustomCalendar widget.
  ServiciosRecord? dataServicio;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomCalendar widget.
  ConsultaRecord? consulta;
  // Model for estadoVacio component.
  late EstadoVacioModel estadoVacioModel;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel1 = createModel(context, () => SideNavPacienteModel());
    sideNavPacienteModel2 = createModel(context, () => SideNavPacienteModel());
    estadoVacioModel = createModel(context, () => EstadoVacioModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel1.dispose();
    sideNavPacienteModel2.dispose();
    estadoVacioModel.dispose();
  }
}
