import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/paciente/side_nav_paciente/side_nav_paciente_widget.dart';
import '/index.dart';
import 'buscadordoctores_widget.dart' show BuscadordoctoresWidget;
import 'package:flutter/material.dart';

class BuscadordoctoresModel extends FlutterFlowModel<BuscadordoctoresWidget> {
  ///  Local state fields for this page.

  bool buscarMobile = false;

  bool buscarDesktop = false;

  ///  State fields for stateful widgets in this page.

  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel1;
  // Model for sideNavPaciente component.
  late SideNavPacienteModel sideNavPacienteModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for ubicacion widget.
  String? ubicacionValue1;
  FormFieldController<String>? ubicacionValueController1;
  // State field(s) for especialidad widget.
  String? especialidadValue1;
  FormFieldController<String>? especialidadValueController1;
  // State field(s) for servicioFirt widget.
  String? servicioFirtValue1;
  FormFieldController<String>? servicioFirtValueController1;
  // Stores action output result for [Custom Action - busquedaPorServicioEspecialidadRoleYCiudad] action in Button widget.
  List<UsersRecord>? querybusquedaweb;
  // State field(s) for ubicacion widget.
  String? ubicacionValue2;
  FormFieldController<String>? ubicacionValueController2;
  // State field(s) for ubicacion widget.
  String? ubicacionValue3;
  FormFieldController<String>? ubicacionValueController3;
  // State field(s) for especialidad widget.
  String? especialidadValue2;
  FormFieldController<String>? especialidadValueController2;
  // State field(s) for servicioFirt widget.
  String? servicioFirtValue2;
  FormFieldController<String>? servicioFirtValueController2;
  // Stores action output result for [Custom Action - busquedaPorServicioEspecialidadRoleYCiudad] action in Button widget.
  List<UsersRecord>? querybusquedatest;

  @override
  void initState(BuildContext context) {
    sideNavPacienteModel1 = createModel(context, () => SideNavPacienteModel());
    sideNavPacienteModel2 = createModel(context, () => SideNavPacienteModel());
  }

  @override
  void dispose() {
    sideNavPacienteModel1.dispose();
    sideNavPacienteModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
