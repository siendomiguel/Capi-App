import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "tipoCita" field.
  String? _tipoCita;
  String get tipoCita => _tipoCita ?? '';
  bool hasTipoCita() => _tipoCita != null;

  // "fechaCIta" field.
  DateTime? _fechaCIta;
  DateTime? get fechaCIta => _fechaCIta;
  bool hasFechaCIta() => _fechaCIta != null;

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  bool hasHoraFin() => _horaFin != null;

  // "linkZoom" field.
  String? _linkZoom;
  String get linkZoom => _linkZoom ?? '';
  bool hasLinkZoom() => _linkZoom != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  bool hasClinica() => _clinica != null;

  // "servicio" field.
  DocumentReference? _servicio;
  DocumentReference? get servicio => _servicio;
  bool hasServicio() => _servicio != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "duracion" field.
  int? _duracion;
  int get duracion => _duracion ?? 0;
  bool hasDuracion() => _duracion != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  bool hasObservaciones() => _observaciones != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "resumen" field.
  String? _resumen;
  String get resumen => _resumen ?? '';
  bool hasResumen() => _resumen != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "checkoutSessionId" field.
  String? _checkoutSessionId;
  String get checkoutSessionId => _checkoutSessionId ?? '';
  bool hasCheckoutSessionId() => _checkoutSessionId != null;

  // "nombrePaciente" field.
  String? _nombrePaciente;
  String get nombrePaciente => _nombrePaciente ?? '';
  bool hasNombrePaciente() => _nombrePaciente != null;

  // "doctorAprobado" field.
  bool? _doctorAprobado;
  bool get doctorAprobado => _doctorAprobado ?? false;
  bool hasDoctorAprobado() => _doctorAprobado != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _tipoCita = snapshotData['tipoCita'] as String?;
    _fechaCIta = snapshotData['fechaCIta'] as DateTime?;
    _horaInicio = snapshotData['horaInicio'] as DateTime?;
    _horaFin = snapshotData['horaFin'] as DateTime?;
    _linkZoom = snapshotData['linkZoom'] as String?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _servicio = snapshotData['servicio'] as DocumentReference?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _estado = snapshotData['estado'] as String?;
    _duracion = castToType<int>(snapshotData['duracion']);
    _precio = castToType<double>(snapshotData['precio']);
    _observaciones = snapshotData['observaciones'] as String?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _color = getSchemaColor(snapshotData['color']);
    _resumen = snapshotData['resumen'] as String?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _paymentStatus = snapshotData['paymentStatus'] as String?;
    _checkoutSessionId = snapshotData['checkoutSessionId'] as String?;
    _nombrePaciente = snapshotData['nombrePaciente'] as String?;
    _doctorAprobado = snapshotData['doctorAprobado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitasRecordData({
  String? uid,
  String? tipoCita,
  DateTime? fechaCIta,
  DateTime? horaInicio,
  DateTime? horaFin,
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
  String? resumen,
  DocumentReference? chatRef,
  String? paymentStatus,
  String? checkoutSessionId,
  String? nombrePaciente,
  bool? doctorAprobado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'tipoCita': tipoCita,
      'fechaCIta': fechaCIta,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'linkZoom': linkZoom,
      'clinica': clinica,
      'servicio': servicio,
      'createdDate': createdDate,
      'paciente': paciente,
      'estado': estado,
      'duracion': duracion,
      'precio': precio,
      'observaciones': observaciones,
      'doctor': doctor,
      'color': color,
      'resumen': resumen,
      'chatRef': chatRef,
      'paymentStatus': paymentStatus,
      'checkoutSessionId': checkoutSessionId,
      'nombrePaciente': nombrePaciente,
      'doctorAprobado': doctorAprobado,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitasRecordDocumentEquality implements Equality<CitasRecord> {
  const CitasRecordDocumentEquality();

  @override
  bool equals(CitasRecord? e1, CitasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.tipoCita == e2?.tipoCita &&
        e1?.fechaCIta == e2?.fechaCIta &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin &&
        e1?.linkZoom == e2?.linkZoom &&
        e1?.clinica == e2?.clinica &&
        e1?.servicio == e2?.servicio &&
        e1?.createdDate == e2?.createdDate &&
        e1?.paciente == e2?.paciente &&
        e1?.estado == e2?.estado &&
        e1?.duracion == e2?.duracion &&
        e1?.precio == e2?.precio &&
        e1?.observaciones == e2?.observaciones &&
        e1?.doctor == e2?.doctor &&
        e1?.color == e2?.color &&
        e1?.resumen == e2?.resumen &&
        e1?.chatRef == e2?.chatRef &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.checkoutSessionId == e2?.checkoutSessionId &&
        e1?.nombrePaciente == e2?.nombrePaciente &&
        e1?.doctorAprobado == e2?.doctorAprobado;
  }

  @override
  int hash(CitasRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.tipoCita,
        e?.fechaCIta,
        e?.horaInicio,
        e?.horaFin,
        e?.linkZoom,
        e?.clinica,
        e?.servicio,
        e?.createdDate,
        e?.paciente,
        e?.estado,
        e?.duracion,
        e?.precio,
        e?.observaciones,
        e?.doctor,
        e?.color,
        e?.resumen,
        e?.chatRef,
        e?.paymentStatus,
        e?.checkoutSessionId,
        e?.nombrePaciente,
        e?.doctorAprobado
      ]);

  @override
  bool isValidKey(Object? o) => o is CitasRecord;
}
