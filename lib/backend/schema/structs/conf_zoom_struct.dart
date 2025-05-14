// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ConfZoomStruct extends FFFirebaseStruct {
  ConfZoomStruct({
    String? zoomAPIKey,
    String? zoomSecretKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _zoomAPIKey = zoomAPIKey,
        _zoomSecretKey = zoomSecretKey,
        super(firestoreUtilData);

  // "zoomAPIKey" field.
  String? _zoomAPIKey;
  String get zoomAPIKey => _zoomAPIKey ?? '';
  set zoomAPIKey(String? val) => _zoomAPIKey = val;

  bool hasZoomAPIKey() => _zoomAPIKey != null;

  // "zoomSecretKey" field.
  String? _zoomSecretKey;
  String get zoomSecretKey => _zoomSecretKey ?? '';
  set zoomSecretKey(String? val) => _zoomSecretKey = val;

  bool hasZoomSecretKey() => _zoomSecretKey != null;

  static ConfZoomStruct fromMap(Map<String, dynamic> data) => ConfZoomStruct(
        zoomAPIKey: data['zoomAPIKey'] as String?,
        zoomSecretKey: data['zoomSecretKey'] as String?,
      );

  static ConfZoomStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConfZoomStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'zoomAPIKey': _zoomAPIKey,
        'zoomSecretKey': _zoomSecretKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zoomAPIKey': serializeParam(
          _zoomAPIKey,
          ParamType.String,
        ),
        'zoomSecretKey': serializeParam(
          _zoomSecretKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfZoomStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfZoomStruct(
        zoomAPIKey: deserializeParam(
          data['zoomAPIKey'],
          ParamType.String,
          false,
        ),
        zoomSecretKey: deserializeParam(
          data['zoomSecretKey'],
          ParamType.String,
          false,
        ),
      );

  static ConfZoomStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConfZoomStruct(
        zoomAPIKey: convertAlgoliaParam(
          data['zoomAPIKey'],
          ParamType.String,
          false,
        ),
        zoomSecretKey: convertAlgoliaParam(
          data['zoomSecretKey'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConfZoomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfZoomStruct &&
        zoomAPIKey == other.zoomAPIKey &&
        zoomSecretKey == other.zoomSecretKey;
  }

  @override
  int get hashCode => const ListEquality().hash([zoomAPIKey, zoomSecretKey]);
}

ConfZoomStruct createConfZoomStruct({
  String? zoomAPIKey,
  String? zoomSecretKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfZoomStruct(
      zoomAPIKey: zoomAPIKey,
      zoomSecretKey: zoomSecretKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfZoomStruct? updateConfZoomStruct(
  ConfZoomStruct? confZoom, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    confZoom
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfZoomStructData(
  Map<String, dynamic> firestoreData,
  ConfZoomStruct? confZoom,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (confZoom == null) {
    return;
  }
  if (confZoom.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && confZoom.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final confZoomData = getConfZoomFirestoreData(confZoom, forFieldValue);
  final nestedData = confZoomData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = confZoom.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfZoomFirestoreData(
  ConfZoomStruct? confZoom, [
  bool forFieldValue = false,
]) {
  if (confZoom == null) {
    return {};
  }
  final firestoreData = mapToFirestore(confZoom.toMap());

  // Add any Firestore field values
  confZoom.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfZoomListFirestoreData(
  List<ConfZoomStruct>? confZooms,
) =>
    confZooms?.map((e) => getConfZoomFirestoreData(e, true)).toList() ?? [];
