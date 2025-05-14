import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EspecialidadRecord extends FirestoreRecord {
  EspecialidadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "doctores" field.
  List<DocumentReference>? _doctores;
  List<DocumentReference> get doctores => _doctores ?? const [];
  bool hasDoctores() => _doctores != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _doctores = getDataList(snapshotData['doctores']);
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('especialidad');

  static Stream<EspecialidadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EspecialidadRecord.fromSnapshot(s));

  static Future<EspecialidadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EspecialidadRecord.fromSnapshot(s));

  static EspecialidadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EspecialidadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EspecialidadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EspecialidadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EspecialidadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EspecialidadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEspecialidadRecordData({
  String? uid,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class EspecialidadRecordDocumentEquality
    implements Equality<EspecialidadRecord> {
  const EspecialidadRecordDocumentEquality();

  @override
  bool equals(EspecialidadRecord? e1, EspecialidadRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        listEquality.equals(e1?.doctores, e2?.doctores) &&
        e1?.nombre == e2?.nombre;
  }

  @override
  int hash(EspecialidadRecord? e) =>
      const ListEquality().hash([e?.uid, e?.doctores, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is EspecialidadRecord;
}
