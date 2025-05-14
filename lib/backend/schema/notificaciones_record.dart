import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacionesRecord extends FirestoreRecord {
  NotificacionesRecord._(
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

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "readBy" field.
  List<DocumentReference>? _readBy;
  List<DocumentReference> get readBy => _readBy ?? const [];
  bool hasReadBy() => _readBy != null;

  // "deletedBy" field.
  List<DocumentReference>? _deletedBy;
  List<DocumentReference> get deletedBy => _deletedBy ?? const [];
  bool hasDeletedBy() => _deletedBy != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "especificUser" field.
  DocumentReference? _especificUser;
  DocumentReference? get especificUser => _especificUser;
  bool hasEspecificUser() => _especificUser != null;

  // "citaConfirmada" field.
  bool? _citaConfirmada;
  bool get citaConfirmada => _citaConfirmada ?? false;
  bool hasCitaConfirmada() => _citaConfirmada != null;

  // "citaRef" field.
  DocumentReference? _citaRef;
  DocumentReference? get citaRef => _citaRef;
  bool hasCitaRef() => _citaRef != null;

  // "allUsers" field.
  bool? _allUsers;
  bool get allUsers => _allUsers ?? false;
  bool hasAllUsers() => _allUsers != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _titulo = snapshotData['titulo'] as String?;
    _mensaje = snapshotData['mensaje'] as String?;
    _readBy = getDataList(snapshotData['readBy']);
    _deletedBy = getDataList(snapshotData['deletedBy']);
    _image = snapshotData['image'] as String?;
    _especificUser = snapshotData['especificUser'] as DocumentReference?;
    _citaConfirmada = snapshotData['citaConfirmada'] as bool?;
    _citaRef = snapshotData['citaRef'] as DocumentReference?;
    _allUsers = snapshotData['allUsers'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificaciones');

  static Stream<NotificacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacionesRecord.fromSnapshot(s));

  static Future<NotificacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacionesRecord.fromSnapshot(s));

  static NotificacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacionesRecordData({
  String? uid,
  DateTime? createdDate,
  DocumentReference? clinica,
  DocumentReference? sender,
  String? titulo,
  String? mensaje,
  String? image,
  DocumentReference? especificUser,
  bool? citaConfirmada,
  DocumentReference? citaRef,
  bool? allUsers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'createdDate': createdDate,
      'clinica': clinica,
      'sender': sender,
      'titulo': titulo,
      'mensaje': mensaje,
      'image': image,
      'especificUser': especificUser,
      'citaConfirmada': citaConfirmada,
      'citaRef': citaRef,
      'allUsers': allUsers,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacionesRecordDocumentEquality
    implements Equality<NotificacionesRecord> {
  const NotificacionesRecordDocumentEquality();

  @override
  bool equals(NotificacionesRecord? e1, NotificacionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdDate == e2?.createdDate &&
        e1?.clinica == e2?.clinica &&
        e1?.sender == e2?.sender &&
        e1?.titulo == e2?.titulo &&
        e1?.mensaje == e2?.mensaje &&
        listEquality.equals(e1?.readBy, e2?.readBy) &&
        listEquality.equals(e1?.deletedBy, e2?.deletedBy) &&
        e1?.image == e2?.image &&
        e1?.especificUser == e2?.especificUser &&
        e1?.citaConfirmada == e2?.citaConfirmada &&
        e1?.citaRef == e2?.citaRef &&
        e1?.allUsers == e2?.allUsers;
  }

  @override
  int hash(NotificacionesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdDate,
        e?.clinica,
        e?.sender,
        e?.titulo,
        e?.mensaje,
        e?.readBy,
        e?.deletedBy,
        e?.image,
        e?.especificUser,
        e?.citaConfirmada,
        e?.citaRef,
        e?.allUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacionesRecord;
}
