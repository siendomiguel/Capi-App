import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'complete_perfilpaciente_widget.dart' show CompletePerfilpacienteWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompletePerfilpacienteModel
    extends FlutterFlowModel<CompletePerfilpacienteWidget> {
  ///  Local state fields for this page.

  bool verInfoOpcional = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldNombre widget.
  FocusNode? textFieldNombreFocusNode;
  TextEditingController? textFieldNombreTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreTextControllerValidator;
  String? _textFieldNombreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre es requerido';
    }

    return null;
  }

  // State field(s) for TextFieldApellidoPaterno widget.
  FocusNode? textFieldApellidoPaternoFocusNode;
  TextEditingController? textFieldApellidoPaternoTextController;
  String? Function(BuildContext, String?)?
      textFieldApellidoPaternoTextControllerValidator;
  String? _textFieldApellidoPaternoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este apellido es requerido';
    }

    return null;
  }

  // State field(s) for TextFieldApellidoMaterno widget.
  FocusNode? textFieldApellidoMaternoFocusNode;
  TextEditingController? textFieldApellidoMaternoTextController;
  String? Function(BuildContext, String?)?
      textFieldApellidoMaternoTextControllerValidator;
  // State field(s) for textfieldFechaNacimiento widget.
  FocusNode? textfieldFechaNacimientoFocusNode;
  TextEditingController? textfieldFechaNacimientoTextController;
  final textfieldFechaNacimientoMask =
      MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      textfieldFechaNacimientoTextControllerValidator;
  String? _textfieldFechaNacimientoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fecha de nacimiento es requerida';
    }

    return null;
  }

  // State field(s) for RadioButtonGenero widget.
  FormFieldController<String>? radioButtonGeneroValueController;
  // State field(s) for TextFieldDescripcion widget.
  FocusNode? textFieldDescripcionFocusNode;
  TextEditingController? textFieldDescripcionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescripcionTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldTelefonoCelular widget.
  FocusNode? textFieldTelefonoCelularFocusNode;
  TextEditingController? textFieldTelefonoCelularTextController;
  String? Function(BuildContext, String?)?
      textFieldTelefonoCelularTextControllerValidator;
  // State field(s) for TextFieldTelefonoConvencional widget.
  FocusNode? textFieldTelefonoConvencionalFocusNode;
  TextEditingController? textFieldTelefonoConvencionalTextController;
  String? Function(BuildContext, String?)?
      textFieldTelefonoConvencionalTextControllerValidator;
  // State field(s) for textfieldPeso widget.
  FocusNode? textfieldPesoFocusNode;
  TextEditingController? textfieldPesoTextController;
  String? Function(BuildContext, String?)? textfieldPesoTextControllerValidator;
  // State field(s) for textfieldAltura widget.
  FocusNode? textfieldAlturaFocusNode;
  TextEditingController? textfieldAlturaTextController;
  String? Function(BuildContext, String?)?
      textfieldAlturaTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    textFieldNombreTextControllerValidator =
        _textFieldNombreTextControllerValidator;
    textFieldApellidoPaternoTextControllerValidator =
        _textFieldApellidoPaternoTextControllerValidator;
    textfieldFechaNacimientoTextControllerValidator =
        _textfieldFechaNacimientoTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNombreFocusNode?.dispose();
    textFieldNombreTextController?.dispose();

    textFieldApellidoPaternoFocusNode?.dispose();
    textFieldApellidoPaternoTextController?.dispose();

    textFieldApellidoMaternoFocusNode?.dispose();
    textFieldApellidoMaternoTextController?.dispose();

    textfieldFechaNacimientoFocusNode?.dispose();
    textfieldFechaNacimientoTextController?.dispose();

    textFieldDescripcionFocusNode?.dispose();
    textFieldDescripcionTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldTelefonoCelularFocusNode?.dispose();
    textFieldTelefonoCelularTextController?.dispose();

    textFieldTelefonoConvencionalFocusNode?.dispose();
    textFieldTelefonoConvencionalTextController?.dispose();

    textfieldPesoFocusNode?.dispose();
    textfieldPesoTextController?.dispose();

    textfieldAlturaFocusNode?.dispose();
    textfieldAlturaTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonGeneroValue => radioButtonGeneroValueController?.value;
}
