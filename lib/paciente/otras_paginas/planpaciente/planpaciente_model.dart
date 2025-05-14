import '/componentes/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'planpaciente_widget.dart' show PlanpacienteWidget;
import 'package:flutter/material.dart';

class PlanpacienteModel extends FlutterFlowModel<PlanpacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
