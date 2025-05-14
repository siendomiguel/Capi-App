// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InfoFamiliarStruct extends FFFirebaseStruct {
  InfoFamiliarStruct({
    String? parentezco,
    String? nombre,
    String? apellido,
    String? celular,
    String? email,
    String? tipoDeSangre,
    DateTime? fechaNacimiento,
    String? numIdentificacion,
    int? orderID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _parentezco = parentezco,
        _nombre = nombre,
        _apellido = apellido,
        _celular = celular,
        _email = email,
        _tipoDeSangre = tipoDeSangre,
        _fechaNacimiento = fechaNacimiento,
        _numIdentificacion = numIdentificacion,
        _orderID = orderID,
        super(firestoreUtilData);

  // "parentezco" field.
  String? _parentezco;
  String get parentezco => _parentezco ?? '';
  set parentezco(String? val) => _parentezco = val;

  bool hasParentezco() => _parentezco != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  set apellido(String? val) => _apellido = val;

  bool hasApellido() => _apellido != null;

  // "celular" field.
  String? _celular;
  String get celular => _celular ?? '';
  set celular(String? val) => _celular = val;

  bool hasCelular() => _celular != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "tipoDeSangre" field.
  String? _tipoDeSangre;
  String get tipoDeSangre => _tipoDeSangre ?? '';
  set tipoDeSangre(String? val) => _tipoDeSangre = val;

  bool hasTipoDeSangre() => _tipoDeSangre != null;

  // "fechaNacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? val) => _fechaNacimiento = val;

  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "numIdentificacion" field.
  String? _numIdentificacion;
  String get numIdentificacion => _numIdentificacion ?? '';
  set numIdentificacion(String? val) => _numIdentificacion = val;

  bool hasNumIdentificacion() => _numIdentificacion != null;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  set orderID(int? val) => _orderID = val;

  void incrementOrderID(int amount) => orderID = orderID + amount;

  bool hasOrderID() => _orderID != null;

  static InfoFamiliarStruct fromMap(Map<String, dynamic> data) =>
      InfoFamiliarStruct(
        parentezco: data['parentezco'] as String?,
        nombre: data['nombre'] as String?,
        apellido: data['apellido'] as String?,
        celular: data['celular'] as String?,
        email: data['email'] as String?,
        tipoDeSangre: data['tipoDeSangre'] as String?,
        fechaNacimiento: data['fechaNacimiento'] as DateTime?,
        numIdentificacion: data['numIdentificacion'] as String?,
        orderID: castToType<int>(data['orderID']),
      );

  static InfoFamiliarStruct? maybeFromMap(dynamic data) => data is Map
      ? InfoFamiliarStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'parentezco': _parentezco,
        'nombre': _nombre,
        'apellido': _apellido,
        'celular': _celular,
        'email': _email,
        'tipoDeSangre': _tipoDeSangre,
        'fechaNacimiento': _fechaNacimiento,
        'numIdentificacion': _numIdentificacion,
        'orderID': _orderID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'parentezco': serializeParam(
          _parentezco,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'apellido': serializeParam(
          _apellido,
          ParamType.String,
        ),
        'celular': serializeParam(
          _celular,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'tipoDeSangre': serializeParam(
          _tipoDeSangre,
          ParamType.String,
        ),
        'fechaNacimiento': serializeParam(
          _fechaNacimiento,
          ParamType.DateTime,
        ),
        'numIdentificacion': serializeParam(
          _numIdentificacion,
          ParamType.String,
        ),
        'orderID': serializeParam(
          _orderID,
          ParamType.int,
        ),
      }.withoutNulls;

  static InfoFamiliarStruct fromSerializableMap(Map<String, dynamic> data) =>
      InfoFamiliarStruct(
        parentezco: deserializeParam(
          data['parentezco'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        apellido: deserializeParam(
          data['apellido'],
          ParamType.String,
          false,
        ),
        celular: deserializeParam(
          data['celular'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        tipoDeSangre: deserializeParam(
          data['tipoDeSangre'],
          ParamType.String,
          false,
        ),
        fechaNacimiento: deserializeParam(
          data['fechaNacimiento'],
          ParamType.DateTime,
          false,
        ),
        numIdentificacion: deserializeParam(
          data['numIdentificacion'],
          ParamType.String,
          false,
        ),
        orderID: deserializeParam(
          data['orderID'],
          ParamType.int,
          false,
        ),
      );

  static InfoFamiliarStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InfoFamiliarStruct(
        parentezco: convertAlgoliaParam(
          data['parentezco'],
          ParamType.String,
          false,
        ),
        nombre: convertAlgoliaParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        apellido: convertAlgoliaParam(
          data['apellido'],
          ParamType.String,
          false,
        ),
        celular: convertAlgoliaParam(
          data['celular'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        tipoDeSangre: convertAlgoliaParam(
          data['tipoDeSangre'],
          ParamType.String,
          false,
        ),
        fechaNacimiento: convertAlgoliaParam(
          data['fechaNacimiento'],
          ParamType.DateTime,
          false,
        ),
        numIdentificacion: convertAlgoliaParam(
          data['numIdentificacion'],
          ParamType.String,
          false,
        ),
        orderID: convertAlgoliaParam(
          data['orderID'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InfoFamiliarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InfoFamiliarStruct &&
        parentezco == other.parentezco &&
        nombre == other.nombre &&
        apellido == other.apellido &&
        celular == other.celular &&
        email == other.email &&
        tipoDeSangre == other.tipoDeSangre &&
        fechaNacimiento == other.fechaNacimiento &&
        numIdentificacion == other.numIdentificacion &&
        orderID == other.orderID;
  }

  @override
  int get hashCode => const ListEquality().hash([
        parentezco,
        nombre,
        apellido,
        celular,
        email,
        tipoDeSangre,
        fechaNacimiento,
        numIdentificacion,
        orderID
      ]);
}

InfoFamiliarStruct createInfoFamiliarStruct({
  String? parentezco,
  String? nombre,
  String? apellido,
  String? celular,
  String? email,
  String? tipoDeSangre,
  DateTime? fechaNacimiento,
  String? numIdentificacion,
  int? orderID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InfoFamiliarStruct(
      parentezco: parentezco,
      nombre: nombre,
      apellido: apellido,
      celular: celular,
      email: email,
      tipoDeSangre: tipoDeSangre,
      fechaNacimiento: fechaNacimiento,
      numIdentificacion: numIdentificacion,
      orderID: orderID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InfoFamiliarStruct? updateInfoFamiliarStruct(
  InfoFamiliarStruct? infoFamiliar, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    infoFamiliar
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInfoFamiliarStructData(
  Map<String, dynamic> firestoreData,
  InfoFamiliarStruct? infoFamiliar,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (infoFamiliar == null) {
    return;
  }
  if (infoFamiliar.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && infoFamiliar.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final infoFamiliarData =
      getInfoFamiliarFirestoreData(infoFamiliar, forFieldValue);
  final nestedData =
      infoFamiliarData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = infoFamiliar.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInfoFamiliarFirestoreData(
  InfoFamiliarStruct? infoFamiliar, [
  bool forFieldValue = false,
]) {
  if (infoFamiliar == null) {
    return {};
  }
  final firestoreData = mapToFirestore(infoFamiliar.toMap());

  // Add any Firestore field values
  infoFamiliar.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInfoFamiliarListFirestoreData(
  List<InfoFamiliarStruct>? infoFamiliars,
) =>
    infoFamiliars?.map((e) => getInfoFamiliarFirestoreData(e, true)).toList() ??
    [];
