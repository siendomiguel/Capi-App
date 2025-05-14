import '/backend/api_requests/api_calls.dart';
import '/componentes/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mi_plan_widget.dart' show MiPlanWidget;
import 'package:flutter/material.dart';

class MiPlanModel extends FlutterFlowModel<MiPlanWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;
  // Stores action output result for [Backend Call - API (customerPortal)] action in Button widget.
  ApiCallResponse? link2CustPortal;

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    sideNavModel2.dispose();
  }
}
