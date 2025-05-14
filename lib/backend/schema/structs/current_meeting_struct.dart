// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentMeetingStruct extends FFFirebaseStruct {
  CurrentMeetingStruct({
    String? uid,
    String? tipoCita,
    DateTime? fechaCIta,
    String? linkZoom,
    DocumentReference? clinica,
    DocumentReference? servicio,
    DateTime? createdDate,
    DocumentReference? paciente,
    String? estado,
    int? duracion,
    double? precio,
    String? observaciones,
    DocumentReference? doctor,
    Color? color,
    String? doctorID,
    DateTime? horaFin,
    String? resumen,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _tipoCita = tipoCita,
        _fechaCIta = fechaCIta,
        _linkZoom = linkZoom,
        _clinica = clinica,
        _servicio = servicio,
        _createdDate = createdDate,
        _paciente = paciente,
        _estado = estado,
        _duracion = duracion,
        _precio = precio,
        _observaciones = observaciones,
        _doctor = doctor,
        _color = color,
        _doctorID = doctorID,
        _horaFin = horaFin,
        _resumen = resumen,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "tipoCita" field.
  String? _tipoCita;
  String get tipoCita => _tipoCita ?? '';
  set tipoCita(String? val) => _tipoCita = val;

  bool hasTipoCita() => _tipoCita != null;

  // "fechaCIta" field.
  DateTime? _fechaCIta;
  DateTime? get fechaCIta => _fechaCIta;
  set fechaCIta(DateTime? val) => _fechaCIta = val;

  bool hasFechaCIta() => _fechaCIta != null;

  // "linkZoom" field.
  String? _linkZoom;
  String get linkZoom => _linkZoom ?? '';
  set linkZoom(String? val) => _linkZoom = val;

  bool hasLinkZoom() => _linkZoom != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  set clinica(DocumentReference? val) => _clinica = val;

  bool hasClinica() => _clinica != null;

  // "servicio" field.
  DocumentReference? _servicio;
  DocumentReference? get servicio => _servicio;
  set servicio(DocumentReference? val) => _servicio = val;

  bool hasServicio() => _servicio != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  set createdDate(DateTime? val) => _createdDate = val;

  bool hasCreatedDate() => _createdDate != null;

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  set paciente(DocumentReference? val) => _paciente = val;

  bool hasPaciente() => _paciente != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "duracion" field.
  int? _duracion;
  int get duracion => _duracion ?? 0;
  set duracion(int? val) => _duracion = val;

  void incrementDuracion(int amount) => duracion = duracion + amount;

  bool hasDuracion() => _duracion != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  set precio(double? val) => _precio = val;

  void incrementPrecio(double amount) => precio = precio + amount;

  bool hasPrecio() => _precio != null;

  // "observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  set observaciones(String? val) => _observaciones = val;

  bool hasObservaciones() => _observaciones != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  set doctor(DocumentReference? val) => _doctor = val;

  bool hasDoctor() => _doctor != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "doctorID" field.
  String? _doctorID;
  String get doctorID => _doctorID ?? '';
  set doctorID(String? val) => _doctorID = val;

  bool hasDoctorID() => _doctorID != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  set horaFin(DateTime? val) => _horaFin = val;

  bool hasHoraFin() => _horaFin != null;

  // "resumen" field.
  String? _resumen;
  String get resumen => _resumen ?? '';
  set resumen(String? val) => _resumen = val;

  bool hasResumen() => _resumen != null;

  static CurrentMeetingStruct fromMap(Map<String, dynamic> data) =>
      CurrentMeetingStruct(
        uid: data['uid'] as String?,
        tipoCita: data['tipoCita'] as String?,
        fechaCIta: data['fechaCIta'] as DateTime?,
        linkZoom: data['linkZoom'] as String?,
        clinica: data['clinica'] as DocumentReference?,
        servicio: data['servicio'] as DocumentReference?,
        createdDate: data['createdDate'] as DateTime?,
        paciente: data['paciente'] as DocumentReference?,
        estado: data['estado'] as String?,
        duracion: castToType<int>(data['duracion']),
        precio: castToType<double>(data['precio']),
        observaciones: data['observaciones'] as String?,
        doctor: data['doctor'] as DocumentReference?,
        color: getSchemaColor(data['color']),
        doctorID: data['doctorID'] as String?,
        horaFin: data['horaFin'] as DateTime?,
        resumen: data['resumen'] as String?,
      );

  static CurrentMeetingStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentMeetingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'tipoCita': _tipoCita,
        'fechaCIta': _fechaCIta,
        'linkZoom': _linkZoom,
        'clinica': _clinica,
        'servicio': _servicio,
        'createdDate': _createdDate,
        'paciente': _paciente,
        'estado': _estado,
        'duracion': _duracion,
        'precio': _precio,
        'observaciones': _observaciones,
        'doctor': _doctor,
        'color': _color,
        'doctorID': _doctorID,
        'horaFin': _horaFin,
        'resumen': _resumen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'tipoCita': serializeParam(
          _tipoCita,
          ParamType.String,
        ),
        'fechaCIta': serializeParam(
          _fechaCIta,
          ParamType.DateTime,
        ),
        'linkZoom': serializeParam(
          _linkZoom,
          ParamType.String,
        ),
        'clinica': serializeParam(
          _clinica,
          ParamType.DocumentReference,
        ),
        'servicio': serializeParam(
          _servicio,
          ParamType.DocumentReference,
        ),
        'createdDate': serializeParam(
          _createdDate,
          ParamType.DateTime,
        ),
        'paciente': serializeParam(
          _paciente,
          ParamType.DocumentReference,
        ),
        'estado': serializeParam(
          _estado,
          ParamType.String,
        ),
        'duracion': serializeParam(
          _duracion,
          ParamType.int,
        ),
        'precio': serializeParam(
          _precio,
          ParamType.double,
        ),
        'observaciones': serializeParam(
          _observaciones,
          ParamType.String,
        ),
        'doctor': serializeParam(
          _doctor,
          ParamType.DocumentReference,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'doctorID': serializeParam(
          _doctorID,
          ParamType.String,
        ),
        'horaFin': serializeParam(
          _horaFin,
          ParamType.DateTime,
        ),
        'resumen': serializeParam(
          _resumen,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentMeetingStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentMeetingStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        tipoCita: deserializeParam(
          data['tipoCita'],
          ParamType.String,
          false,
        ),
        fechaCIta: deserializeParam(
          data['fechaCIta'],
          ParamType.DateTime,
          false,
        ),
        linkZoom: deserializeParam(
          data['linkZoom'],
          ParamType.String,
          false,
        ),
        clinica: deserializeParam(
          data['clinica'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clinica'],
        ),
        servicio: deserializeParam(
          data['servicio'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['servicios'],
        ),
        createdDate: deserializeParam(
          data['createdDate'],
          ParamType.DateTime,
          false,
        ),
        paciente: deserializeParam(
          data['paciente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        estado: deserializeParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        duracion: deserializeParam(
          data['duracion'],
          ParamType.int,
          false,
        ),
        precio: deserializeParam(
          data['precio'],
          ParamType.double,
          false,
        ),
        observaciones: deserializeParam(
          data['observaciones'],
          ParamType.String,
          false,
        ),
        doctor: deserializeParam(
          data['doctor'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        doctorID: deserializeParam(
          data['doctorID'],
          ParamType.String,
          false,
        ),
        horaFin: deserializeParam(
          data['horaFin'],
          ParamType.DateTime,
          false,
        ),
        resumen: deserializeParam(
          data['resumen'],
          ParamType.String,
          false,
        ),
      );

  static CurrentMeetingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CurrentMeetingStruct(
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        tipoCita: convertAlgoliaParam(
          data['tipoCita'],
          ParamType.String,
          false,
        ),
        fechaCIta: convertAlgoliaParam(
          data['fechaCIta'],
          ParamType.DateTime,
          false,
        ),
        linkZoom: convertAlgoliaParam(
          data['linkZoom'],
          ParamType.String,
          false,
        ),
        clinica: convertAlgoliaParam(
          data['clinica'],
          ParamType.DocumentReference,
          false,
        ),
        servicio: convertAlgoliaParam(
          data['servicio'],
          ParamType.DocumentReference,
          false,
        ),
        createdDate: convertAlgoliaParam(
          data['createdDate'],
          ParamType.DateTime,
          false,
        ),
        paciente: convertAlgoliaParam(
          data['paciente'],
          ParamType.DocumentReference,
          false,
        ),
        estado: convertAlgoliaParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        duracion: convertAlgoliaParam(
          data['duracion'],
          ParamType.int,
          false,
        ),
        precio: convertAlgoliaParam(
          data['precio'],
          ParamType.double,
          false,
        ),
        observaciones: convertAlgoliaParam(
          data['observaciones'],
          ParamType.String,
          false,
        ),
        doctor: convertAlgoliaParam(
          data['doctor'],
          ParamType.DocumentReference,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        doctorID: convertAlgoliaParam(
          data['doctorID'],
          ParamType.String,
          false,
        ),
        horaFin: convertAlgoliaParam(
          data['horaFin'],
          ParamType.DateTime,
          false,
        ),
        resumen: convertAlgoliaParam(
          data['resumen'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CurrentMeetingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentMeetingStruct &&
        uid == other.uid &&
        tipoCita == other.tipoCita &&
        fechaCIta == other.fechaCIta &&
        linkZoom == other.linkZoom &&
        clinica == other.clinica &&
        servicio == other.servicio &&
        createdDate == other.createdDate &&
        paciente == other.paciente &&
        estado == other.estado &&
        duracion == other.duracion &&
        precio == other.precio &&
        observaciones == other.observaciones &&
        doctor == other.doctor &&
        color == other.color &&
        doctorID == other.doctorID &&
        horaFin == other.horaFin &&
        resumen == other.resumen;
  }

  @override
  int get hashCode => const ListEquality().hash([
        uid,
        tipoCita,
        fechaCIta,
        linkZoom,
        clinica,
        servicio,
        createdDate,
        paciente,
        estado,
        duracion,
        precio,
        observaciones,
        doctor,
        color,
        doctorID,
        horaFin,
        resumen
      ]);
}

CurrentMeetingStruct createCurrentMeetingStruct({
  String? uid,
  String? tipoCita,
  DateTime? fechaCIta,
  String? linkZoom,
  DocumentReference? clinica,
  DocumentReference? servicio,
  DateTime? createdDate,
  DocumentReference? paciente,
  String? estado,
  int? duracion,
  double? precio,
  String? observaciones,
  DocumentReference? doctor,
  Color? color,
  String? doctorID,
  DateTime? horaFin,
  String? resumen,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentMeetingStruct(
      uid: uid,
      tipoCita: tipoCita,
      fechaCIta: fechaCIta,
      linkZoom: linkZoom,
      clinica: clinica,
      servicio: servicio,
      createdDate: createdDate,
      paciente: paciente,
      estado: estado,
      duracion: duracion,
      precio: precio,
      observaciones: observaciones,
      doctor: doctor,
      color: color,
      doctorID: doctorID,
      horaFin: horaFin,
      resumen: resumen,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentMeetingStruct? updateCurrentMeetingStruct(
  CurrentMeetingStruct? currentMeeting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentMeeting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentMeetingStructData(
  Map<String, dynamic> firestoreData,
  CurrentMeetingStruct? currentMeeting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentMeeting == null) {
    return;
  }
  if (currentMeeting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentMeeting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentMeetingData =
      getCurrentMeetingFirestoreData(currentMeeting, forFieldValue);
  final nestedData =
      currentMeetingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentMeeting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentMeetingFirestoreData(
  CurrentMeetingStruct? currentMeeting, [
  bool forFieldValue = false,
]) {
  if (currentMeeting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentMeeting.toMap());

  // Add any Firestore field values
  currentMeeting.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentMeetingListFirestoreData(
  List<CurrentMeetingStruct>? currentMeetings,
) =>
    currentMeetings
        ?.map((e) => getCurrentMeetingFirestoreData(e, true))
        .toList() ??
    [];
