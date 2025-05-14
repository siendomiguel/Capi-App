import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_perfil_equipo_widget.dart' show CrearPerfilEquipoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CrearPerfilEquipoModel extends FlutterFlowModel<CrearPerfilEquipoWidget> {
  ///  Local state fields for this page.

  bool verInfoOpcional = false;

  List<DocumentReference> listEspecialidad = [];
  void addToListEspecialidad(DocumentReference item) =>
      listEspecialidad.add(item);
  void removeFromListEspecialidad(DocumentReference item) =>
      listEspecialidad.remove(item);
  void removeAtIndexFromListEspecialidad(int index) =>
      listEspecialidad.removeAt(index);
  void insertAtIndexInListEspecialidad(int index, DocumentReference item) =>
      listEspecialidad.insert(index, item);
  void updateListEspecialidadAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listEspecialidad[index] = updateFn(listEspecialidad[index]);

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tf_nombre widget.
  FocusNode? tfNombreFocusNode;
  TextEditingController? tfNombreTextController;
  String? Function(BuildContext, String?)? tfNombreTextControllerValidator;
  String? _tfNombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
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
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for tf_apelMaterno widget.
  FocusNode? tfApelMaternoFocusNode;
  TextEditingController? tfApelMaternoTextController;
  String? Function(BuildContext, String?)? tfApelMaternoTextControllerValidator;
  // State field(s) for DEMOCUMPLE widget.
  FocusNode? democumpleFocusNode;
  TextEditingController? democumpleTextController;
  final democumpleMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? democumpleTextControllerValidator;
  // State field(s) for rb_sexo widget.
  FormFieldController<String>? rbSexoValueController;
  // State field(s) for dd_rol widget.
  String? ddRolValue;
  FormFieldController<String>? ddRolValueController;
  // State field(s) for tf_descripcion widget.
  FocusNode? tfDescripcionFocusNode;
  TextEditingController? tfDescripcionTextController;
  String? Function(BuildContext, String?)? tfDescripcionTextControllerValidator;
  // State field(s) for Especialidad widget.
  List<String>? especialidadValue;
  FormFieldController<List<String>>? especialidadValueController;
  // State field(s) for Servicio widget.
  List<String>? servicioValue;
  FormFieldController<List<String>>? servicioValueController;
  // State field(s) for cedulas widget.
  FocusNode? cedulasFocusNode;
  TextEditingController? cedulasTextController;
  String? Function(BuildContext, String?)? cedulasTextControllerValidator;
  // State field(s) for certificaciones widget.
  FocusNode? certificacionesFocusNode;
  TextEditingController? certificacionesTextController;
  String? Function(BuildContext, String?)?
      certificacionesTextControllerValidator;
  // State field(s) for tf_Email widget.
  FocusNode? tfEmailFocusNode;
  TextEditingController? tfEmailTextController;
  String? Function(BuildContext, String?)? tfEmailTextControllerValidator;
  String? _tfEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresa un Email valido';
    }
    return null;
  }

  // State field(s) for tf_celular widget.
  FocusNode? tfCelularFocusNode;
  TextEditingController? tfCelularTextController;
  String? Function(BuildContext, String?)? tfCelularTextControllerValidator;
  // State field(s) for tf_convencional widget.
  FocusNode? tfConvencionalFocusNode;
  TextEditingController? tfConvencionalTextController;
  String? Function(BuildContext, String?)?
      tfConvencionalTextControllerValidator;
  // State field(s) for tf_CallePrincipal widget.
  FocusNode? tfCallePrincipalFocusNode;
  TextEditingController? tfCallePrincipalTextController;
  String? Function(BuildContext, String?)?
      tfCallePrincipalTextControllerValidator;
  // State field(s) for tf_CalleSecundaria widget.
  FocusNode? tfCalleSecundariaFocusNode;
  TextEditingController? tfCalleSecundariaTextController;
  String? Function(BuildContext, String?)?
      tfCalleSecundariaTextControllerValidator;
  // State field(s) for tf_ciudad widget.
  FocusNode? tfCiudadFocusNode;
  TextEditingController? tfCiudadTextController;
  String? Function(BuildContext, String?)? tfCiudadTextControllerValidator;
  // State field(s) for tf_estado widget.
  FocusNode? tfEstadoFocusNode;
  TextEditingController? tfEstadoTextController;
  String? Function(BuildContext, String?)? tfEstadoTextControllerValidator;
  // State field(s) for tf_pais widget.
  FocusNode? tfPaisFocusNode;
  TextEditingController? tfPaisTextController;
  String? Function(BuildContext, String?)? tfPaisTextControllerValidator;
  // State field(s) for tf_ZIP widget.
  FocusNode? tfZIPFocusNode;
  TextEditingController? tfZIPTextController;
  String? Function(BuildContext, String?)? tfZIPTextControllerValidator;
  // State field(s) for dd_TipoVivienda widget.
  String? ddTipoViviendaValue;
  FormFieldController<String>? ddTipoViviendaValueController;
  // Stores action output result for [Backend Call - Read Document] action in btn_Save widget.
  ClinicaRecord? limiteClinica;
  // Stores action output result for [Custom Action - manageUser3] action in btn_Save widget.
  String? createMember;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in btn_Save widget.
  UsersRecord? readMember;
  // Stores action output result for [Backend Call - API (Nuevo Paciente)] action in btn_Save widget.
  ApiCallResponse? sendEmailDoctor;

  @override
  void initState(BuildContext context) {
    tfNombreTextControllerValidator = _tfNombreTextControllerValidator;
    tfApelPaternoTextControllerValidator =
        _tfApelPaternoTextControllerValidator;
    tfEmailTextControllerValidator = _tfEmailTextControllerValidator;
  }

  @override
  void dispose() {
    tfNombreFocusNode?.dispose();
    tfNombreTextController?.dispose();

    tfApelPaternoFocusNode?.dispose();
    tfApelPaternoTextController?.dispose();

    tfApelMaternoFocusNode?.dispose();
    tfApelMaternoTextController?.dispose();

    democumpleFocusNode?.dispose();
    democumpleTextController?.dispose();

    tfDescripcionFocusNode?.dispose();
    tfDescripcionTextController?.dispose();

    cedulasFocusNode?.dispose();
    cedulasTextController?.dispose();

    certificacionesFocusNode?.dispose();
    certificacionesTextController?.dispose();

    tfEmailFocusNode?.dispose();
    tfEmailTextController?.dispose();

    tfCelularFocusNode?.dispose();
    tfCelularTextController?.dispose();

    tfConvencionalFocusNode?.dispose();
    tfConvencionalTextController?.dispose();

    tfCallePrincipalFocusNode?.dispose();
    tfCallePrincipalTextController?.dispose();

    tfCalleSecundariaFocusNode?.dispose();
    tfCalleSecundariaTextController?.dispose();

    tfCiudadFocusNode?.dispose();
    tfCiudadTextController?.dispose();

    tfEstadoFocusNode?.dispose();
    tfEstadoTextController?.dispose();

    tfPaisFocusNode?.dispose();
    tfPaisTextController?.dispose();

    tfZIPFocusNode?.dispose();
    tfZIPTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rbSexoValue => rbSexoValueController?.value;
}
