import '/backend/backend.dart';
import '/componentes/tabla_exp_fisica/tabla_exp_fisica_widget.dart';
import '/componentes/tabla_signos_vitales/tabla_signos_vitales_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'consulta_widget.dart' show ConsultaWidget;
import 'package:flutter/material.dart';

class ConsultaModel extends FlutterFlowModel<ConsultaWidget> {
  ///  Local state fields for this page.

  bool confirmDataCreate = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in consulta widget.
  UsersRecord? queryPaciente;
  // Stores action output result for [Backend Call - Create Document] action in consulta widget.
  ConsultaRecord? crearConsulta;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textFieldTextController1;
  String? Function(BuildContext, String?)? textFieldTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController2;
  String? Function(BuildContext, String?)? textFieldTextController2Validator;
  // State field(s) for Ttf_Objetivo widget.
  FocusNode? ttfObjetivoFocusNode;
  TextEditingController? ttfObjetivoTextController;
  String? Function(BuildContext, String?)? ttfObjetivoTextControllerValidator;
  // State field(s) for tf_Padecimiento widget.
  FocusNode? tfPadecimientoFocusNode;
  TextEditingController? tfPadecimientoTextController;
  String? Function(BuildContext, String?)?
      tfPadecimientoTextControllerValidator;
  // Model for tablaSignosVitales component.
  late TablaSignosVitalesModel tablaSignosVitalesModel;
  // Model for tablaExpFisica component.
  late TablaExpFisicaModel tablaExpFisicaModel;
  // State field(s) for tf_cieGrupo widget.
  FocusNode? tfCieGrupoFocusNode;
  TextEditingController? tfCieGrupoTextController;
  String? Function(BuildContext, String?)? tfCieGrupoTextControllerValidator;
  // State field(s) for tf_cieDetalles widget.
  FocusNode? tfCieDetallesFocusNode;
  TextEditingController? tfCieDetallesTextController;
  String? Function(BuildContext, String?)? tfCieDetallesTextControllerValidator;
  // State field(s) for TextFieldDiagnostico widget.
  FocusNode? textFieldDiagnosticoFocusNode;
  TextEditingController? textFieldDiagnosticoTextController;
  String? Function(BuildContext, String?)?
      textFieldDiagnosticoTextControllerValidator;
  // State field(s) for tf_tratamiento widget.
  FocusNode? tfTratamientoFocusNode;
  TextEditingController? tfTratamientoTextController;
  String? Function(BuildContext, String?)? tfTratamientoTextControllerValidator;
  // State field(s) for tf_notas widget.
  FocusNode? tfNotasFocusNode;
  TextEditingController? tfNotasTextController;
  String? Function(BuildContext, String?)? tfNotasTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiagnosticoTratamientoRecord? crearTratamiento;

  @override
  void initState(BuildContext context) {
    tablaSignosVitalesModel =
        createModel(context, () => TablaSignosVitalesModel());
    tablaExpFisicaModel = createModel(context, () => TablaExpFisicaModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textFieldTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController2?.dispose();

    ttfObjetivoFocusNode?.dispose();
    ttfObjetivoTextController?.dispose();

    tfPadecimientoFocusNode?.dispose();
    tfPadecimientoTextController?.dispose();

    tablaSignosVitalesModel.dispose();
    tablaExpFisicaModel.dispose();
    tfCieGrupoFocusNode?.dispose();
    tfCieGrupoTextController?.dispose();

    tfCieDetallesFocusNode?.dispose();
    tfCieDetallesTextController?.dispose();

    textFieldDiagnosticoFocusNode?.dispose();
    textFieldDiagnosticoTextController?.dispose();

    tfTratamientoFocusNode?.dispose();
    tfTratamientoTextController?.dispose();

    tfNotasFocusNode?.dispose();
    tfNotasTextController?.dispose();
  }
}
