import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_servicio_widget.dart' show CrearServicioWidget;
import 'package:flutter/material.dart';

class CrearServicioModel extends FlutterFlowModel<CrearServicioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tf_nombreServicio widget.
  FocusNode? tfNombreServicioFocusNode;
  TextEditingController? tfNombreServicioTextController;
  String? Function(BuildContext, String?)?
      tfNombreServicioTextControllerValidator;
  String? _tfNombreServicioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido..!';
    }

    return null;
  }

  // State field(s) for tf_shortDesc widget.
  FocusNode? tfShortDescFocusNode;
  TextEditingController? tfShortDescTextController;
  String? Function(BuildContext, String?)? tfShortDescTextControllerValidator;
  // State field(s) for tf_longDesc widget.
  FocusNode? tfLongDescFocusNode;
  TextEditingController? tfLongDescTextController;
  String? Function(BuildContext, String?)? tfLongDescTextControllerValidator;
  // State field(s) for tf_price widget.
  FocusNode? tfPriceFocusNode;
  TextEditingController? tfPriceTextController;
  String? Function(BuildContext, String?)? tfPriceTextControllerValidator;
  String? _tfPriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido..!';
    }

    return null;
  }

  // State field(s) for tf_duration widget.
  FocusNode? tfDurationFocusNode;
  TextEditingController? tfDurationTextController;
  String? Function(BuildContext, String?)? tfDurationTextControllerValidator;
  String? _tfDurationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido..!';
    }

    return null;
  }

  // State field(s) for rb_disponible widget.
  FormFieldController<String>? rbDisponibleValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in btn_saveService widget.
  ServiciosRecord? creteNewService;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - Create Document] action in btnSavenNewService widget.
  ServiciosRecord? creteNewServiceCopy;

  @override
  void initState(BuildContext context) {
    tfNombreServicioTextControllerValidator =
        _tfNombreServicioTextControllerValidator;
    tfPriceTextControllerValidator = _tfPriceTextControllerValidator;
    tfDurationTextControllerValidator = _tfDurationTextControllerValidator;
  }

  @override
  void dispose() {
    tfNombreServicioFocusNode?.dispose();
    tfNombreServicioTextController?.dispose();

    tfShortDescFocusNode?.dispose();
    tfShortDescTextController?.dispose();

    tfLongDescFocusNode?.dispose();
    tfLongDescTextController?.dispose();

    tfPriceFocusNode?.dispose();
    tfPriceTextController?.dispose();

    tfDurationFocusNode?.dispose();
    tfDurationTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rbDisponibleValue => rbDisponibleValueController?.value;
}
