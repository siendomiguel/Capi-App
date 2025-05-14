import '/componentes/info_familiar_main/info_familiar_main_widget.dart';
import '/componentes/tabl_antecedentes/tabl_antecedentes_widget.dart';
import '/componentes/tabla_archivos_paciente/tabla_archivos_paciente_widget.dart';
import '/componentes/tabla_consultas_paciente/tabla_consultas_paciente_widget.dart';
import '/componentes/tablaalergias/tablaalergias_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'detalles_perfil_paciente_widget.dart' show DetallesPerfilPacienteWidget;
import 'package:flutter/material.dart';

class DetallesPerfilPacienteModel
    extends FlutterFlowModel<DetallesPerfilPacienteWidget> {
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
  // Model for tablaArchivosPaciente component.
  late TablaArchivosPacienteModel tablaArchivosPacienteModel;
  // Model for tablaConsultasPaciente component.
  late TablaConsultasPacienteModel tablaConsultasPacienteModel;

  @override
  void initState(BuildContext context) {
    tablaalergiasModel = createModel(context, () => TablaalergiasModel());
    infoFamiliarMainModel = createModel(context, () => InfoFamiliarMainModel());
    tablAntecedentesModel = createModel(context, () => TablAntecedentesModel());
    tablaArchivosPacienteModel =
        createModel(context, () => TablaArchivosPacienteModel());
    tablaConsultasPacienteModel =
        createModel(context, () => TablaConsultasPacienteModel());
  }

  @override
  void dispose() {
    tablaalergiasModel.dispose();
    infoFamiliarMainModel.dispose();
    tablAntecedentesModel.dispose();
    tablaArchivosPacienteModel.dispose();
    tablaConsultasPacienteModel.dispose();
  }
}
