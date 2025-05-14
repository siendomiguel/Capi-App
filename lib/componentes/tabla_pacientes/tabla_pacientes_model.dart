import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_pacientes_widget.dart' show TablaPacientesWidget;
import 'package:flutter/material.dart';

class TablaPacientesModel extends FlutterFlowModel<TablaPacientesWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> listaPacientes = [];
  void addToListaPacientes(UsersRecord item) => listaPacientes.add(item);
  void removeFromListaPacientes(UsersRecord item) =>
      listaPacientes.remove(item);
  void removeAtIndexFromListaPacientes(int index) =>
      listaPacientes.removeAt(index);
  void insertAtIndexInListaPacientes(int index, UsersRecord item) =>
      listaPacientes.insert(index, item);
  void updateListaPacientesAtIndex(int index, Function(UsersRecord) updateFn) =>
      listaPacientes[index] = updateFn(listaPacientes[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? limiteClinicaPacientes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<UsersRecord> simpleSearchResults1 = [];
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? limiteClinicaPaciente;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<UsersRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    paginatedDataTableController.dispose();
  }
}
