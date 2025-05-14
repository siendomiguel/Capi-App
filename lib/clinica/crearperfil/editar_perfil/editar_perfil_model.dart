import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:flutter/material.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in editarPerfil widget.
  UsersRecord? queryUser;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for cedulas widget.
  FocusNode? cedulasFocusNode;
  TextEditingController? cedulasTextController;
  String? Function(BuildContext, String?)? cedulasTextControllerValidator;
  // State field(s) for certificaciones widget.
  FocusNode? certificacionesFocusNode;
  TextEditingController? certificacionesTextController;
  String? Function(BuildContext, String?)?
      certificacionesTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textFieldTextController5;
  String? Function(BuildContext, String?)? textFieldTextController5Validator;
  // State field(s) for servicios widget.
  List<String>? serviciosValue;
  FormFieldController<List<String>>? serviciosValueController;
  // State field(s) for especialidad widget.
  List<String>? especialidadValue;
  FormFieldController<List<String>>? especialidadValueController;
  // State field(s) for TextField widget.
  final textFieldKey6 = GlobalKey();
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController8;
  String? textFieldSelectedOption6;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Custom Action - verificarDuplicados] action in Button widget.
  DocumentReference? resultado;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textFieldTextController6;
  String? Function(BuildContext, String?)? textFieldTextController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textFieldTextController7;
  String? Function(BuildContext, String?)? textFieldTextController7Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldTelefono widget.
  FocusNode? textFieldTelefonoFocusNode1;
  TextEditingController? textFieldTelefonoTextController1;
  String? Function(BuildContext, String?)?
      textFieldTelefonoTextController1Validator;
  // State field(s) for TextFieldTelefono widget.
  FocusNode? textFieldTelefonoFocusNode2;
  TextEditingController? textFieldTelefonoTextController2;
  String? Function(BuildContext, String?)?
      textFieldTelefonoTextController2Validator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textFieldTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController2?.dispose();

    textFieldFocusNode3?.dispose();
    textFieldTextController3?.dispose();

    textFieldFocusNode4?.dispose();
    textFieldTextController4?.dispose();

    cedulasFocusNode?.dispose();
    cedulasTextController?.dispose();

    certificacionesFocusNode?.dispose();
    certificacionesTextController?.dispose();

    textFieldFocusNode5?.dispose();
    textFieldTextController5?.dispose();

    textFieldFocusNode6?.dispose();

    textFieldFocusNode7?.dispose();
    textFieldTextController6?.dispose();

    textFieldFocusNode8?.dispose();
    textFieldTextController7?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldTelefonoFocusNode1?.dispose();
    textFieldTelefonoTextController1?.dispose();

    textFieldTelefonoFocusNode2?.dispose();
    textFieldTelefonoTextController2?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
