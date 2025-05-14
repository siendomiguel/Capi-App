import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignosVitalesRecord extends FirestoreRecord {
  SignosVitalesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "signo" field.
  String? _signo;
  String get signo => _signo ?? '';
  bool hasSigno() => _signo != null;

  // "valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  bool hasOrderID() => _orderID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _signo = snapshotData['signo'] as String?;
    _valor = snapshotData['valor'] as String?;
    _notas = snapshotData['notas'] as String?;
    _orderID = castToType<int>(snapshotData['orderID']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('signosVitales')
          : FirebaseFirestore.instance.collectionGroup('signosVitales');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('signosVitales').doc(id);

  static Stream<SignosVitalesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SignosVitalesRecord.fromSnapshot(s));

  static Future<SignosVitalesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SignosVitalesRecord.fromSnapshot(s));

  static SignosVitalesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SignosVitalesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SignosVitalesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SignosVitalesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SignosVitalesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SignosVitalesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSignosVitalesRecordData({
  String? signo,
  String? valor,
  String? notas,
  int? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'signo': signo,
      'valor': valor,
      'notas': notas,
      'orderID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SignosVitalesRecordDocumentEquality
    implements Equality<SignosVitalesRecord> {
  const SignosVitalesRecordDocumentEquality();

  @override
  bool equals(SignosVitalesRecord? e1, SignosVitalesRecord? e2) {
    return e1?.signo == e2?.signo &&
        e1?.valor == e2?.valor &&
        e1?.notas == e2?.notas &&
        e1?.orderID == e2?.orderID;
  }

  @override
  int hash(SignosVitalesRecord? e) =>
      const ListEquality().hash([e?.signo, e?.valor, e?.notas, e?.orderID]);

  @override
  bool isValidKey(Object? o) => o is SignosVitalesRecord;
}
