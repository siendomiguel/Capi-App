// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HorasTurnosStruct extends FFFirebaseStruct {
  HorasTurnosStruct({
    String? horaInicio,
    String? horaFin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _horaInicio = horaInicio,
        _horaFin = horaFin,
        super(firestoreUtilData);

  // "horaInicio" field.
  String? _horaInicio;
  String get horaInicio => _horaInicio ?? '';
  set horaInicio(String? val) => _horaInicio = val;

  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  String? _horaFin;
  String get horaFin => _horaFin ?? '';
  set horaFin(String? val) => _horaFin = val;

  bool hasHoraFin() => _horaFin != null;

  static HorasTurnosStruct fromMap(Map<String, dynamic> data) =>
      HorasTurnosStruct(
        horaInicio: data['horaInicio'] as String?,
        horaFin: data['horaFin'] as String?,
      );

  static HorasTurnosStruct? maybeFromMap(dynamic data) => data is Map
      ? HorasTurnosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'horaInicio': _horaInicio,
        'horaFin': _horaFin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'horaInicio': serializeParam(
          _horaInicio,
          ParamType.String,
        ),
        'horaFin': serializeParam(
          _horaFin,
          ParamType.String,
        ),
      }.withoutNulls;

  static HorasTurnosStruct fromSerializableMap(Map<String, dynamic> data) =>
      HorasTurnosStruct(
        horaInicio: deserializeParam(
          data['horaInicio'],
          ParamType.String,
          false,
        ),
        horaFin: deserializeParam(
          data['horaFin'],
          ParamType.String,
          false,
        ),
      );

  static HorasTurnosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      HorasTurnosStruct(
        horaInicio: convertAlgoliaParam(
          data['horaInicio'],
          ParamType.String,
          false,
        ),
        horaFin: convertAlgoliaParam(
          data['horaFin'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'HorasTurnosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HorasTurnosStruct &&
        horaInicio == other.horaInicio &&
        horaFin == other.horaFin;
  }

  @override
  int get hashCode => const ListEquality().hash([horaInicio, horaFin]);
}

HorasTurnosStruct createHorasTurnosStruct({
  String? horaInicio,
  String? horaFin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HorasTurnosStruct(
      horaInicio: horaInicio,
      horaFin: horaFin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HorasTurnosStruct? updateHorasTurnosStruct(
  HorasTurnosStruct? horasTurnos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    horasTurnos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHorasTurnosStructData(
  Map<String, dynamic> firestoreData,
  HorasTurnosStruct? horasTurnos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (horasTurnos == null) {
    return;
  }
  if (horasTurnos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && horasTurnos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final horasTurnosData =
      getHorasTurnosFirestoreData(horasTurnos, forFieldValue);
  final nestedData =
      horasTurnosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = horasTurnos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHorasTurnosFirestoreData(
  HorasTurnosStruct? horasTurnos, [
  bool forFieldValue = false,
]) {
  if (horasTurnos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(horasTurnos.toMap());

  // Add any Firestore field values
  horasTurnos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHorasTurnosListFirestoreData(
  List<HorasTurnosStruct>? horasTurnoss,
) =>
    horasTurnoss?.map((e) => getHorasTurnosFirestoreData(e, true)).toList() ??
    [];
