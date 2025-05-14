import '/componentes/info_familiar_main/info_familiar_main_widget.dart';
import '/componentes/tabl_antecedentes/tabl_antecedentes_widget.dart';
import '/componentes/tabla_archivos/tabla_archivos_widget.dart';
import '/componentes/tabla_cita_especifica/tabla_cita_especifica_widget.dart';
import '/componentes/tablaalergias/tablaalergias_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detalles_paciente_widget.dart' show DetallesPacienteWidget;
import 'package:flutter/material.dart';

class DetallesPacienteModel extends FlutterFlowModel<DetallesPacienteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for tablaalergias component.
  late TablaalergiasModel tablaalergiasModel;
  // Model for infoFamiliarMain component.
  late InfoFamiliarMainModel infoFamiliarMainModel;
  // Model for tablAntecedentes component.
  late TablAntecedentesModel tablAntecedentesModel;
  // Model for tablaArchivos component.
  late TablaArchivosModel tablaArchivosModel;
  // Model for tablaCitaEspecifica component.
  late TablaCitaEspecificaModel tablaCitaEspecificaModel;

  @override
  void initState(BuildContext context) {
    tablaalergiasModel = createModel(context, () => TablaalergiasModel());
    infoFamiliarMainModel = createModel(context, () => InfoFamiliarMainModel());
    tablAntecedentesModel = createModel(context, () => TablAntecedentesModel());
    tablaArchivosModel = createModel(context, () => TablaArchivosModel());
    tablaCitaEspecificaModel =
        createModel(context, () => TablaCitaEspecificaModel());
  }

  @override
  void dispose() {
    tablaalergiasModel.dispose();
    infoFamiliarMainModel.dispose();
    tablAntecedentesModel.dispose();
    tablaArchivosModel.dispose();
    tablaCitaEspecificaModel.dispose();
  }
}
