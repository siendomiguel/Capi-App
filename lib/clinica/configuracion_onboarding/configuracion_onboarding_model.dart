import '/backend/backend.dart';
import '/componentes/tabla_equipo/tabla_equipo_widget.dart';
import '/componentes/tabla_servicios/tabla_servicios_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/onboarding/config_pagos_stripe/config_pagos_stripe_widget.dart';
import '/onboarding/config_zoom/config_zoom_widget.dart';
import '/onboarding/horarios_config/horarios_config_widget.dart';
import 'configuracion_onboarding_widget.dart'
    show ConfiguracionOnboardingWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ConfiguracionOnboardingModel
    extends FlutterFlowModel<ConfiguracionOnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChipsMenu widget.
  FormFieldController<List<String>>? choiceChipsMenuValueController;
  String? get choiceChipsMenuValue =>
      choiceChipsMenuValueController?.value?.firstOrNull;
  set choiceChipsMenuValue(String? val) =>
      choiceChipsMenuValueController?.value = val != null ? [val] : [];
  // State field(s) for Clinica widget.
  FocusNode? clinicaFocusNode;
  TextEditingController? clinicaTextController;
  String? Function(BuildContext, String?)? clinicaTextControllerValidator;
  String? _clinicaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre de clínica es requerido';
    }

    return null;
  }

  // State field(s) for Correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Correo electrónico es requerido';
    }

    return null;
  }

  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Número de teléfono es requerido';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  Color? colorPicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textFieldTextController1;
  String? Function(BuildContext, String?)? textFieldTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController2;
  String? Function(BuildContext, String?)? textFieldTextController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textFieldTextController3;
  String? Function(BuildContext, String?)? textFieldTextController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textFieldTextController4;
  String? Function(BuildContext, String?)? textFieldTextController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textFieldTextController5;
  String? Function(BuildContext, String?)? textFieldTextController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textFieldTextController6;
  String? Function(BuildContext, String?)? textFieldTextController6Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClinicaRecord? crearClinica;
  // Model for HorariosConfig component.
  late HorariosConfigModel horariosConfigModel;
  // Model for tablaServicios component.
  late TablaServiciosModel tablaServiciosModel;
  // Model for ConfigPagosStripe component.
  late ConfigPagosStripeModel configPagosStripeModel;
  // Model for configZoom component.
  late ConfigZoomModel configZoomModel;
  // Model for tablaEquipo component.
  late TablaEquipoModel tablaEquipoModel;

  @override
  void initState(BuildContext context) {
    clinicaTextControllerValidator = _clinicaTextControllerValidator;
    correoTextControllerValidator = _correoTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
    horariosConfigModel = createModel(context, () => HorariosConfigModel());
    tablaServiciosModel = createModel(context, () => TablaServiciosModel());
    configPagosStripeModel =
        createModel(context, () => ConfigPagosStripeModel());
    configZoomModel = createModel(context, () => ConfigZoomModel());
    tablaEquipoModel = createModel(context, () => TablaEquipoModel());
  }

  @override
  void dispose() {
    clinicaFocusNode?.dispose();
    clinicaTextController?.dispose();

    correoFocusNode?.dispose();
    correoTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textFieldTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController2?.dispose();

    textFieldFocusNode3?.dispose();
    textFieldTextController3?.dispose();

    textFieldFocusNode4?.dispose();
    textFieldTextController4?.dispose();

    textFieldFocusNode5?.dispose();
    textFieldTextController5?.dispose();

    textFieldFocusNode6?.dispose();
    textFieldTextController6?.dispose();

    horariosConfigModel.dispose();
    tablaServiciosModel.dispose();
    configPagosStripeModel.dispose();
    configZoomModel.dispose();
    tablaEquipoModel.dispose();
  }
}
