import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_archivo_widget.dart' show CrearArchivoWidget;
import 'package:flutter/material.dart';

class CrearArchivoModel extends FlutterFlowModel<CrearArchivoWidget> {
  ///  Local state fields for this page.

  List<String> archivosURLlist = [];
  void addToArchivosURLlist(String item) => archivosURLlist.add(item);
  void removeFromArchivosURLlist(String item) => archivosURLlist.remove(item);
  void removeAtIndexFromArchivosURLlist(int index) =>
      archivosURLlist.removeAt(index);
  void insertAtIndexInArchivosURLlist(int index, String item) =>
      archivosURLlist.insert(index, item);
  void updateArchivosURLlistAtIndex(int index, Function(String) updateFn) =>
      archivosURLlist[index] = updateFn(archivosURLlist[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked1;
  // State field(s) for dd_tipoEtudio widget.
  String? ddTipoEtudioValue;
  FormFieldController<String>? ddTipoEtudioValueController;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for dd_Estatus widget.
  String? ddEstatusValue;
  FormFieldController<String>? ddEstatusValueController;
  DateTime? datePicked2;
  // State field(s) for Observacion widget.
  FocusNode? observacionFocusNode;
  TextEditingController? observacionTextController;
  String? Function(BuildContext, String?)? observacionTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EstudiosArchivosRecord? crearArchivos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    observacionFocusNode?.dispose();
    observacionTextController?.dispose();
  }
}
