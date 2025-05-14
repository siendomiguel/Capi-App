import '/backend/backend.dart';
import '/componentes/tabla_exp_fisica/tabla_exp_fisica_widget.dart';
import '/componentes/tabla_signos_vitales/tabla_signos_vitales_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalles_consulta_widget.dart' show DetallesConsultaWidget;
import 'package:flutter/material.dart';

class DetallesConsultaModel extends FlutterFlowModel<DetallesConsultaWidget> {
  ///  Local state fields for this page.

  List<String> tratamiento = [];
  void addToTratamiento(String item) => tratamiento.add(item);
  void removeFromTratamiento(String item) => tratamiento.remove(item);
  void removeAtIndexFromTratamiento(int index) => tratamiento.removeAt(index);
  void insertAtIndexInTratamiento(int index, String item) =>
      tratamiento.insert(index, item);
  void updateTratamientoAtIndex(int index, Function(String) updateFn) =>
      tratamiento[index] = updateFn(tratamiento[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in detallesConsulta widget.
  DiagnosticoTratamientoRecord? dataTratamiento;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textFieldTextController1;
  String? Function(BuildContext, String?)? textFieldTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController2;
  String? Function(BuildContext, String?)? textFieldTextController2Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textFieldTextController3;
  String? Function(BuildContext, String?)? textFieldTextController3Validator;
  // State field(s) for tf_tratamiento widget.
  FocusNode? tfTratamientoFocusNode;
  TextEditingController? tfTratamientoTextController;
  String? Function(BuildContext, String?)? tfTratamientoTextControllerValidator;
  // State field(s) for tf_notas widget.
  FocusNode? tfNotasFocusNode;
  TextEditingController? tfNotasTextController;
  String? Function(BuildContext, String?)? tfNotasTextControllerValidator;

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

    textFieldFocusNode3?.dispose();
    textFieldTextController3?.dispose();

    tfTratamientoFocusNode?.dispose();
    tfTratamientoTextController?.dispose();

    tfNotasFocusNode?.dispose();
    tfNotasTextController?.dispose();
  }
}
