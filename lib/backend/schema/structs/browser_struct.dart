// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BrowserStruct extends FFFirebaseStruct {
  BrowserStruct({
    String? navegador,
    String? userAgent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _navegador = navegador,
        _userAgent = userAgent,
        super(firestoreUtilData);

  // "navegador" field.
  String? _navegador;
  String get navegador => _navegador ?? '';
  set navegador(String? val) => _navegador = val;

  bool hasNavegador() => _navegador != null;

  // "userAgent" field.
  String? _userAgent;
  String get userAgent => _userAgent ?? '';
  set userAgent(String? val) => _userAgent = val;

  bool hasUserAgent() => _userAgent != null;

  static BrowserStruct fromMap(Map<String, dynamic> data) => BrowserStruct(
        navegador: data['navegador'] as String?,
        userAgent: data['userAgent'] as String?,
      );

  static BrowserStruct? maybeFromMap(dynamic data) =>
      data is Map ? BrowserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'navegador': _navegador,
        'userAgent': _userAgent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'navegador': serializeParam(
          _navegador,
          ParamType.String,
        ),
        'userAgent': serializeParam(
          _userAgent,
          ParamType.String,
        ),
      }.withoutNulls;

  static BrowserStruct fromSerializableMap(Map<String, dynamic> data) =>
      BrowserStruct(
        navegador: deserializeParam(
          data['navegador'],
          ParamType.String,
          false,
        ),
        userAgent: deserializeParam(
          data['userAgent'],
          ParamType.String,
          false,
        ),
      );

  static BrowserStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BrowserStruct(
        navegador: convertAlgoliaParam(
          data['navegador'],
          ParamType.String,
          false,
        ),
        userAgent: convertAlgoliaParam(
          data['userAgent'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BrowserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BrowserStruct &&
        navegador == other.navegador &&
        userAgent == other.userAgent;
  }

  @override
  int get hashCode => const ListEquality().hash([navegador, userAgent]);
}

BrowserStruct createBrowserStruct({
  String? navegador,
  String? userAgent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BrowserStruct(
      navegador: navegador,
      userAgent: userAgent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BrowserStruct? updateBrowserStruct(
  BrowserStruct? browser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    browser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBrowserStructData(
  Map<String, dynamic> firestoreData,
  BrowserStruct? browser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (browser == null) {
    return;
  }
  if (browser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && browser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final browserData = getBrowserFirestoreData(browser, forFieldValue);
  final nestedData = browserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = browser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBrowserFirestoreData(
  BrowserStruct? browser, [
  bool forFieldValue = false,
]) {
  if (browser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(browser.toMap());

  // Add any Firestore field values
  browser.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBrowserListFirestoreData(
  List<BrowserStruct>? browsers,
) =>
    browsers?.map((e) => getBrowserFirestoreData(e, true)).toList() ?? [];
