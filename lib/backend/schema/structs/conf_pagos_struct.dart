// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ConfPagosStruct extends FFFirebaseStruct {
  ConfPagosStruct({
    String? stripeAPIKey,
    String? stripeSecretKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stripeAPIKey = stripeAPIKey,
        _stripeSecretKey = stripeSecretKey,
        super(firestoreUtilData);

  // "stripeAPIKey" field.
  String? _stripeAPIKey;
  String get stripeAPIKey => _stripeAPIKey ?? '';
  set stripeAPIKey(String? val) => _stripeAPIKey = val;

  bool hasStripeAPIKey() => _stripeAPIKey != null;

  // "stripeSecretKey" field.
  String? _stripeSecretKey;
  String get stripeSecretKey => _stripeSecretKey ?? '';
  set stripeSecretKey(String? val) => _stripeSecretKey = val;

  bool hasStripeSecretKey() => _stripeSecretKey != null;

  static ConfPagosStruct fromMap(Map<String, dynamic> data) => ConfPagosStruct(
        stripeAPIKey: data['stripeAPIKey'] as String?,
        stripeSecretKey: data['stripeSecretKey'] as String?,
      );

  static ConfPagosStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfPagosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stripeAPIKey': _stripeAPIKey,
        'stripeSecretKey': _stripeSecretKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stripeAPIKey': serializeParam(
          _stripeAPIKey,
          ParamType.String,
        ),
        'stripeSecretKey': serializeParam(
          _stripeSecretKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfPagosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfPagosStruct(
        stripeAPIKey: deserializeParam(
          data['stripeAPIKey'],
          ParamType.String,
          false,
        ),
        stripeSecretKey: deserializeParam(
          data['stripeSecretKey'],
          ParamType.String,
          false,
        ),
      );

  static ConfPagosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConfPagosStruct(
        stripeAPIKey: convertAlgoliaParam(
          data['stripeAPIKey'],
          ParamType.String,
          false,
        ),
        stripeSecretKey: convertAlgoliaParam(
          data['stripeSecretKey'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConfPagosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfPagosStruct &&
        stripeAPIKey == other.stripeAPIKey &&
        stripeSecretKey == other.stripeSecretKey;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([stripeAPIKey, stripeSecretKey]);
}

ConfPagosStruct createConfPagosStruct({
  String? stripeAPIKey,
  String? stripeSecretKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfPagosStruct(
      stripeAPIKey: stripeAPIKey,
      stripeSecretKey: stripeSecretKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfPagosStruct? updateConfPagosStruct(
  ConfPagosStruct? confPagos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    confPagos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfPagosStructData(
  Map<String, dynamic> firestoreData,
  ConfPagosStruct? confPagos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (confPagos == null) {
    return;
  }
  if (confPagos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && confPagos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final confPagosData = getConfPagosFirestoreData(confPagos, forFieldValue);
  final nestedData = confPagosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = confPagos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfPagosFirestoreData(
  ConfPagosStruct? confPagos, [
  bool forFieldValue = false,
]) {
  if (confPagos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(confPagos.toMap());

  // Add any Firestore field values
  confPagos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfPagosListFirestoreData(
  List<ConfPagosStruct>? confPagoss,
) =>
    confPagoss?.map((e) => getConfPagosFirestoreData(e, true)).toList() ?? [];
