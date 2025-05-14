import '/backend/backend.dart';
import '/componentes/sin_horarios/sin_horarios_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_cita_widget.dart' show EditarCitaWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class EditarCitaModel extends FlutterFlowModel<EditarCitaWidget> {
  ///  Local state fields for this component.

  DocumentReference? refDoctor;

  DateTime? selectDay;

  DocumentReference? refService;

  UsersRecord? doctorDocument;

  bool delay = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in editarCita widget.
  UsersRecord? userDoctorData;
  // Stores action output result for [Firestore Query - Query a collection] action in editarCita widget.
  List<UsersRecord>? query;
  // Stores action output result for [Firestore Query - Query a collection] action in editarCita widget.
  List<ServiciosRecord>? queryServices;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  ServiciosRecord? service;
  // State field(s) for dd_doctor widget.
  String? ddDoctorValue;
  FormFieldController<String>? ddDoctorValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_doctor widget.
  UsersRecord? docID;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for SinHorarios component.
  late SinHorariosModel sinHorariosModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Observacion widget.
  FocusNode? observacionFocusNode;
  TextEditingController? observacionTextController;
  String? Function(BuildContext, String?)? observacionTextControllerValidator;
  // State field(s) for chk_confirmarCita widget.
  bool? chkConfirmarCitaValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? notifyCancelMeeting;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataDoctor;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataPaciente;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? notifyConfirmMeeting;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CitasRecord? dataCitaUpdate;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    sinHorariosModel = createModel(context, () => SinHorariosModel());
  }

  @override
  void dispose() {
    sinHorariosModel.dispose();
    observacionFocusNode?.dispose();
    observacionTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
