import '/componentes/side_nav/side_nav_widget.dart';
import '/componentes/tabla_consultas/tabla_consultas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consultas_widget.dart' show ConsultasWidget;
import 'package:flutter/material.dart';

class ConsultasModel extends FlutterFlowModel<ConsultasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;
  // Model for tablaConsultas component.
  late TablaConsultasModel tablaConsultasModel;

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
    tablaConsultasModel = createModel(context, () => TablaConsultasModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    sideNavModel2.dispose();
    tablaConsultasModel.dispose();
  }
}
