import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstudiosArchivosRecord extends FirestoreRecord {
  EstudiosArchivosRecord._(
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

  // "laboratorio" field.
  String? _laboratorio;
  String get laboratorio => _laboratorio ?? '';
  bool hasLaboratorio() => _laboratorio != null;

  // "tipoExamen" field.
  String? _tipoExamen;
  String get tipoExamen => _tipoExamen ?? '';
  bool hasTipoExamen() => _tipoExamen != null;

  // "archivo" field.
  String? _archivo;
  String get archivo => _archivo ?? '';
  bool hasArchivo() => _archivo != null;

  // "proveedor" field.
  String? _proveedor;
  String get proveedor => _proveedor ?? '';
  bool hasProveedor() => _proveedor != null;

  // "estatus" field.
  String? _estatus;
  String get estatus => _estatus ?? '';
  bool hasEstatus() => _estatus != null;

  // "fechaRequerida" field.
  DateTime? _fechaRequerida;
  DateTime? get fechaRequerida => _fechaRequerida;
  bool hasFechaRequerida() => _fechaRequerida != null;

  // "fechaRealizada" field.
  DateTime? _fechaRealizada;
  DateTime? get fechaRealizada => _fechaRealizada;
  bool hasFechaRealizada() => _fechaRealizada != null;

  // "conclusiones" field.
  String? _conclusiones;
  String get conclusiones => _conclusiones ?? '';
  bool hasConclusiones() => _conclusiones != null;

  // "archivos" field.
  List<String>? _archivos;
  List<String> get archivos => _archivos ?? const [];
  bool hasArchivos() => _archivos != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _laboratorio = snapshotData['laboratorio'] as String?;
    _tipoExamen = snapshotData['tipoExamen'] as String?;
    _archivo = snapshotData['archivo'] as String?;
    _proveedor = snapshotData['proveedor'] as String?;
    _estatus = snapshotData['estatus'] as String?;
    _fechaRequerida = snapshotData['fechaRequerida'] as DateTime?;
    _fechaRealizada = snapshotData['fechaRealizada'] as DateTime?;
    _conclusiones = snapshotData['conclusiones'] as String?;
    _archivos = getDataList(snapshotData['archivos']);
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _descripcion = snapshotData['descripcion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estudiosArchivos');

  static Stream<EstudiosArchivosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstudiosArchivosRecord.fromSnapshot(s));

  static Future<EstudiosArchivosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EstudiosArchivosRecord.fromSnapshot(s));

  static EstudiosArchivosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstudiosArchivosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstudiosArchivosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstudiosArchivosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstudiosArchivosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstudiosArchivosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstudiosArchivosRecordData({
  String? uid,
  DateTime? createdDate,
  DocumentReference? clinica,
  DocumentReference? paciente,
  String? laboratorio,
  String? tipoExamen,
  String? archivo,
  String? proveedor,
  String? estatus,
  DateTime? fechaRequerida,
  DateTime? fechaRealizada,
  String? conclusiones,
  DocumentReference? doctor,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'createdDate': createdDate,
      'clinica': clinica,
      'paciente': paciente,
      'laboratorio': laboratorio,
      'tipoExamen': tipoExamen,
      'archivo': archivo,
      'proveedor': proveedor,
      'estatus': estatus,
      'fechaRequerida': fechaRequerida,
      'fechaRealizada': fechaRealizada,
      'conclusiones': conclusiones,
      'doctor': doctor,
      'descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstudiosArchivosRecordDocumentEquality
    implements Equality<EstudiosArchivosRecord> {
  const EstudiosArchivosRecordDocumentEquality();

  @override
  bool equals(EstudiosArchivosRecord? e1, EstudiosArchivosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.clinica == e2?.clinica &&
        e1?.paciente == e2?.paciente &&
        e1?.laboratorio == e2?.laboratorio &&
        e1?.tipoExamen == e2?.tipoExamen &&
        e1?.archivo == e2?.archivo &&
        e1?.proveedor == e2?.proveedor &&
        e1?.estatus == e2?.estatus &&
        e1?.fechaRequerida == e2?.fechaRequerida &&
        e1?.fechaRealizada == e2?.fechaRealizada &&
        e1?.conclusiones == e2?.conclusiones &&
        listEquality.equals(e1?.archivos, e2?.archivos) &&
        e1?.doctor == e2?.doctor &&
        e1?.descripcion == e2?.descripcion;
  }

  @override
  int hash(EstudiosArchivosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdDate,
        e?.clinica,
        e?.paciente,
        e?.laboratorio,
        e?.tipoExamen,
        e?.archivo,
        e?.proveedor,
        e?.estatus,
        e?.fechaRequerida,
        e?.fechaRealizada,
        e?.conclusiones,
        e?.archivos,
        e?.doctor,
        e?.descripcion
      ]);

  @override
  bool isValidKey(Object? o) => o is EstudiosArchivosRecord;
}
