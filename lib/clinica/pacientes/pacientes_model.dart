import '/componentes/side_nav/side_nav_widget.dart';
import '/componentes/tabla_pacientes/tabla_pacientes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pacientes_widget.dart' show PacientesWidget;
import 'package:flutter/material.dart';

class PacientesModel extends FlutterFlowModel<PacientesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for tablaPacientes component.
  late TablaPacientesModel tablaPacientesModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    tablaPacientesModel = createModel(context, () => TablaPacientesModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    tablaPacientesModel.dispose();
    sideNavModel2.dispose();
  }
}
