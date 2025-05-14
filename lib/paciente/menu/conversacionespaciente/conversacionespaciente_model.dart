import '/flutter_flow/flutter_flow_util.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'conversacionespaciente_widget.dart' show ConversacionespacienteWidget;
import 'package:flutter/material.dart';

class ConversacionespacienteModel
    extends FlutterFlowModel<ConversacionespacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel1;
  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel2;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel1 = createModel(context, () => SideNavPacienteModel());
    sideNavPacienteModel2 = createModel(context, () => SideNavPacienteModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel1.dispose();
    sideNavPacienteModel2.dispose();
  }
}
