// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvailabilityStruct extends FFFirebaseStruct {
  AvailabilityStruct({
    String? dayofWeek,
    DateTime? startTime,
    DateTime? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dayofWeek = dayofWeek,
        _startTime = startTime,
        _endTime = endTime,
        super(firestoreUtilData);

  // "dayofWeek" field.
  String? _dayofWeek;
  String get dayofWeek => _dayofWeek ?? '';
  set dayofWeek(String? val) => _dayofWeek = val;

  bool hasDayofWeek() => _dayofWeek != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  static AvailabilityStruct fromMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        dayofWeek: data['dayofWeek'] as String?,
        startTime: data['startTime'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
      );

  static AvailabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dayofWeek': _dayofWeek,
        'startTime': _startTime,
        'endTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayofWeek': serializeParam(
          _dayofWeek,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AvailabilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        dayofWeek: deserializeParam(
          data['dayofWeek'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
      );

  static AvailabilityStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AvailabilityStruct(
        dayofWeek: convertAlgoliaParam(
          data['dayofWeek'],
          ParamType.String,
          false,
        ),
        startTime: convertAlgoliaParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: convertAlgoliaParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailabilityStruct &&
        dayofWeek == other.dayofWeek &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dayofWeek, startTime, endTime]);
}

AvailabilityStruct createAvailabilityStruct({
  String? dayofWeek,
  DateTime? startTime,
  DateTime? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailabilityStruct(
      dayofWeek: dayofWeek,
      startTime: startTime,
      endTime: endTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailabilityStruct? updateAvailabilityStruct(
  AvailabilityStruct? availability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailabilityStructData(
  Map<String, dynamic> firestoreData,
  AvailabilityStruct? availability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availability == null) {
    return;
  }
  if (availability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availabilityData =
      getAvailabilityFirestoreData(availability, forFieldValue);
  final nestedData =
      availabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailabilityFirestoreData(
  AvailabilityStruct? availability, [
  bool forFieldValue = false,
]) {
  if (availability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availability.toMap());

  // Add any Firestore field values
  availability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailabilityListFirestoreData(
  List<AvailabilityStruct>? availabilitys,
) =>
    availabilitys?.map((e) => getAvailabilityFirestoreData(e, true)).toList() ??
    [];
