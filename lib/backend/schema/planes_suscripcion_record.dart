import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanesSuscripcionRecord extends FirestoreRecord {
  PlanesSuscripcionRecord._(
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

  // "nombrePlan" field.
  String? _nombrePlan;
  String get nombrePlan => _nombrePlan ?? '';
  bool hasNombrePlan() => _nombrePlan != null;

  // "descripcionPlan" field.
  String? _descripcionPlan;
  String get descripcionPlan => _descripcionPlan ?? '';
  bool hasDescripcionPlan() => _descripcionPlan != null;

  // "precioPlan" field.
  double? _precioPlan;
  double get precioPlan => _precioPlan ?? 0.0;
  bool hasPrecioPlan() => _precioPlan != null;

  // "duracion" field.
  String? _duracion;
  String get duracion => _duracion ?? '';
  bool hasDuracion() => _duracion != null;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  bool hasOrderID() => _orderID != null;

  // "capacidadPersonal" field.
  int? _capacidadPersonal;
  int get capacidadPersonal => _capacidadPersonal ?? 0;
  bool hasCapacidadPersonal() => _capacidadPersonal != null;

  // "capacidadGeneral" field.
  int? _capacidadGeneral;
  int get capacidadGeneral => _capacidadGeneral ?? 0;
  bool hasCapacidadGeneral() => _capacidadGeneral != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _nombrePlan = snapshotData['nombrePlan'] as String?;
    _descripcionPlan = snapshotData['descripcionPlan'] as String?;
    _precioPlan = castToType<double>(snapshotData['precioPlan']);
    _duracion = snapshotData['duracion'] as String?;
    _orderID = castToType<int>(snapshotData['orderID']);
    _capacidadPersonal = castToType<int>(snapshotData['capacidadPersonal']);
    _capacidadGeneral = castToType<int>(snapshotData['capacidadGeneral']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planesSuscripcion');

  static Stream<PlanesSuscripcionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanesSuscripcionRecord.fromSnapshot(s));

  static Future<PlanesSuscripcionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlanesSuscripcionRecord.fromSnapshot(s));

  static PlanesSuscripcionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlanesSuscripcionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanesSuscripcionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanesSuscripcionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanesSuscripcionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanesSuscripcionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanesSuscripcionRecordData({
  String? uid,
  DateTime? createdDate,
  DocumentReference? clinica,
  String? nombrePlan,
  String? descripcionPlan,
  double? precioPlan,
  String? duracion,
  int? orderID,
  int? capacidadPersonal,
  int? capacidadGeneral,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'createdDate': createdDate,
      'clinica': clinica,
      'nombrePlan': nombrePlan,
      'descripcionPlan': descripcionPlan,
      'precioPlan': precioPlan,
      'duracion': duracion,
      'orderID': orderID,
      'capacidadPersonal': capacidadPersonal,
      'capacidadGeneral': capacidadGeneral,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanesSuscripcionRecordDocumentEquality
    implements Equality<PlanesSuscripcionRecord> {
  const PlanesSuscripcionRecordDocumentEquality();

  @override
  bool equals(PlanesSuscripcionRecord? e1, PlanesSuscripcionRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.clinica == e2?.clinica &&
        e1?.nombrePlan == e2?.nombrePlan &&
        e1?.descripcionPlan == e2?.descripcionPlan &&
        e1?.precioPlan == e2?.precioPlan &&
        e1?.duracion == e2?.duracion &&
        e1?.orderID == e2?.orderID &&
        e1?.capacidadPersonal == e2?.capacidadPersonal &&
        e1?.capacidadGeneral == e2?.capacidadGeneral;
  }

  @override
  int hash(PlanesSuscripcionRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdDate,
        e?.clinica,
        e?.nombrePlan,
        e?.descripcionPlan,
        e?.precioPlan,
        e?.duracion,
        e?.orderID,
        e?.capacidadPersonal,
        e?.capacidadGeneral
      ]);

  @override
  bool isValidKey(Object? o) => o is PlanesSuscripcionRecord;
}
