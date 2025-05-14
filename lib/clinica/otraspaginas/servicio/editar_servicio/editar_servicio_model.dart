import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_servicio_widget.dart' show EditarServicioWidget;
import 'package:flutter/material.dart';

class EditarServicioModel extends FlutterFlowModel<EditarServicioWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tf_nombreServicio widget.
  FocusNode? tfNombreServicioFocusNode;
  TextEditingController? tfNombreServicioTextController;
  String? Function(BuildContext, String?)?
      tfNombreServicioTextControllerValidator;
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
  // State field(s) for tf_duration widget.
  FocusNode? tfDurationFocusNode;
  TextEditingController? tfDurationTextController;
  String? Function(BuildContext, String?)? tfDurationTextControllerValidator;
  // State field(s) for rb_disponible widget.
  FormFieldController<String>? rbDisponibleValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

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
