import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_archivo_widget.dart' show EditarArchivoWidget;
import 'package:flutter/material.dart';

class EditarArchivoModel extends FlutterFlowModel<EditarArchivoWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    observacionFocusNode?.dispose();
    observacionTextController?.dispose();
  }
}
