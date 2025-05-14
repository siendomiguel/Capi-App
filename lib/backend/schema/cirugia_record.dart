import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CirugiaRecord extends FirestoreRecord {
  CirugiaRecord._(
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

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "procedimiento" field.
  String? _procedimiento;
  String get procedimiento => _procedimiento ?? '';
  bool hasProcedimiento() => _procedimiento != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _procedimiento = snapshotData['procedimiento'] as String?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cirugia');

  static Stream<CirugiaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CirugiaRecord.fromSnapshot(s));

  static Future<CirugiaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CirugiaRecord.fromSnapshot(s));

  static CirugiaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CirugiaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CirugiaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CirugiaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CirugiaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CirugiaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCirugiaRecordData({
  String? uid,
  DateTime? createdDate,
  DocumentReference? clinica,
  DocumentReference? paciente,
  DateTime? fecha,
  String? procedimiento,
  DocumentReference? doctor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'createdDate': createdDate,
      'clinica': clinica,
      'paciente': paciente,
      'fecha': fecha,
      'procedimiento': procedimiento,
      'doctor': doctor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CirugiaRecordDocumentEquality implements Equality<CirugiaRecord> {
  const CirugiaRecordDocumentEquality();

  @override
  bool equals(CirugiaRecord? e1, CirugiaRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.clinica == e2?.clinica &&
        e1?.paciente == e2?.paciente &&
        e1?.fecha == e2?.fecha &&
        e1?.procedimiento == e2?.procedimiento &&
        e1?.doctor == e2?.doctor;
  }

  @override
  int hash(CirugiaRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdDate,
        e?.clinica,
        e?.paciente,
        e?.fecha,
        e?.procedimiento,
        e?.doctor
      ]);

  @override
  bool isValidKey(Object? o) => o is CirugiaRecord;
}
