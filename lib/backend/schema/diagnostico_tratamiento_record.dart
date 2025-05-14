import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosticoTratamientoRecord extends FirestoreRecord {
  DiagnosticoTratamientoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CIE10_grupo" field.
  String? _cIE10Grupo;
  String get cIE10Grupo => _cIE10Grupo ?? '';
  bool hasCIE10Grupo() => _cIE10Grupo != null;

  // "CIE10_guardados" field.
  String? _cIE10Guardados;
  String get cIE10Guardados => _cIE10Guardados ?? '';
  bool hasCIE10Guardados() => _cIE10Guardados != null;

  // "diagnostico" field.
  String? _diagnostico;
  String get diagnostico => _diagnostico ?? '';
  bool hasDiagnostico() => _diagnostico != null;

  // "tratamiento" field.
  List<String>? _tratamiento;
  List<String> get tratamiento => _tratamiento ?? const [];
  bool hasTratamiento() => _tratamiento != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  // "cobroPaciente" field.
  double? _cobroPaciente;
  double get cobroPaciente => _cobroPaciente ?? 0.0;
  bool hasCobroPaciente() => _cobroPaciente != null;

  // "cobroAseguradora" field.
  double? _cobroAseguradora;
  double get cobroAseguradora => _cobroAseguradora ?? 0.0;
  bool hasCobroAseguradora() => _cobroAseguradora != null;

  // "totalPrecio" field.
  double? _totalPrecio;
  double get totalPrecio => _totalPrecio ?? 0.0;
  bool hasTotalPrecio() => _totalPrecio != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cIE10Grupo = snapshotData['CIE10_grupo'] as String?;
    _cIE10Guardados = snapshotData['CIE10_guardados'] as String?;
    _diagnostico = snapshotData['diagnostico'] as String?;
    _tratamiento = getDataList(snapshotData['tratamiento']);
    _notas = snapshotData['notas'] as String?;
    _cobroPaciente = castToType<double>(snapshotData['cobroPaciente']);
    _cobroAseguradora = castToType<double>(snapshotData['cobroAseguradora']);
    _totalPrecio = castToType<double>(snapshotData['totalPrecio']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('diagnosticoTratamiento')
          : FirebaseFirestore.instance
              .collectionGroup('diagnosticoTratamiento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('diagnosticoTratamiento').doc(id);

  static Stream<DiagnosticoTratamientoRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosticoTratamientoRecord.fromSnapshot(s));

  static Future<DiagnosticoTratamientoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DiagnosticoTratamientoRecord.fromSnapshot(s));

  static DiagnosticoTratamientoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosticoTratamientoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosticoTratamientoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosticoTratamientoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosticoTratamientoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiagnosticoTratamientoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiagnosticoTratamientoRecordData({
  String? cIE10Grupo,
  String? cIE10Guardados,
  String? diagnostico,
  String? notas,
  double? cobroPaciente,
  double? cobroAseguradora,
  double? totalPrecio,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CIE10_grupo': cIE10Grupo,
      'CIE10_guardados': cIE10Guardados,
      'diagnostico': diagnostico,
      'notas': notas,
      'cobroPaciente': cobroPaciente,
      'cobroAseguradora': cobroAseguradora,
      'totalPrecio': totalPrecio,
      'createdDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiagnosticoTratamientoRecordDocumentEquality
    implements Equality<DiagnosticoTratamientoRecord> {
  const DiagnosticoTratamientoRecordDocumentEquality();

  @override
  bool equals(
      DiagnosticoTratamientoRecord? e1, DiagnosticoTratamientoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cIE10Grupo == e2?.cIE10Grupo &&
        e1?.cIE10Guardados == e2?.cIE10Guardados &&
        e1?.diagnostico == e2?.diagnostico &&
        listEquality.equals(e1?.tratamiento, e2?.tratamiento) &&
        e1?.notas == e2?.notas &&
        e1?.cobroPaciente == e2?.cobroPaciente &&
        e1?.cobroAseguradora == e2?.cobroAseguradora &&
        e1?.totalPrecio == e2?.totalPrecio &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(DiagnosticoTratamientoRecord? e) => const ListEquality().hash([
        e?.cIE10Grupo,
        e?.cIE10Guardados,
        e?.diagnostico,
        e?.tratamiento,
        e?.notas,
        e?.cobroPaciente,
        e?.cobroAseguradora,
        e?.totalPrecio,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is DiagnosticoTratamientoRecord;
}
