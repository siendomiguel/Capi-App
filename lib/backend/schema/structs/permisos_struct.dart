// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PermisosStruct extends FFFirebaseStruct {
  PermisosStruct({
    bool? confStripe,
    bool? confZoom,
    bool? verConsultas,
    bool? verHorarios,
    bool? verConfig,
    bool? verMensajes,
    bool? verCalendario,
    bool? editarCalendario,
    bool? verCitas,
    bool? editarCitas,
    bool? verPacientes,
    bool? editarPacientes,
    bool? agregarServicios,
    bool? agregarEquipos,
    bool? horarios,
    bool? permisos,
    bool? todos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _confStripe = confStripe,
        _confZoom = confZoom,
        _verConsultas = verConsultas,
        _verHorarios = verHorarios,
        _verConfig = verConfig,
        _verMensajes = verMensajes,
        _verCalendario = verCalendario,
        _editarCalendario = editarCalendario,
        _verCitas = verCitas,
        _editarCitas = editarCitas,
        _verPacientes = verPacientes,
        _editarPacientes = editarPacientes,
        _agregarServicios = agregarServicios,
        _agregarEquipos = agregarEquipos,
        _horarios = horarios,
        _permisos = permisos,
        _todos = todos,
        super(firestoreUtilData);

  // "conf_Stripe" field.
  bool? _confStripe;
  bool get confStripe => _confStripe ?? false;
  set confStripe(bool? val) => _confStripe = val;

  bool hasConfStripe() => _confStripe != null;

  // "conf_Zoom" field.
  bool? _confZoom;
  bool get confZoom => _confZoom ?? false;
  set confZoom(bool? val) => _confZoom = val;

  bool hasConfZoom() => _confZoom != null;

  // "verConsultas" field.
  bool? _verConsultas;
  bool get verConsultas => _verConsultas ?? false;
  set verConsultas(bool? val) => _verConsultas = val;

  bool hasVerConsultas() => _verConsultas != null;

  // "verHorarios" field.
  bool? _verHorarios;
  bool get verHorarios => _verHorarios ?? false;
  set verHorarios(bool? val) => _verHorarios = val;

  bool hasVerHorarios() => _verHorarios != null;

  // "verConfig" field.
  bool? _verConfig;
  bool get verConfig => _verConfig ?? false;
  set verConfig(bool? val) => _verConfig = val;

  bool hasVerConfig() => _verConfig != null;

  // "verMensajes" field.
  bool? _verMensajes;
  bool get verMensajes => _verMensajes ?? false;
  set verMensajes(bool? val) => _verMensajes = val;

  bool hasVerMensajes() => _verMensajes != null;

  // "verCalendario" field.
  bool? _verCalendario;
  bool get verCalendario => _verCalendario ?? false;
  set verCalendario(bool? val) => _verCalendario = val;

  bool hasVerCalendario() => _verCalendario != null;

  // "editarCalendario" field.
  bool? _editarCalendario;
  bool get editarCalendario => _editarCalendario ?? false;
  set editarCalendario(bool? val) => _editarCalendario = val;

  bool hasEditarCalendario() => _editarCalendario != null;

  // "verCitas" field.
  bool? _verCitas;
  bool get verCitas => _verCitas ?? false;
  set verCitas(bool? val) => _verCitas = val;

  bool hasVerCitas() => _verCitas != null;

  // "editarCitas" field.
  bool? _editarCitas;
  bool get editarCitas => _editarCitas ?? false;
  set editarCitas(bool? val) => _editarCitas = val;

  bool hasEditarCitas() => _editarCitas != null;

  // "verPacientes" field.
  bool? _verPacientes;
  bool get verPacientes => _verPacientes ?? false;
  set verPacientes(bool? val) => _verPacientes = val;

  bool hasVerPacientes() => _verPacientes != null;

  // "editarPacientes" field.
  bool? _editarPacientes;
  bool get editarPacientes => _editarPacientes ?? false;
  set editarPacientes(bool? val) => _editarPacientes = val;

  bool hasEditarPacientes() => _editarPacientes != null;

  // "agregarServicios" field.
  bool? _agregarServicios;
  bool get agregarServicios => _agregarServicios ?? false;
  set agregarServicios(bool? val) => _agregarServicios = val;

  bool hasAgregarServicios() => _agregarServicios != null;

  // "agregarEquipos" field.
  bool? _agregarEquipos;
  bool get agregarEquipos => _agregarEquipos ?? false;
  set agregarEquipos(bool? val) => _agregarEquipos = val;

  bool hasAgregarEquipos() => _agregarEquipos != null;

  // "horarios" field.
  bool? _horarios;
  bool get horarios => _horarios ?? false;
  set horarios(bool? val) => _horarios = val;

  bool hasHorarios() => _horarios != null;

  // "permisos" field.
  bool? _permisos;
  bool get permisos => _permisos ?? false;
  set permisos(bool? val) => _permisos = val;

  bool hasPermisos() => _permisos != null;

  // "todos" field.
  bool? _todos;
  bool get todos => _todos ?? false;
  set todos(bool? val) => _todos = val;

  bool hasTodos() => _todos != null;

  static PermisosStruct fromMap(Map<String, dynamic> data) => PermisosStruct(
        confStripe: data['conf_Stripe'] as bool?,
        confZoom: data['conf_Zoom'] as bool?,
        verConsultas: data['verConsultas'] as bool?,
        verHorarios: data['verHorarios'] as bool?,
        verConfig: data['verConfig'] as bool?,
        verMensajes: data['verMensajes'] as bool?,
        verCalendario: data['verCalendario'] as bool?,
        editarCalendario: data['editarCalendario'] as bool?,
        verCitas: data['verCitas'] as bool?,
        editarCitas: data['editarCitas'] as bool?,
        verPacientes: data['verPacientes'] as bool?,
        editarPacientes: data['editarPacientes'] as bool?,
        agregarServicios: data['agregarServicios'] as bool?,
        agregarEquipos: data['agregarEquipos'] as bool?,
        horarios: data['horarios'] as bool?,
        permisos: data['permisos'] as bool?,
        todos: data['todos'] as bool?,
      );

  static PermisosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PermisosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'conf_Stripe': _confStripe,
        'conf_Zoom': _confZoom,
        'verConsultas': _verConsultas,
        'verHorarios': _verHorarios,
        'verConfig': _verConfig,
        'verMensajes': _verMensajes,
        'verCalendario': _verCalendario,
        'editarCalendario': _editarCalendario,
        'verCitas': _verCitas,
        'editarCitas': _editarCitas,
        'verPacientes': _verPacientes,
        'editarPacientes': _editarPacientes,
        'agregarServicios': _agregarServicios,
        'agregarEquipos': _agregarEquipos,
        'horarios': _horarios,
        'permisos': _permisos,
        'todos': _todos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'conf_Stripe': serializeParam(
          _confStripe,
          ParamType.bool,
        ),
        'conf_Zoom': serializeParam(
          _confZoom,
          ParamType.bool,
        ),
        'verConsultas': serializeParam(
          _verConsultas,
          ParamType.bool,
        ),
        'verHorarios': serializeParam(
          _verHorarios,
          ParamType.bool,
        ),
        'verConfig': serializeParam(
          _verConfig,
          ParamType.bool,
        ),
        'verMensajes': serializeParam(
          _verMensajes,
          ParamType.bool,
        ),
        'verCalendario': serializeParam(
          _verCalendario,
          ParamType.bool,
        ),
        'editarCalendario': serializeParam(
          _editarCalendario,
          ParamType.bool,
        ),
        'verCitas': serializeParam(
          _verCitas,
          ParamType.bool,
        ),
        'editarCitas': serializeParam(
          _editarCitas,
          ParamType.bool,
        ),
        'verPacientes': serializeParam(
          _verPacientes,
          ParamType.bool,
        ),
        'editarPacientes': serializeParam(
          _editarPacientes,
          ParamType.bool,
        ),
        'agregarServicios': serializeParam(
          _agregarServicios,
          ParamType.bool,
        ),
        'agregarEquipos': serializeParam(
          _agregarEquipos,
          ParamType.bool,
        ),
        'horarios': serializeParam(
          _horarios,
          ParamType.bool,
        ),
        'permisos': serializeParam(
          _permisos,
          ParamType.bool,
        ),
        'todos': serializeParam(
          _todos,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PermisosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PermisosStruct(
        confStripe: deserializeParam(
          data['conf_Stripe'],
          ParamType.bool,
          false,
        ),
        confZoom: deserializeParam(
          data['conf_Zoom'],
          ParamType.bool,
          false,
        ),
        verConsultas: deserializeParam(
          data['verConsultas'],
          ParamType.bool,
          false,
        ),
        verHorarios: deserializeParam(
          data['verHorarios'],
          ParamType.bool,
          false,
        ),
        verConfig: deserializeParam(
          data['verConfig'],
          ParamType.bool,
          false,
        ),
        verMensajes: deserializeParam(
          data['verMensajes'],
          ParamType.bool,
          false,
        ),
        verCalendario: deserializeParam(
          data['verCalendario'],
          ParamType.bool,
          false,
        ),
        editarCalendario: deserializeParam(
          data['editarCalendario'],
          ParamType.bool,
          false,
        ),
        verCitas: deserializeParam(
          data['verCitas'],
          ParamType.bool,
          false,
        ),
        editarCitas: deserializeParam(
          data['editarCitas'],
          ParamType.bool,
          false,
        ),
        verPacientes: deserializeParam(
          data['verPacientes'],
          ParamType.bool,
          false,
        ),
        editarPacientes: deserializeParam(
          data['editarPacientes'],
          ParamType.bool,
          false,
        ),
        agregarServicios: deserializeParam(
          data['agregarServicios'],
          ParamType.bool,
          false,
        ),
        agregarEquipos: deserializeParam(
          data['agregarEquipos'],
          ParamType.bool,
          false,
        ),
        horarios: deserializeParam(
          data['horarios'],
          ParamType.bool,
          false,
        ),
        permisos: deserializeParam(
          data['permisos'],
          ParamType.bool,
          false,
        ),
        todos: deserializeParam(
          data['todos'],
          ParamType.bool,
          false,
        ),
      );

  static PermisosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PermisosStruct(
        confStripe: convertAlgoliaParam(
          data['conf_Stripe'],
          ParamType.bool,
          false,
        ),
        confZoom: convertAlgoliaParam(
          data['conf_Zoom'],
          ParamType.bool,
          false,
        ),
        verConsultas: convertAlgoliaParam(
          data['verConsultas'],
          ParamType.bool,
          false,
        ),
        verHorarios: convertAlgoliaParam(
          data['verHorarios'],
          ParamType.bool,
          false,
        ),
        verConfig: convertAlgoliaParam(
          data['verConfig'],
          ParamType.bool,
          false,
        ),
        verMensajes: convertAlgoliaParam(
          data['verMensajes'],
          ParamType.bool,
          false,
        ),
        verCalendario: convertAlgoliaParam(
          data['verCalendario'],
          ParamType.bool,
          false,
        ),
        editarCalendario: convertAlgoliaParam(
          data['editarCalendario'],
          ParamType.bool,
          false,
        ),
        verCitas: convertAlgoliaParam(
          data['verCitas'],
          ParamType.bool,
          false,
        ),
        editarCitas: convertAlgoliaParam(
          data['editarCitas'],
          ParamType.bool,
          false,
        ),
        verPacientes: convertAlgoliaParam(
          data['verPacientes'],
          ParamType.bool,
          false,
        ),
        editarPacientes: convertAlgoliaParam(
          data['editarPacientes'],
          ParamType.bool,
          false,
        ),
        agregarServicios: convertAlgoliaParam(
          data['agregarServicios'],
          ParamType.bool,
          false,
        ),
        agregarEquipos: convertAlgoliaParam(
          data['agregarEquipos'],
          ParamType.bool,
          false,
        ),
        horarios: convertAlgoliaParam(
          data['horarios'],
          ParamType.bool,
          false,
        ),
        permisos: convertAlgoliaParam(
          data['permisos'],
          ParamType.bool,
          false,
        ),
        todos: convertAlgoliaParam(
          data['todos'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PermisosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PermisosStruct &&
        confStripe == other.confStripe &&
        confZoom == other.confZoom &&
        verConsultas == other.verConsultas &&
        verHorarios == other.verHorarios &&
        verConfig == other.verConfig &&
        verMensajes == other.verMensajes &&
        verCalendario == other.verCalendario &&
        editarCalendario == other.editarCalendario &&
        verCitas == other.verCitas &&
        editarCitas == other.editarCitas &&
        verPacientes == other.verPacientes &&
        editarPacientes == other.editarPacientes &&
        agregarServicios == other.agregarServicios &&
        agregarEquipos == other.agregarEquipos &&
        horarios == other.horarios &&
        permisos == other.permisos &&
        todos == other.todos;
  }

  @override
  int get hashCode => const ListEquality().hash([
        confStripe,
        confZoom,
        verConsultas,
        verHorarios,
        verConfig,
        verMensajes,
        verCalendario,
        editarCalendario,
        verCitas,
        editarCitas,
        verPacientes,
        editarPacientes,
        agregarServicios,
        agregarEquipos,
        horarios,
        permisos,
        todos
      ]);
}

PermisosStruct createPermisosStruct({
  bool? confStripe,
  bool? confZoom,
  bool? verConsultas,
  bool? verHorarios,
  bool? verConfig,
  bool? verMensajes,
  bool? verCalendario,
  bool? editarCalendario,
  bool? verCitas,
  bool? editarCitas,
  bool? verPacientes,
  bool? editarPacientes,
  bool? agregarServicios,
  bool? agregarEquipos,
  bool? horarios,
  bool? permisos,
  bool? todos,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PermisosStruct(
      confStripe: confStripe,
      confZoom: confZoom,
      verConsultas: verConsultas,
      verHorarios: verHorarios,
      verConfig: verConfig,
      verMensajes: verMensajes,
      verCalendario: verCalendario,
      editarCalendario: editarCalendario,
      verCitas: verCitas,
      editarCitas: editarCitas,
      verPacientes: verPacientes,
      editarPacientes: editarPacientes,
      agregarServicios: agregarServicios,
      agregarEquipos: agregarEquipos,
      horarios: horarios,
      permisos: permisos,
      todos: todos,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PermisosStruct? updatePermisosStruct(
  PermisosStruct? permisosStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    permisosStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPermisosStructData(
  Map<String, dynamic> firestoreData,
  PermisosStruct? permisosStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (permisosStruct == null) {
    return;
  }
  if (permisosStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && permisosStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final permisosStructData =
      getPermisosFirestoreData(permisosStruct, forFieldValue);
  final nestedData =
      permisosStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = permisosStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPermisosFirestoreData(
  PermisosStruct? permisosStruct, [
  bool forFieldValue = false,
]) {
  if (permisosStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(permisosStruct.toMap());

  // Add any Firestore field values
  permisosStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPermisosListFirestoreData(
  List<PermisosStruct>? permisosStructs,
) =>
    permisosStructs?.map((e) => getPermisosFirestoreData(e, true)).toList() ??
    [];
