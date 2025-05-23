import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  bool hasClinica() => _clinica != null;

  // "assistant" field.
  bool? _assistant;
  bool get assistant => _assistant ?? false;
  bool hasAssistant() => _assistant != null;

  // "use_tokens" field.
  int? _useTokens;
  int get useTokens => _useTokens ?? 0;
  bool hasUseTokens() => _useTokens != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _chat = snapshotData['chat'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _assistant = snapshotData['assistant'] as bool?;
    _useTokens = castToType<int>(snapshotData['use_tokens']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  DocumentReference? user,
  DocumentReference? chat,
  String? text,
  DateTime? timestamp,
  String? image,
  String? video,
  DocumentReference? clinica,
  bool? assistant,
  int? useTokens,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'chat': chat,
      'text': text,
      'timestamp': timestamp,
      'image': image,
      'video': video,
      'clinica': clinica,
      'assistant': assistant,
      'use_tokens': useTokens,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.chat == e2?.chat &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.clinica == e2?.clinica &&
        e1?.assistant == e2?.assistant &&
        e1?.useTokens == e2?.useTokens;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.chat,
        e?.text,
        e?.timestamp,
        e?.image,
        e?.video,
        e?.clinica,
        e?.assistant,
        e?.useTokens
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
