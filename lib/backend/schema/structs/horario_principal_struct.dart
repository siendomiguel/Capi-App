// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorarioPrincipalStruct extends FFFirebaseStruct {
  HorarioPrincipalStruct({
    String? diaSemana,
    List<HorasTurnosStruct>? turnos,
    bool? habilitado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _diaSemana = diaSemana,
        _turnos = turnos,
        _habilitado = habilitado,
        super(firestoreUtilData);

  // "diaSemana" field.
  String? _diaSemana;
  String get diaSemana => _diaSemana ?? '';
  set diaSemana(String? val) => _diaSemana = val;

  bool hasDiaSemana() => _diaSemana != null;

  // "turnos" field.
  List<HorasTurnosStruct>? _turnos;
  List<HorasTurnosStruct> get turnos => _turnos ?? const [];
  set turnos(List<HorasTurnosStruct>? val) => _turnos = val;

  void updateTurnos(Function(List<HorasTurnosStruct>) updateFn) {
    updateFn(_turnos ??= []);
  }

  bool hasTurnos() => _turnos != null;

  // "habilitado" field.
  bool? _habilitado;
  bool get habilitado => _habilitado ?? false;
  set habilitado(bool? val) => _habilitado = val;

  bool hasHabilitado() => _habilitado != null;

  static HorarioPrincipalStruct fromMap(Map<String, dynamic> data) =>
      HorarioPrincipalStruct(
        diaSemana: data['diaSemana'] as String?,
        turnos: getStructList(
          data['turnos'],
          HorasTurnosStruct.fromMap,
        ),
        habilitado: data['habilitado'] as bool?,
      );

  static HorarioPrincipalStruct? maybeFromMap(dynamic data) => data is Map
      ? HorarioPrincipalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'diaSemana': _diaSemana,
        'turnos': _turnos?.map((e) => e.toMap()).toList(),
        'habilitado': _habilitado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diaSemana': serializeParam(
          _diaSemana,
          ParamType.String,
        ),
        'turnos': serializeParam(
          _turnos,
          ParamType.DataStruct,
          isList: true,
        ),
        'habilitado': serializeParam(
          _habilitado,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HorarioPrincipalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HorarioPrincipalStruct(
        diaSemana: deserializeParam(
          data['diaSemana'],
          ParamType.String,
          false,
        ),
        turnos: deserializeStructParam<HorasTurnosStruct>(
          data['turnos'],
          ParamType.DataStruct,
          true,
          structBuilder: HorasTurnosStruct.fromSerializableMap,
        ),
        habilitado: deserializeParam(
          data['habilitado'],
          ParamType.bool,
          false,
        ),
      );

  static HorarioPrincipalStruct fromAlgoliaData(Map<String, dynamic> data) =>
      HorarioPrincipalStruct(
        diaSemana: convertAlgoliaParam(
          data['diaSemana'],
          ParamType.String,
          false,
        ),
        turnos: convertAlgoliaParam<HorasTurnosStruct>(
          data['turnos'],
          ParamType.DataStruct,
          true,
          structBuilder: HorasTurnosStruct.fromAlgoliaData,
        ),
        habilitado: convertAlgoliaParam(
          data['habilitado'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'HorarioPrincipalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HorarioPrincipalStruct &&
        diaSemana == other.diaSemana &&
        listEquality.equals(turnos, other.turnos) &&
        habilitado == other.habilitado;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([diaSemana, turnos, habilitado]);
}

HorarioPrincipalStruct createHorarioPrincipalStruct({
  String? diaSemana,
  bool? habilitado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HorarioPrincipalStruct(
      diaSemana: diaSemana,
      habilitado: habilitado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HorarioPrincipalStruct? updateHorarioPrincipalStruct(
  HorarioPrincipalStruct? horarioPrincipal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    horarioPrincipal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHorarioPrincipalStructData(
  Map<String, dynamic> firestoreData,
  HorarioPrincipalStruct? horarioPrincipal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (horarioPrincipal == null) {
    return;
  }
  if (horarioPrincipal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && horarioPrincipal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final horarioPrincipalData =
      getHorarioPrincipalFirestoreData(horarioPrincipal, forFieldValue);
  final nestedData =
      horarioPrincipalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = horarioPrincipal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHorarioPrincipalFirestoreData(
  HorarioPrincipalStruct? horarioPrincipal, [
  bool forFieldValue = false,
]) {
  if (horarioPrincipal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(horarioPrincipal.toMap());

  // Add any Firestore field values
  horarioPrincipal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHorarioPrincipalListFirestoreData(
  List<HorarioPrincipalStruct>? horarioPrincipals,
) =>
    horarioPrincipals
        ?.map((e) => getHorarioPrincipalFirestoreData(e, true))
        .toList() ??
    [];
