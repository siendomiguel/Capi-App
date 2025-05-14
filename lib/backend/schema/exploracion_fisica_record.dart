import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExploracionFisicaRecord extends FirestoreRecord {
  ExploracionFisicaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "parteCuerpo" field.
  String? _parteCuerpo;
  String get parteCuerpo => _parteCuerpo ?? '';
  bool hasParteCuerpo() => _parteCuerpo != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  // "orderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _parteCuerpo = snapshotData['parteCuerpo'] as String?;
    _notas = snapshotData['notas'] as String?;
    _orderID = snapshotData['orderID'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('exploracionFisica')
          : FirebaseFirestore.instance.collectionGroup('exploracionFisica');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('exploracionFisica').doc(id);

  static Stream<ExploracionFisicaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExploracionFisicaRecord.fromSnapshot(s));

  static Future<ExploracionFisicaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExploracionFisicaRecord.fromSnapshot(s));

  static ExploracionFisicaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExploracionFisicaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExploracionFisicaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExploracionFisicaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExploracionFisicaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExploracionFisicaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExploracionFisicaRecordData({
  String? parteCuerpo,
  String? notas,
  String? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parteCuerpo': parteCuerpo,
      'notas': notas,
      'orderID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExploracionFisicaRecordDocumentEquality
    implements Equality<ExploracionFisicaRecord> {
  const ExploracionFisicaRecordDocumentEquality();

  @override
  bool equals(ExploracionFisicaRecord? e1, ExploracionFisicaRecord? e2) {
    return e1?.parteCuerpo == e2?.parteCuerpo &&
        e1?.notas == e2?.notas &&
        e1?.orderID == e2?.orderID;
  }

  @override
  int hash(ExploracionFisicaRecord? e) =>
      const ListEquality().hash([e?.parteCuerpo, e?.notas, e?.orderID]);

  @override
  bool isValidKey(Object? o) => o is ExploracionFisicaRecord;
}
