import '/flutter_flow/flutter_flow_util.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'perfil_paciente_widget.dart' show PerfilPacienteWidget;
import 'package:flutter/material.dart';

class PerfilPacienteModel extends FlutterFlowModel<PerfilPacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel = createModel(context, () => SideNavPacienteModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel.dispose();
  }
}
