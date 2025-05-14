import '/backend/backend.dart';
import '/componentes/sin_horarios/sin_horarios_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_cita_original_widget.dart' show NuevaCitaOriginalWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NuevaCitaOriginalModel extends FlutterFlowModel<NuevaCitaOriginalWidget> {
  ///  Local state fields for this component.

  DocumentReference? refPaciente;

  DocumentReference? refService;

  DocumentReference? refDoctor;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in nuevaCitaOriginal widget.
  List<CitasRecord>? citasquery;
  // State field(s) for rd_tipoCita widget.
  FormFieldController<String>? rdTipoCitaValueController;
  // State field(s) for dd_paciente widget.
  String? ddPacienteValue;
  FormFieldController<String>? ddPacienteValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_paciente widget.
  UsersRecord? proID;
  // State field(s) for dd_servicio widget.
  String? ddServicioValue;
  FormFieldController<String>? ddServicioValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_servicio widget.
  ServiciosRecord? serviceID;
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
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<CitasRecord>? demoCalendar;
  // State field(s) for Observacion widget.
  FocusNode? observacionFocusNode;
  TextEditingController? observacionTextController;
  String? Function(BuildContext, String?)? observacionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CitasRecord? crearCita;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? newNotification;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? pacienteDatosParametro;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? pacienteDatosState;

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
  String? get rdTipoCitaValue => rdTipoCitaValueController?.value;
}
