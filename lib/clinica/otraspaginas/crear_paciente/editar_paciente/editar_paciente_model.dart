import '/componentes/tablaalergias/tablaalergias_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_paciente_widget.dart' show EditarPacienteWidget;
import 'package:flutter/material.dart';

class EditarPacienteModel extends FlutterFlowModel<EditarPacienteWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  DateTime? datePicked;
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
  // State field(s) for tf_ICM widget.
  FocusNode? tfICMFocusNode;
  TextEditingController? tfICMTextController;
  String? Function(BuildContext, String?)? tfICMTextControllerValidator;
  // State field(s) for rb_genero widget.
  FormFieldController<String>? rbGeneroValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textFieldTextController7;
  String? Function(BuildContext, String?)? textFieldTextController7Validator;
  // State field(s) for dd_EstadoCivil widget.
  String? ddEstadoCivilValue;
  FormFieldController<String>? ddEstadoCivilValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textFieldTextController8;
  String? Function(BuildContext, String?)? textFieldTextController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textFieldTextController9;
  String? Function(BuildContext, String?)? textFieldTextController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textFieldTextController10;
  String? Function(BuildContext, String?)? textFieldTextController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textFieldTextController11;
  String? Function(BuildContext, String?)? textFieldTextController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  String? _textFieldEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido!';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un email valido';
    }
    return null;
  }

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textFieldTextController12;
  String? Function(BuildContext, String?)? textFieldTextController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textFieldTextController13;
  String? Function(BuildContext, String?)? textFieldTextController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textFieldTextController14;
  String? Function(BuildContext, String?)? textFieldTextController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textFieldTextController15;
  String? Function(BuildContext, String?)? textFieldTextController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode17;
  TextEditingController? textFieldTextController16;
  String? Function(BuildContext, String?)? textFieldTextController16Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode18;
  TextEditingController? textFieldTextController17;
  String? Function(BuildContext, String?)? textFieldTextController17Validator;
  // State field(s) for dd_tipoVivienda widget.
  String? ddTipoViviendaValue;
  FormFieldController<String>? ddTipoViviendaValueController;
  // Model for tablaalergias component.
  late TablaalergiasModel tablaalergiasModel;
  // State field(s) for rb_seguro widget.
  FormFieldController<String>? rbSeguroValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode19;
  TextEditingController? textFieldTextController18;
  String? Function(BuildContext, String?)? textFieldTextController18Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode20;
  TextEditingController? textFieldTextController19;
  String? Function(BuildContext, String?)? textFieldTextController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode21;
  TextEditingController? textFieldTextController20;
  String? Function(BuildContext, String?)? textFieldTextController20Validator;
  // State field(s) for dd_TipoSangre widget.
  String? ddTipoSangreValue;
  FormFieldController<String>? ddTipoSangreValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    textFieldEmailTextControllerValidator =
        _textFieldEmailTextControllerValidator;
    tablaalergiasModel = createModel(context, () => TablaalergiasModel());
  }

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

    textFieldFocusNode5?.dispose();
    textFieldTextController5?.dispose();

    textFieldFocusNode6?.dispose();
    textFieldTextController6?.dispose();

    tfICMFocusNode?.dispose();
    tfICMTextController?.dispose();

    textFieldFocusNode7?.dispose();
    textFieldTextController7?.dispose();

    textFieldFocusNode8?.dispose();
    textFieldTextController8?.dispose();

    textFieldFocusNode9?.dispose();
    textFieldTextController9?.dispose();

    textFieldFocusNode10?.dispose();
    textFieldTextController10?.dispose();

    textFieldFocusNode11?.dispose();
    textFieldTextController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController13?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldTelefonoFocusNode1?.dispose();
    textFieldTelefonoTextController1?.dispose();

    textFieldTelefonoFocusNode2?.dispose();
    textFieldTelefonoTextController2?.dispose();

    textFieldFocusNode13?.dispose();
    textFieldTextController12?.dispose();

    textFieldFocusNode14?.dispose();
    textFieldTextController13?.dispose();

    textFieldFocusNode15?.dispose();
    textFieldTextController14?.dispose();

    textFieldFocusNode16?.dispose();
    textFieldTextController15?.dispose();

    textFieldFocusNode17?.dispose();
    textFieldTextController16?.dispose();

    textFieldFocusNode18?.dispose();
    textFieldTextController17?.dispose();

    tablaalergiasModel.dispose();
    textFieldFocusNode19?.dispose();
    textFieldTextController18?.dispose();

    textFieldFocusNode20?.dispose();
    textFieldTextController19?.dispose();

    textFieldFocusNode21?.dispose();
    textFieldTextController20?.dispose();
  }

  /// Additional helper methods.
  String? get rbGeneroValue => rbGeneroValueController?.value;
  String? get rbSeguroValue => rbSeguroValueController?.value;
}
