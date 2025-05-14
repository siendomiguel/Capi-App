import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultaRecord extends FirestoreRecord {
  ConsultaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  bool hasClinica() => _clinica != null;

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "fechaConsulta" field.
  DateTime? _fechaConsulta;
  DateTime? get fechaConsulta => _fechaConsulta;
  bool hasFechaConsulta() => _fechaConsulta != null;

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  bool hasHoraFin() => _horaFin != null;

  // "objetivoConsulta" field.
  String? _objetivoConsulta;
  String get objetivoConsulta => _objetivoConsulta ?? '';
  bool hasObjetivoConsulta() => _objetivoConsulta != null;

  // "padecimientoActual" field.
  String? _padecimientoActual;
  String get padecimientoActual => _padecimientoActual ?? '';
  bool hasPadecimientoActual() => _padecimientoActual != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "servicio" field.
  DocumentReference? _servicio;
  DocumentReference? get servicio => _servicio;
  bool hasServicio() => _servicio != null;

  // "cita" field.
  DocumentReference? _cita;
  DocumentReference? get cita => _cita;
  bool hasCita() => _cita != null;

  // "nombre_Paciente" field.
  String? _nombrePaciente;
  String get nombrePaciente => _nombrePaciente ?? '';
  bool hasNombrePaciente() => _nombrePaciente != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _fechaConsulta = snapshotData['fechaConsulta'] as DateTime?;
    _horaInicio = snapshotData['horaInicio'] as DateTime?;
    _horaFin = snapshotData['horaFin'] as DateTime?;
    _objetivoConsulta = snapshotData['objetivoConsulta'] as String?;
    _padecimientoActual = snapshotData['padecimientoActual'] as String?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _servicio = snapshotData['servicio'] as DocumentReference?;
    _cita = snapshotData['cita'] as DocumentReference?;
    _nombrePaciente = snapshotData['nombre_Paciente'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consulta');

  static Stream<ConsultaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsultaRecord.fromSnapshot(s));

  static Future<ConsultaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsultaRecord.fromSnapshot(s));

  static ConsultaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsultaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsultaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsultaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsultaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsultaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsultaRecordData({
  String? uid,
  DateTime? createdDate,
  DocumentReference? clinica,
  DocumentReference? paciente,
  DateTime? fechaConsulta,
  DateTime? horaInicio,
  DateTime? horaFin,
  String? objetivoConsulta,
  String? padecimientoActual,
  DocumentReference? doctor,
  DocumentReference? servicio,
  DocumentReference? cita,
  String? nombrePaciente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'createdDate': createdDate,
      'clinica': clinica,
      'paciente': paciente,
      'fechaConsulta': fechaConsulta,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'objetivoConsulta': objetivoConsulta,
      'padecimientoActual': padecimientoActual,
      'doctor': doctor,
      'servicio': servicio,
      'cita': cita,
      'nombre_Paciente': nombrePaciente,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsultaRecordDocumentEquality implements Equality<ConsultaRecord> {
  const ConsultaRecordDocumentEquality();

  @override
  bool equals(ConsultaRecord? e1, ConsultaRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.clinica == e2?.clinica &&
        e1?.paciente == e2?.paciente &&
        e1?.fechaConsulta == e2?.fechaConsulta &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin &&
        e1?.objetivoConsulta == e2?.objetivoConsulta &&
        e1?.padecimientoActual == e2?.padecimientoActual &&
        e1?.doctor == e2?.doctor &&
        e1?.servicio == e2?.servicio &&
        e1?.cita == e2?.cita &&
        e1?.nombrePaciente == e2?.nombrePaciente;
  }

  @override
  int hash(ConsultaRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdDate,
        e?.clinica,
        e?.paciente,
        e?.fechaConsulta,
        e?.horaInicio,
        e?.horaFin,
        e?.objetivoConsulta,
        e?.padecimientoActual,
        e?.doctor,
        e?.servicio,
        e?.cita,
        e?.nombrePaciente
      ]);

  @override
  bool isValidKey(Object? o) => o is ConsultaRecord;
}
