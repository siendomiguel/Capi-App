import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_perfi_equipo_widget.dart' show EditarPerfiEquipoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarPerfiEquipoModel extends FlutterFlowModel<EditarPerfiEquipoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tf_memberName widget.
  FocusNode? tfMemberNameFocusNode;
  TextEditingController? tfMemberNameTextController;
  String? Function(BuildContext, String?)? tfMemberNameTextControllerValidator;
  // State field(s) for tf_firstlastname widget.
  FocusNode? tfFirstlastnameFocusNode;
  TextEditingController? tfFirstlastnameTextController;
  String? Function(BuildContext, String?)?
      tfFirstlastnameTextControllerValidator;
  // State field(s) for tf_secondLastname widget.
  FocusNode? tfSecondLastnameFocusNode;
  TextEditingController? tfSecondLastnameTextController;
  String? Function(BuildContext, String?)?
      tfSecondLastnameTextControllerValidator;
  // State field(s) for DEMOCUMPLE widget.
  FocusNode? democumpleFocusNode;
  TextEditingController? democumpleTextController;
  final democumpleMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? democumpleTextControllerValidator;
  // State field(s) for rb_memberGenero widget.
  FormFieldController<String>? rbMemberGeneroValueController;
  // State field(s) for dd_memberRol widget.
  String? ddMemberRolValue;
  FormFieldController<String>? ddMemberRolValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for tf_shortDescMember widget.
  FocusNode? tfShortDescMemberFocusNode;
  TextEditingController? tfShortDescMemberTextController;
  String? Function(BuildContext, String?)?
      tfShortDescMemberTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for cedulas widget.
  FocusNode? cedulasFocusNode;
  TextEditingController? cedulasTextController;
  String? Function(BuildContext, String?)? cedulasTextControllerValidator;
  // State field(s) for certificaciones widget.
  FocusNode? certificacionesFocusNode;
  TextEditingController? certificacionesTextController;
  String? Function(BuildContext, String?)?
      certificacionesTextControllerValidator;
  // State field(s) for tf_longDescMember widget.
  FocusNode? tfLongDescMemberFocusNode;
  TextEditingController? tfLongDescMemberTextController;
  String? Function(BuildContext, String?)?
      tfLongDescMemberTextControllerValidator;
  // State field(s) for tf_memberEmail widget.
  FocusNode? tfMemberEmailFocusNode;
  TextEditingController? tfMemberEmailTextController;
  String? Function(BuildContext, String?)? tfMemberEmailTextControllerValidator;
  // State field(s) for tf_memberCel widget.
  FocusNode? tfMemberCelFocusNode;
  TextEditingController? tfMemberCelTextController;
  String? Function(BuildContext, String?)? tfMemberCelTextControllerValidator;
  // State field(s) for tf_memberConvencional widget.
  FocusNode? tfMemberConvencionalFocusNode;
  TextEditingController? tfMemberConvencionalTextController;
  String? Function(BuildContext, String?)?
      tfMemberConvencionalTextControllerValidator;
  // State field(s) for tf_memberDir widget.
  FocusNode? tfMemberDirFocusNode;
  TextEditingController? tfMemberDirTextController;
  String? Function(BuildContext, String?)? tfMemberDirTextControllerValidator;
  // State field(s) for tf_memberDir2 widget.
  FocusNode? tfMemberDir2FocusNode;
  TextEditingController? tfMemberDir2TextController;
  String? Function(BuildContext, String?)? tfMemberDir2TextControllerValidator;
  // State field(s) for tf_memberCity widget.
  FocusNode? tfMemberCityFocusNode;
  TextEditingController? tfMemberCityTextController;
  String? Function(BuildContext, String?)? tfMemberCityTextControllerValidator;
  // State field(s) for tf_memberEstado widget.
  FocusNode? tfMemberEstadoFocusNode;
  TextEditingController? tfMemberEstadoTextController;
  String? Function(BuildContext, String?)?
      tfMemberEstadoTextControllerValidator;
  // State field(s) for tf_memberPais widget.
  FocusNode? tfMemberPaisFocusNode;
  TextEditingController? tfMemberPaisTextController;
  String? Function(BuildContext, String?)? tfMemberPaisTextControllerValidator;
  // State field(s) for tf_memberZip widget.
  FocusNode? tfMemberZipFocusNode;
  TextEditingController? tfMemberZipTextController;
  String? Function(BuildContext, String?)? tfMemberZipTextControllerValidator;
  // State field(s) for dd_memberHome widget.
  String? ddMemberHomeValue;
  FormFieldController<String>? ddMemberHomeValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfMemberNameFocusNode?.dispose();
    tfMemberNameTextController?.dispose();

    tfFirstlastnameFocusNode?.dispose();
    tfFirstlastnameTextController?.dispose();

    tfSecondLastnameFocusNode?.dispose();
    tfSecondLastnameTextController?.dispose();

    democumpleFocusNode?.dispose();
    democumpleTextController?.dispose();

    tfShortDescMemberFocusNode?.dispose();
    tfShortDescMemberTextController?.dispose();

    cedulasFocusNode?.dispose();
    cedulasTextController?.dispose();

    certificacionesFocusNode?.dispose();
    certificacionesTextController?.dispose();

    tfLongDescMemberFocusNode?.dispose();
    tfLongDescMemberTextController?.dispose();

    tfMemberEmailFocusNode?.dispose();
    tfMemberEmailTextController?.dispose();

    tfMemberCelFocusNode?.dispose();
    tfMemberCelTextController?.dispose();

    tfMemberConvencionalFocusNode?.dispose();
    tfMemberConvencionalTextController?.dispose();

    tfMemberDirFocusNode?.dispose();
    tfMemberDirTextController?.dispose();

    tfMemberDir2FocusNode?.dispose();
    tfMemberDir2TextController?.dispose();

    tfMemberCityFocusNode?.dispose();
    tfMemberCityTextController?.dispose();

    tfMemberEstadoFocusNode?.dispose();
    tfMemberEstadoTextController?.dispose();

    tfMemberPaisFocusNode?.dispose();
    tfMemberPaisTextController?.dispose();

    tfMemberZipFocusNode?.dispose();
    tfMemberZipTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rbMemberGeneroValue => rbMemberGeneroValueController?.value;
}
