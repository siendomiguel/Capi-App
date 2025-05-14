import '/componentes/side_nav/side_nav_widget.dart';
import '/componentes/tabla_cita/tabla_cita_widget.dart';
import '/componentes/tabla_cita_asistente/tabla_cita_asistente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'citas_widget.dart' show CitasWidget;
import 'package:flutter/material.dart';

class CitasModel extends FlutterFlowModel<CitasWidget> {
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
  // Model for tablaCita component.
  late TablaCitaModel tablaCitaModel;
  // Model for tablaCitaAsistente component.
  late TablaCitaAsistenteModel tablaCitaAsistenteModel;

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
    tablaCitaModel = createModel(context, () => TablaCitaModel());
    tablaCitaAsistenteModel =
        createModel(context, () => TablaCitaAsistenteModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    sideNavModel2.dispose();
    tablaCitaModel.dispose();
    tablaCitaAsistenteModel.dispose();
  }
}
