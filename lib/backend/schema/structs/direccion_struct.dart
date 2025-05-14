// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DireccionStruct extends FFFirebaseStruct {
  DireccionStruct({
    String? callePrincipal,
    String? calleSecundaria,
    String? pais,
    String? estado,
    String? ciudad,
    String? codigoZip,
    LatLng? direccionLatLong,
    String? tipoVivienda,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _callePrincipal = callePrincipal,
        _calleSecundaria = calleSecundaria,
        _pais = pais,
        _estado = estado,
        _ciudad = ciudad,
        _codigoZip = codigoZip,
        _direccionLatLong = direccionLatLong,
        _tipoVivienda = tipoVivienda,
        super(firestoreUtilData);

  // "callePrincipal" field.
  String? _callePrincipal;
  String get callePrincipal => _callePrincipal ?? '';
  set callePrincipal(String? val) => _callePrincipal = val;

  bool hasCallePrincipal() => _callePrincipal != null;

  // "calleSecundaria" field.
  String? _calleSecundaria;
  String get calleSecundaria => _calleSecundaria ?? '';
  set calleSecundaria(String? val) => _calleSecundaria = val;

  bool hasCalleSecundaria() => _calleSecundaria != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  set pais(String? val) => _pais = val;

  bool hasPais() => _pais != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  set ciudad(String? val) => _ciudad = val;

  bool hasCiudad() => _ciudad != null;

  // "codigo_zip" field.
  String? _codigoZip;
  String get codigoZip => _codigoZip ?? '';
  set codigoZip(String? val) => _codigoZip = val;

  bool hasCodigoZip() => _codigoZip != null;

  // "direccion_LatLong" field.
  LatLng? _direccionLatLong;
  LatLng? get direccionLatLong => _direccionLatLong;
  set direccionLatLong(LatLng? val) => _direccionLatLong = val;

  bool hasDireccionLatLong() => _direccionLatLong != null;

  // "tipoVivienda" field.
  String? _tipoVivienda;
  String get tipoVivienda => _tipoVivienda ?? '';
  set tipoVivienda(String? val) => _tipoVivienda = val;

  bool hasTipoVivienda() => _tipoVivienda != null;

  static DireccionStruct fromMap(Map<String, dynamic> data) => DireccionStruct(
        callePrincipal: data['callePrincipal'] as String?,
        calleSecundaria: data['calleSecundaria'] as String?,
        pais: data['pais'] as String?,
        estado: data['estado'] as String?,
        ciudad: data['ciudad'] as String?,
        codigoZip: data['codigo_zip'] as String?,
        direccionLatLong: data['direccion_LatLong'] as LatLng?,
        tipoVivienda: data['tipoVivienda'] as String?,
      );

  static DireccionStruct? maybeFromMap(dynamic data) => data is Map
      ? DireccionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'callePrincipal': _callePrincipal,
        'calleSecundaria': _calleSecundaria,
        'pais': _pais,
        'estado': _estado,
        'ciudad': _ciudad,
        'codigo_zip': _codigoZip,
        'direccion_LatLong': _direccionLatLong,
        'tipoVivienda': _tipoVivienda,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'callePrincipal': serializeParam(
          _callePrincipal,
          ParamType.String,
        ),
        'calleSecundaria': serializeParam(
          _calleSecundaria,
          ParamType.String,
        ),
        'pais': serializeParam(
          _pais,
          ParamType.String,
        ),
        'estado': serializeParam(
          _estado,
          ParamType.String,
        ),
        'ciudad': serializeParam(
          _ciudad,
          ParamType.String,
        ),
        'codigo_zip': serializeParam(
          _codigoZip,
          ParamType.String,
        ),
        'direccion_LatLong': serializeParam(
          _direccionLatLong,
          ParamType.LatLng,
        ),
        'tipoVivienda': serializeParam(
          _tipoVivienda,
          ParamType.String,
        ),
      }.withoutNulls;

  static DireccionStruct fromSerializableMap(Map<String, dynamic> data) =>
      DireccionStruct(
        callePrincipal: deserializeParam(
          data['callePrincipal'],
          ParamType.String,
          false,
        ),
        calleSecundaria: deserializeParam(
          data['calleSecundaria'],
          ParamType.String,
          false,
        ),
        pais: deserializeParam(
          data['pais'],
          ParamType.String,
          false,
        ),
        estado: deserializeParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        ciudad: deserializeParam(
          data['ciudad'],
          ParamType.String,
          false,
        ),
        codigoZip: deserializeParam(
          data['codigo_zip'],
          ParamType.String,
          false,
        ),
        direccionLatLong: deserializeParam(
          data['direccion_LatLong'],
          ParamType.LatLng,
          false,
        ),
        tipoVivienda: deserializeParam(
          data['tipoVivienda'],
          ParamType.String,
          false,
        ),
      );

  static DireccionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DireccionStruct(
        callePrincipal: convertAlgoliaParam(
          data['callePrincipal'],
          ParamType.String,
          false,
        ),
        calleSecundaria: convertAlgoliaParam(
          data['calleSecundaria'],
          ParamType.String,
          false,
        ),
        pais: convertAlgoliaParam(
          data['pais'],
          ParamType.String,
          false,
        ),
        estado: convertAlgoliaParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        ciudad: convertAlgoliaParam(
          data['ciudad'],
          ParamType.String,
          false,
        ),
        codigoZip: convertAlgoliaParam(
          data['codigo_zip'],
          ParamType.String,
          false,
        ),
        direccionLatLong: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        tipoVivienda: convertAlgoliaParam(
          data['tipoVivienda'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DireccionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DireccionStruct &&
        callePrincipal == other.callePrincipal &&
        calleSecundaria == other.calleSecundaria &&
        pais == other.pais &&
        estado == other.estado &&
        ciudad == other.ciudad &&
        codigoZip == other.codigoZip &&
        direccionLatLong == other.direccionLatLong &&
        tipoVivienda == other.tipoVivienda;
  }

  @override
  int get hashCode => const ListEquality().hash([
        callePrincipal,
        calleSecundaria,
        pais,
        estado,
        ciudad,
        codigoZip,
        direccionLatLong,
        tipoVivienda
      ]);
}

DireccionStruct createDireccionStruct({
  String? callePrincipal,
  String? calleSecundaria,
  String? pais,
  String? estado,
  String? ciudad,
  String? codigoZip,
  LatLng? direccionLatLong,
  String? tipoVivienda,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DireccionStruct(
      callePrincipal: callePrincipal,
      calleSecundaria: calleSecundaria,
      pais: pais,
      estado: estado,
      ciudad: ciudad,
      codigoZip: codigoZip,
      direccionLatLong: direccionLatLong,
      tipoVivienda: tipoVivienda,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DireccionStruct? updateDireccionStruct(
  DireccionStruct? direccion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    direccion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDireccionStructData(
  Map<String, dynamic> firestoreData,
  DireccionStruct? direccion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (direccion == null) {
    return;
  }
  if (direccion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && direccion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final direccionData = getDireccionFirestoreData(direccion, forFieldValue);
  final nestedData = direccionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = direccion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDireccionFirestoreData(
  DireccionStruct? direccion, [
  bool forFieldValue = false,
]) {
  if (direccion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(direccion.toMap());

  // Add any Firestore field values
  direccion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDireccionListFirestoreData(
  List<DireccionStruct>? direccions,
) =>
    direccions?.map((e) => getDireccionFirestoreData(e, true)).toList() ?? [];
