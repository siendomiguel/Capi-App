// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AlergiasStruct extends FFFirebaseStruct {
  AlergiasStruct({
    int? orderID,
    String? nombreAlergia,
    String? descripcionAlergia,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderID = orderID,
        _nombreAlergia = nombreAlergia,
        _descripcionAlergia = descripcionAlergia,
        super(firestoreUtilData);

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  set orderID(int? val) => _orderID = val;

  void incrementOrderID(int amount) => orderID = orderID + amount;

  bool hasOrderID() => _orderID != null;

  // "nombreAlergia" field.
  String? _nombreAlergia;
  String get nombreAlergia => _nombreAlergia ?? '';
  set nombreAlergia(String? val) => _nombreAlergia = val;

  bool hasNombreAlergia() => _nombreAlergia != null;

  // "descripcionAlergia" field.
  String? _descripcionAlergia;
  String get descripcionAlergia => _descripcionAlergia ?? '';
  set descripcionAlergia(String? val) => _descripcionAlergia = val;

  bool hasDescripcionAlergia() => _descripcionAlergia != null;

  static AlergiasStruct fromMap(Map<String, dynamic> data) => AlergiasStruct(
        orderID: castToType<int>(data['orderID']),
        nombreAlergia: data['nombreAlergia'] as String?,
        descripcionAlergia: data['descripcionAlergia'] as String?,
      );

  static AlergiasStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlergiasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'orderID': _orderID,
        'nombreAlergia': _nombreAlergia,
        'descripcionAlergia': _descripcionAlergia,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderID': serializeParam(
          _orderID,
          ParamType.int,
        ),
        'nombreAlergia': serializeParam(
          _nombreAlergia,
          ParamType.String,
        ),
        'descripcionAlergia': serializeParam(
          _descripcionAlergia,
          ParamType.String,
        ),
      }.withoutNulls;

  static AlergiasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlergiasStruct(
        orderID: deserializeParam(
          data['orderID'],
          ParamType.int,
          false,
        ),
        nombreAlergia: deserializeParam(
          data['nombreAlergia'],
          ParamType.String,
          false,
        ),
        descripcionAlergia: deserializeParam(
          data['descripcionAlergia'],
          ParamType.String,
          false,
        ),
      );

  static AlergiasStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AlergiasStruct(
        orderID: convertAlgoliaParam(
          data['orderID'],
          ParamType.int,
          false,
        ),
        nombreAlergia: convertAlgoliaParam(
          data['nombreAlergia'],
          ParamType.String,
          false,
        ),
        descripcionAlergia: convertAlgoliaParam(
          data['descripcionAlergia'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AlergiasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlergiasStruct &&
        orderID == other.orderID &&
        nombreAlergia == other.nombreAlergia &&
        descripcionAlergia == other.descripcionAlergia;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([orderID, nombreAlergia, descripcionAlergia]);
}

AlergiasStruct createAlergiasStruct({
  int? orderID,
  String? nombreAlergia,
  String? descripcionAlergia,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlergiasStruct(
      orderID: orderID,
      nombreAlergia: nombreAlergia,
      descripcionAlergia: descripcionAlergia,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlergiasStruct? updateAlergiasStruct(
  AlergiasStruct? alergias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    alergias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlergiasStructData(
  Map<String, dynamic> firestoreData,
  AlergiasStruct? alergias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (alergias == null) {
    return;
  }
  if (alergias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && alergias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final alergiasData = getAlergiasFirestoreData(alergias, forFieldValue);
  final nestedData = alergiasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = alergias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlergiasFirestoreData(
  AlergiasStruct? alergias, [
  bool forFieldValue = false,
]) {
  if (alergias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(alergias.toMap());

  // Add any Firestore field values
  alergias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlergiasListFirestoreData(
  List<AlergiasStruct>? alergiass,
) =>
    alergiass?.map((e) => getAlergiasFirestoreData(e, true)).toList() ?? [];
