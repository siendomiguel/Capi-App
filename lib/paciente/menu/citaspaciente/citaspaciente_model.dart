import '/componentes/tabla_cita_especifica_paciente/tabla_cita_especifica_paciente_widget.dart';
import '/components/misdoctores_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'citaspaciente_widget.dart' show CitaspacienteWidget;
import 'package:flutter/material.dart';

class CitaspacienteModel extends FlutterFlowModel<CitaspacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel1;
  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel2;
  // Model for Misdoctores component.
  late MisdoctoresModel misdoctoresModel;
  // Model for tablaCitaEspecificaPaciente component.
  late TablaCitaEspecificaPacienteModel tablaCitaEspecificaPacienteModel;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel1 = createModel(context, () => SideNavPacienteModel());
    sideNavPacienteModel2 = createModel(context, () => SideNavPacienteModel());
    misdoctoresModel = createModel(context, () => MisdoctoresModel());
    tablaCitaEspecificaPacienteModel =
        createModel(context, () => TablaCitaEspecificaPacienteModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel1.dispose();
    sideNavPacienteModel2.dispose();
    misdoctoresModel.dispose();
    tablaCitaEspecificaPacienteModel.dispose();
  }
}
