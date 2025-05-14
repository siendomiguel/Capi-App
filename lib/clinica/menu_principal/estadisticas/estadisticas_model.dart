import '/componentes/estado_vacio/estado_vacio_widget.dart';
import '/componentes/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'estadisticas_widget.dart' show EstadisticasWidget;
import 'package:flutter/material.dart';

class EstadisticasModel extends FlutterFlowModel<EstadisticasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
