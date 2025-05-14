import '/componentes/side_nav/side_nav_widget.dart';
import '/componentes/tabla_equipo/tabla_equipo_widget.dart';
import '/componentes/tabla_servicios/tabla_servicios_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/onboarding/config_pagos_stripe/config_pagos_stripe_widget.dart';
import '/onboarding/config_zoom/config_zoom_widget.dart';
import '/onboarding/horarios_config/horarios_config_widget.dart';
import 'configuracion_widget.dart' show ConfiguracionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfiguracionModel extends FlutterFlowModel<ConfiguracionWidget> {
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textFieldTextController1;
  String? Function(BuildContext, String?)? textFieldTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController2;
  String? Function(BuildContext, String?)? textFieldTextController2Validator;
  // State field(s) for TextFieldTelefono widget.
  FocusNode? textFieldTelefonoFocusNode;
  TextEditingController? textFieldTelefonoTextController;
  String? Function(BuildContext, String?)?
      textFieldTelefonoTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  Color? colorPicked;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textFieldTextController7;
  String? Function(BuildContext, String?)? textFieldTextController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textFieldTextController8;
  String? Function(BuildContext, String?)? textFieldTextController8Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue1;
  FormFieldController<String>? inicioLunesValueController1;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue2;
  FormFieldController<String>? inicioLunesValueController2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue3;
  FormFieldController<String>? inicioLunesValueController3;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue4;
  FormFieldController<String>? inicioLunesValueController4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue5;
  FormFieldController<String>? inicioLunesValueController5;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue6;
  FormFieldController<String>? inicioLunesValueController6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue7;
  FormFieldController<String>? inicioLunesValueController7;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue8;
  FormFieldController<String>? inicioLunesValueController8;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue9;
  FormFieldController<String>? inicioLunesValueController9;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue10;
  FormFieldController<String>? inicioLunesValueController10;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue11;
  FormFieldController<String>? inicioLunesValueController11;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue12;
  FormFieldController<String>? inicioLunesValueController12;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue13;
  FormFieldController<String>? inicioLunesValueController13;
  // State field(s) for inicioLunes widget.
  String? inicioLunesValue14;
  FormFieldController<String>? inicioLunesValueController14;
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
    sideNavModel1 = createModel(context, () => SideNavModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
    horariosConfigModel = createModel(context, () => HorariosConfigModel());
    tablaServiciosModel = createModel(context, () => TablaServiciosModel());
    configPagosStripeModel =
        createModel(context, () => ConfigPagosStripeModel());
    configZoomModel = createModel(context, () => ConfigZoomModel());
    tablaEquipoModel = createModel(context, () => TablaEquipoModel());
  }

  @override
  void dispose() {
    sideNavModel1.dispose();
    sideNavModel2.dispose();
    textFieldFocusNode1?.dispose();
    textFieldTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController2?.dispose();

    textFieldTelefonoFocusNode?.dispose();
    textFieldTelefonoTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textFieldTextController3?.dispose();

    textFieldFocusNode4?.dispose();
    textFieldTextController4?.dispose();

    textFieldFocusNode5?.dispose();
    textFieldTextController5?.dispose();

    textFieldFocusNode6?.dispose();
    textFieldTextController6?.dispose();

    textFieldFocusNode7?.dispose();
    textFieldTextController7?.dispose();

    textFieldFocusNode8?.dispose();
    textFieldTextController8?.dispose();

    horariosConfigModel.dispose();
    tablaServiciosModel.dispose();
    configPagosStripeModel.dispose();
    configZoomModel.dispose();
    tablaEquipoModel.dispose();
  }
}
