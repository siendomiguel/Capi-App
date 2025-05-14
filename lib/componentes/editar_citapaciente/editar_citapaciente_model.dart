import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_citapaciente_widget.dart' show EditarCitapacienteWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class EditarCitapacienteModel
    extends FlutterFlowModel<EditarCitapacienteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for rd_tipoCIta widget.
  FormFieldController<String>? rdTipoCItaValueController;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  ServiciosRecord? servicioID;
  // State field(s) for dd_doctor widget.
  String? ddDoctorValue;
  FormFieldController<String>? ddDoctorValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_doctor widget.
  UsersRecord? docID;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? editMeetingNotify;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    observacionFocusNode?.dispose();
    observacionTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rdTipoCItaValue => rdTipoCItaValueController?.value;
}
