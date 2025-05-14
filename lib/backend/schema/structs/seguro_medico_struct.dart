// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SeguroMedicoStruct extends FFFirebaseStruct {
  SeguroMedicoStruct({
    bool? tieneSeguro,
    String? tipoSeguro,
    String? aseguradora,
    String? tipoPoliza,
    String? numPoliza,
    DateTime? fechaVencePoliza,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tieneSeguro = tieneSeguro,
        _tipoSeguro = tipoSeguro,
        _aseguradora = aseguradora,
        _tipoPoliza = tipoPoliza,
        _numPoliza = numPoliza,
        _fechaVencePoliza = fechaVencePoliza,
        super(firestoreUtilData);

  // "tieneSeguro" field.
  bool? _tieneSeguro;
  bool get tieneSeguro => _tieneSeguro ?? false;
  set tieneSeguro(bool? val) => _tieneSeguro = val;

  bool hasTieneSeguro() => _tieneSeguro != null;

  // "tipoSeguro" field.
  String? _tipoSeguro;
  String get tipoSeguro => _tipoSeguro ?? '';
  set tipoSeguro(String? val) => _tipoSeguro = val;

  bool hasTipoSeguro() => _tipoSeguro != null;

  // "aseguradora" field.
  String? _aseguradora;
  String get aseguradora => _aseguradora ?? '';
  set aseguradora(String? val) => _aseguradora = val;

  bool hasAseguradora() => _aseguradora != null;

  // "tipoPoliza" field.
  String? _tipoPoliza;
  String get tipoPoliza => _tipoPoliza ?? '';
  set tipoPoliza(String? val) => _tipoPoliza = val;

  bool hasTipoPoliza() => _tipoPoliza != null;

  // "numPoliza" field.
  String? _numPoliza;
  String get numPoliza => _numPoliza ?? '';
  set numPoliza(String? val) => _numPoliza = val;

  bool hasNumPoliza() => _numPoliza != null;

  // "fechaVencePoliza" field.
  DateTime? _fechaVencePoliza;
  DateTime? get fechaVencePoliza => _fechaVencePoliza;
  set fechaVencePoliza(DateTime? val) => _fechaVencePoliza = val;

  bool hasFechaVencePoliza() => _fechaVencePoliza != null;

  static SeguroMedicoStruct fromMap(Map<String, dynamic> data) =>
      SeguroMedicoStruct(
        tieneSeguro: data['tieneSeguro'] as bool?,
        tipoSeguro: data['tipoSeguro'] as String?,
        aseguradora: data['aseguradora'] as String?,
        tipoPoliza: data['tipoPoliza'] as String?,
        numPoliza: data['numPoliza'] as String?,
        fechaVencePoliza: data['fechaVencePoliza'] as DateTime?,
      );

  static SeguroMedicoStruct? maybeFromMap(dynamic data) => data is Map
      ? SeguroMedicoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tieneSeguro': _tieneSeguro,
        'tipoSeguro': _tipoSeguro,
        'aseguradora': _aseguradora,
        'tipoPoliza': _tipoPoliza,
        'numPoliza': _numPoliza,
        'fechaVencePoliza': _fechaVencePoliza,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tieneSeguro': serializeParam(
          _tieneSeguro,
          ParamType.bool,
        ),
        'tipoSeguro': serializeParam(
          _tipoSeguro,
          ParamType.String,
        ),
        'aseguradora': serializeParam(
          _aseguradora,
          ParamType.String,
        ),
        'tipoPoliza': serializeParam(
          _tipoPoliza,
          ParamType.String,
        ),
        'numPoliza': serializeParam(
          _numPoliza,
          ParamType.String,
        ),
        'fechaVencePoliza': serializeParam(
          _fechaVencePoliza,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SeguroMedicoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SeguroMedicoStruct(
        tieneSeguro: deserializeParam(
          data['tieneSeguro'],
          ParamType.bool,
          false,
        ),
        tipoSeguro: deserializeParam(
          data['tipoSeguro'],
          ParamType.String,
          false,
        ),
        aseguradora: deserializeParam(
          data['aseguradora'],
          ParamType.String,
          false,
        ),
        tipoPoliza: deserializeParam(
          data['tipoPoliza'],
          ParamType.String,
          false,
        ),
        numPoliza: deserializeParam(
          data['numPoliza'],
          ParamType.String,
          false,
        ),
        fechaVencePoliza: deserializeParam(
          data['fechaVencePoliza'],
          ParamType.DateTime,
          false,
        ),
      );

  static SeguroMedicoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SeguroMedicoStruct(
        tieneSeguro: convertAlgoliaParam(
          data['tieneSeguro'],
          ParamType.bool,
          false,
        ),
        tipoSeguro: convertAlgoliaParam(
          data['tipoSeguro'],
          ParamType.String,
          false,
        ),
        aseguradora: convertAlgoliaParam(
          data['aseguradora'],
          ParamType.String,
          false,
        ),
        tipoPoliza: convertAlgoliaParam(
          data['tipoPoliza'],
          ParamType.String,
          false,
        ),
        numPoliza: convertAlgoliaParam(
          data['numPoliza'],
          ParamType.String,
          false,
        ),
        fechaVencePoliza: convertAlgoliaParam(
          data['fechaVencePoliza'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SeguroMedicoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeguroMedicoStruct &&
        tieneSeguro == other.tieneSeguro &&
        tipoSeguro == other.tipoSeguro &&
        aseguradora == other.aseguradora &&
        tipoPoliza == other.tipoPoliza &&
        numPoliza == other.numPoliza &&
        fechaVencePoliza == other.fechaVencePoliza;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tieneSeguro,
        tipoSeguro,
        aseguradora,
        tipoPoliza,
        numPoliza,
        fechaVencePoliza
      ]);
}

SeguroMedicoStruct createSeguroMedicoStruct({
  bool? tieneSeguro,
  String? tipoSeguro,
  String? aseguradora,
  String? tipoPoliza,
  String? numPoliza,
  DateTime? fechaVencePoliza,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SeguroMedicoStruct(
      tieneSeguro: tieneSeguro,
      tipoSeguro: tipoSeguro,
      aseguradora: aseguradora,
      tipoPoliza: tipoPoliza,
      numPoliza: numPoliza,
      fechaVencePoliza: fechaVencePoliza,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SeguroMedicoStruct? updateSeguroMedicoStruct(
  SeguroMedicoStruct? seguroMedico, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    seguroMedico
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSeguroMedicoStructData(
  Map<String, dynamic> firestoreData,
  SeguroMedicoStruct? seguroMedico,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (seguroMedico == null) {
    return;
  }
  if (seguroMedico.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && seguroMedico.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final seguroMedicoData =
      getSeguroMedicoFirestoreData(seguroMedico, forFieldValue);
  final nestedData =
      seguroMedicoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = seguroMedico.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSeguroMedicoFirestoreData(
  SeguroMedicoStruct? seguroMedico, [
  bool forFieldValue = false,
]) {
  if (seguroMedico == null) {
    return {};
  }
  final firestoreData = mapToFirestore(seguroMedico.toMap());

  // Add any Firestore field values
  seguroMedico.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSeguroMedicoListFirestoreData(
  List<SeguroMedicoStruct>? seguroMedicos,
) =>
    seguroMedicos?.map((e) => getSeguroMedicoFirestoreData(e, true)).toList() ??
    [];
