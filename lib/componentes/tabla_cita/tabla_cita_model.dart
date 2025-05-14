import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabla_cita_widget.dart' show TablaCitaWidget;
import 'package:flutter/material.dart';

class TablaCitaModel extends FlutterFlowModel<TablaCitaWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  DateTime? selectDay;

  bool searchActive = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CitasRecord> simpleSearchResults = [];
  DateTime? datePicked;
  // Stores action output result for [Custom Action - busquedaPorDiaCitas] action in IconButton widget.
  List<CitasRecord>? searchDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ConsultaRecord? detallesConsulta;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ConsultaRecord? searchConsulta;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ConsultaRecord? searchConsultaDay;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
