import '/backend/backend.dart';
import '/componentes/sin_horarios/sin_horarios_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_citapaciente_widget.dart' show NuevaCitapacienteWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NuevaCitapacienteModel extends FlutterFlowModel<NuevaCitapacienteWidget> {
  ///  Local state fields for this component.

  DocumentReference? referenceDoc;

  DocumentReference? refService;

  bool selectDateTime = false;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for rd_tipoCita widget.
  FormFieldController<String>? rdTipoCitaValueController;
  DateTime? datePicked;
  // State field(s) for dd_doctor widget.
  String? ddDoctorValue;
  FormFieldController<String>? ddDoctorValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_doctor widget.
  UsersRecord? docID;
  // State field(s) for dd_Servicio widget.
  String? ddServicioValue;
  FormFieldController<String>? ddServicioValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_Servicio widget.
  ServiciosRecord? servicioId;
  // Stores action output result for [Firestore Query - Query a collection] action in dd_Servicio widget.
  List<CitasRecord>? test;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for SinHorarios component.
  late SinHorariosModel sinHorariosModel;
  // State field(s) for horarioElegido widget.
  FormFieldController<List<String>>? horarioElegidoValueController;
  String? get horarioElegidoValue =>
      horarioElegidoValueController?.value?.firstOrNull;
  set horarioElegidoValue(String? val) =>
      horarioElegidoValueController?.value = val != null ? [val] : [];
  // State field(s) for Observacion widget.
  FocusNode? observacionFocusNode;
  TextEditingController? observacionTextController;
  String? Function(BuildContext, String?)? observacionTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ServiciosRecord? queryServicio;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CitasRecord? crearCitaPaciente;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ClinicaRecord? dataClinica;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificacionesRecord? newMeetingNotify;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? dataPaciente2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? asistenteData;

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
