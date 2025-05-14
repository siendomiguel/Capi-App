import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AntecedentesRecord extends FirestoreRecord {
  AntecedentesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "antecedente" field.
  String? _antecedente;
  String get antecedente => _antecedente ?? '';
  bool hasAntecedente() => _antecedente != null;

  // "detalle" field.
  String? _detalle;
  String get detalle => _detalle ?? '';
  bool hasDetalle() => _detalle != null;

  // "aplica" field.
  bool? _aplica;
  bool get aplica => _aplica ?? false;
  bool hasAplica() => _aplica != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  bool hasOrderID() => _orderID != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _antecedente = snapshotData['antecedente'] as String?;
    _detalle = snapshotData['detalle'] as String?;
    _aplica = snapshotData['aplica'] as bool?;
    _notas = snapshotData['notas'] as String?;
    _orderID = castToType<int>(snapshotData['orderID']);
    _doctor = snapshotData['doctor'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('antecedentes')
          : FirebaseFirestore.instance.collectionGroup('antecedentes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('antecedentes').doc(id);

  static Stream<AntecedentesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AntecedentesRecord.fromSnapshot(s));

  static Future<AntecedentesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AntecedentesRecord.fromSnapshot(s));

  static AntecedentesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AntecedentesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AntecedentesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AntecedentesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AntecedentesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AntecedentesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAntecedentesRecordData({
  String? antecedente,
  String? detalle,
  bool? aplica,
  String? notas,
  int? orderID,
  DocumentReference? doctor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'antecedente': antecedente,
      'detalle': detalle,
      'aplica': aplica,
      'notas': notas,
      'orderID': orderID,
      'doctor': doctor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AntecedentesRecordDocumentEquality
    implements Equality<AntecedentesRecord> {
  const AntecedentesRecordDocumentEquality();

  @override
  bool equals(AntecedentesRecord? e1, AntecedentesRecord? e2) {
    return e1?.antecedente == e2?.antecedente &&
        e1?.detalle == e2?.detalle &&
        e1?.aplica == e2?.aplica &&
        e1?.notas == e2?.notas &&
        e1?.orderID == e2?.orderID &&
        e1?.doctor == e2?.doctor;
  }

  @override
  int hash(AntecedentesRecord? e) => const ListEquality().hash(
      [e?.antecedente, e?.detalle, e?.aplica, e?.notas, e?.orderID, e?.doctor]);

  @override
  bool isValidKey(Object? o) => o is AntecedentesRecord;
}
