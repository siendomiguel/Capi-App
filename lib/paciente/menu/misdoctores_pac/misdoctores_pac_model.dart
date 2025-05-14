import '/components/misdoctores_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'misdoctores_pac_widget.dart' show MisdoctoresPacWidget;
import 'package:flutter/material.dart';

class MisdoctoresPacModel extends FlutterFlowModel<MisdoctoresPacWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel1;
  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel2;
  // Model for Misdoctores component.
  late MisdoctoresModel misdoctoresModel1;
  // Model for Misdoctores component.
  late MisdoctoresModel misdoctoresModel2;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel1 = createModel(context, () => SideNavPacienteModel());
    sideNavPacienteModel2 = createModel(context, () => SideNavPacienteModel());
    misdoctoresModel1 = createModel(context, () => MisdoctoresModel());
    misdoctoresModel2 = createModel(context, () => MisdoctoresModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel1.dispose();
    sideNavPacienteModel2.dispose();
    misdoctoresModel1.dispose();
    misdoctoresModel2.dispose();
  }
}
