import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiciosRecord extends FirestoreRecord {
  ServiciosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "nombreServicio" field.
  String? _nombreServicio;
  String get nombreServicio => _nombreServicio ?? '';
  bool hasNombreServicio() => _nombreServicio != null;

  // "descripcionServicio" field.
  String? _descripcionServicio;
  String get descripcionServicio => _descripcionServicio ?? '';
  bool hasDescripcionServicio() => _descripcionServicio != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  bool hasClinica() => _clinica != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "descripcionLarga" field.
  String? _descripcionLarga;
  String get descripcionLarga => _descripcionLarga ?? '';
  bool hasDescripcionLarga() => _descripcionLarga != null;

  // "imagenServicio" field.
  String? _imagenServicio;
  String get imagenServicio => _imagenServicio ?? '';
  bool hasImagenServicio() => _imagenServicio != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  bool hasDisponible() => _disponible != null;

  // "duracion" field.
  int? _duracion;
  int get duracion => _duracion ?? 0;
  bool hasDuracion() => _duracion != null;

  // "doctores" field.
  List<DocumentReference>? _doctores;
  List<DocumentReference> get doctores => _doctores ?? const [];
  bool hasDoctores() => _doctores != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _nombreServicio = snapshotData['nombreServicio'] as String?;
    _descripcionServicio = snapshotData['descripcionServicio'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _descripcionLarga = snapshotData['descripcionLarga'] as String?;
    _imagenServicio = snapshotData['imagenServicio'] as String?;
    _disponible = snapshotData['disponible'] as bool?;
    _duracion = castToType<int>(snapshotData['duracion']);
    _doctores = getDataList(snapshotData['doctores']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicios');

  static Stream<ServiciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiciosRecord.fromSnapshot(s));

  static Future<ServiciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiciosRecord.fromSnapshot(s));

  static ServiciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiciosRecordData({
  String? uid,
  String? nombreServicio,
  String? descripcionServicio,
  double? precio,
  DocumentReference? clinica,
  DateTime? createdDate,
  String? descripcionLarga,
  String? imagenServicio,
  bool? disponible,
  int? duracion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'nombreServicio': nombreServicio,
      'descripcionServicio': descripcionServicio,
      'precio': precio,
      'clinica': clinica,
      'createdDate': createdDate,
      'descripcionLarga': descripcionLarga,
      'imagenServicio': imagenServicio,
      'disponible': disponible,
      'duracion': duracion,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiciosRecordDocumentEquality implements Equality<ServiciosRecord> {
  const ServiciosRecordDocumentEquality();

  @override
  bool equals(ServiciosRecord? e1, ServiciosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.nombreServicio == e2?.nombreServicio &&
        e1?.descripcionServicio == e2?.descripcionServicio &&
        e1?.precio == e2?.precio &&
        e1?.clinica == e2?.clinica &&
        e1?.createdDate == e2?.createdDate &&
        e1?.descripcionLarga == e2?.descripcionLarga &&
        e1?.imagenServicio == e2?.imagenServicio &&
        e1?.disponible == e2?.disponible &&
        e1?.duracion == e2?.duracion &&
        listEquality.equals(e1?.doctores, e2?.doctores);
  }

  @override
  int hash(ServiciosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.nombreServicio,
        e?.descripcionServicio,
        e?.precio,
        e?.clinica,
        e?.createdDate,
        e?.descripcionLarga,
        e?.imagenServicio,
        e?.disponible,
        e?.duracion,
        e?.doctores
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiciosRecord;
}
