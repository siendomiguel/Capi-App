import '/backend/backend.dart';
import '/componentes/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServiciosRecord? readServiceDoctor;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServiciosRecord? readServiceAsistente;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServiciosRecord? readServicePaciente;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CitasRecord? getCita;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
