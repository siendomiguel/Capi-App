import '/backend/backend.dart';
import '/componentes/estado_vacio/estado_vacio_widget.dart';
import '/componentes/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:flutter/material.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomCalendar widget.
  CitasRecord? citaActual;
  // Model for estadoVacio component.
  late EstadoVacioModel estadoVacioModel;

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
    estadoVacioModel = createModel(context, () => EstadoVacioModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    sideNavModel2.dispose();
    estadoVacioModel.dispose();
  }
}
