import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'complete_perfil_profesional_widget.dart'
    show CompletePerfilProfesionalWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompletePerfilProfesionalModel
    extends FlutterFlowModel<CompletePerfilProfesionalWidget> {
  ///  Local state fields for this page.

  bool verInfoOpcional = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tf_nombre widget.
  FocusNode? tfNombreFocusNode;
  TextEditingController? tfNombreTextController;
  String? Function(BuildContext, String?)? tfNombreTextControllerValidator;
  String? _tfNombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for tf_apelPaterno widget.
  FocusNode? tfApelPaternoFocusNode;
  TextEditingController? tfApelPaternoTextController;
  String? Function(BuildContext, String?)? tfApelPaternoTextControllerValidator;
  String? _tfApelPaternoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for tf_apelMaterno widget.
  FocusNode? tfApelMaternoFocusNode;
  TextEditingController? tfApelMaternoTextController;
  String? Function(BuildContext, String?)? tfApelMaternoTextControllerValidator;
  // State field(s) for fechaNacimiento widget.
  FocusNode? fechaNacimientoFocusNode;
  TextEditingController? fechaNacimientoTextController;
  final fechaNacimientoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      fechaNacimientoTextControllerValidator;
  String? _fechaNacimientoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for rb_sexo widget.
  FormFieldController<String>? rbSexoValueController;
  // State field(s) for dd_rol widget.
  String? ddRolValue;
  FormFieldController<String>? ddRolValueController;
  // State field(s) for tf_descripcion widget.
  FocusNode? tfDescripcionFocusNode;
  TextEditingController? tfDescripcionTextController;
  String? Function(BuildContext, String?)? tfDescripcionTextControllerValidator;
  // State field(s) for invitacion widget.
  FocusNode? invitacionFocusNode;
  TextEditingController? invitacionTextController;
  String? Function(BuildContext, String?)? invitacionTextControllerValidator;
  // Stores action output result for [Custom Action - validarInvitacionClinica] action in Button widget.
  ClinicaRecord? validarInvitacion;
  // State field(s) for tf_Email widget.
  FocusNode? tfEmailFocusNode;
  TextEditingController? tfEmailTextController;
  String? Function(BuildContext, String?)? tfEmailTextControllerValidator;
  // State field(s) for tf_celular widget.
  FocusNode? tfCelularFocusNode;
  TextEditingController? tfCelularTextController;
  String? Function(BuildContext, String?)? tfCelularTextControllerValidator;
  // State field(s) for tf_convencional widget.
  FocusNode? tfConvencionalFocusNode;
  TextEditingController? tfConvencionalTextController;
  String? Function(BuildContext, String?)?
      tfConvencionalTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for dd_TipoVivienda widget.
  String? ddTipoViviendaValue;
  FormFieldController<String>? ddTipoViviendaValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usersClinica;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - API (Bienvenido a Capi)] action in Button widget.
  ApiCallResponse? sendWelcomeEmail;

  @override
  void initState(BuildContext context) {
    tfNombreTextControllerValidator = _tfNombreTextControllerValidator;
    tfApelPaternoTextControllerValidator =
        _tfApelPaternoTextControllerValidator;
    fechaNacimientoTextControllerValidator =
        _fechaNacimientoTextControllerValidator;
  }

  @override
  void dispose() {
    tfNombreFocusNode?.dispose();
    tfNombreTextController?.dispose();

    tfApelPaternoFocusNode?.dispose();
    tfApelPaternoTextController?.dispose();

    tfApelMaternoFocusNode?.dispose();
    tfApelMaternoTextController?.dispose();

    fechaNacimientoFocusNode?.dispose();
    fechaNacimientoTextController?.dispose();

    tfDescripcionFocusNode?.dispose();
    tfDescripcionTextController?.dispose();

    invitacionFocusNode?.dispose();
    invitacionTextController?.dispose();

    tfEmailFocusNode?.dispose();
    tfEmailTextController?.dispose();

    tfCelularFocusNode?.dispose();
    tfCelularTextController?.dispose();

    tfConvencionalFocusNode?.dispose();
    tfConvencionalTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rbSexoValue => rbSexoValueController?.value;
}
