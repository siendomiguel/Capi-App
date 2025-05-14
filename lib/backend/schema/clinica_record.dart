import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClinicaRecord extends FirestoreRecord {
  ClinicaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "brandColor" field.
  Color? _brandColor;
  Color? get brandColor => _brandColor;
  bool hasBrandColor() => _brandColor != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "horarioAtencion" field.
  List<HorarioPrincipalStruct>? _horarioAtencion;
  List<HorarioPrincipalStruct> get horarioAtencion =>
      _horarioAtencion ?? const [];
  bool hasHorarioAtencion() => _horarioAtencion != null;

  // "pagos" field.
  ConfPagosStruct? _pagos;
  ConfPagosStruct get pagos => _pagos ?? ConfPagosStruct();
  bool hasPagos() => _pagos != null;

  // "zoom" field.
  ConfZoomStruct? _zoom;
  ConfZoomStruct get zoom => _zoom ?? ConfZoomStruct();
  bool hasZoom() => _zoom != null;

  // "planSuscripcion" field.
  DocumentReference? _planSuscripcion;
  DocumentReference? get planSuscripcion => _planSuscripcion;
  bool hasPlanSuscripcion() => _planSuscripcion != null;

  // "direccionClinica" field.
  DireccionStruct? _direccionClinica;
  DireccionStruct get direccionClinica =>
      _direccionClinica ?? DireccionStruct();
  bool hasDireccionClinica() => _direccionClinica != null;

  // "stripe_cust_id" field.
  String? _stripeCustId;
  String get stripeCustId => _stripeCustId ?? '';
  bool hasStripeCustId() => _stripeCustId != null;

  // "stripe_subscription_id" field.
  String? _stripeSubscriptionId;
  String get stripeSubscriptionId => _stripeSubscriptionId ?? '';
  bool hasStripeSubscriptionId() => _stripeSubscriptionId != null;

  // "stripe_subscription_status" field.
  String? _stripeSubscriptionStatus;
  String get stripeSubscriptionStatus => _stripeSubscriptionStatus ?? '';
  bool hasStripeSubscriptionStatus() => _stripeSubscriptionStatus != null;

  // "stripe_subscription_product_id" field.
  String? _stripeSubscriptionProductId;
  String get stripeSubscriptionProductId => _stripeSubscriptionProductId ?? '';
  bool hasStripeSubscriptionProductId() => _stripeSubscriptionProductId != null;

  // "stripe_subscription_price_id" field.
  String? _stripeSubscriptionPriceId;
  String get stripeSubscriptionPriceId => _stripeSubscriptionPriceId ?? '';
  bool hasStripeSubscriptionPriceId() => _stripeSubscriptionPriceId != null;

  // "stripe_plan_end_date" field.
  DateTime? _stripePlanEndDate;
  DateTime? get stripePlanEndDate => _stripePlanEndDate;
  bool hasStripePlanEndDate() => _stripePlanEndDate != null;

  // "nombrePlan" field.
  String? _nombrePlan;
  String get nombrePlan => _nombrePlan ?? '';
  bool hasNombrePlan() => _nombrePlan != null;

  // "limitePersonal" field.
  int? _limitePersonal;
  int get limitePersonal => _limitePersonal ?? 0;
  bool hasLimitePersonal() => _limitePersonal != null;

  // "limitePacientes" field.
  int? _limitePacientes;
  int get limitePacientes => _limitePacientes ?? 0;
  bool hasLimitePacientes() => _limitePacientes != null;

  // "pacientesUsados" field.
  int? _pacientesUsados;
  int get pacientesUsados => _pacientesUsados ?? 0;
  bool hasPacientesUsados() => _pacientesUsados != null;

  // "Zoom_link_instantaneo" field.
  String? _zoomLinkInstantaneo;
  String get zoomLinkInstantaneo => _zoomLinkInstantaneo ?? '';
  bool hasZoomLinkInstantaneo() => _zoomLinkInstantaneo != null;

  // "stripeSK_key" field.
  String? _stripeSKKey;
  String get stripeSKKey => _stripeSKKey ?? '';
  bool hasStripeSKKey() => _stripeSKKey != null;

  // "owner_user" field.
  DocumentReference? _ownerUser;
  DocumentReference? get ownerUser => _ownerUser;
  bool hasOwnerUser() => _ownerUser != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = snapshotData['telefono'] as String?;
    _email = snapshotData['email'] as String?;
    _logo = snapshotData['logo'] as String?;
    _brandColor = getSchemaColor(snapshotData['brandColor']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _horarioAtencion = getStructList(
      snapshotData['horarioAtencion'],
      HorarioPrincipalStruct.fromMap,
    );
    _pagos = snapshotData['pagos'] is ConfPagosStruct
        ? snapshotData['pagos']
        : ConfPagosStruct.maybeFromMap(snapshotData['pagos']);
    _zoom = snapshotData['zoom'] is ConfZoomStruct
        ? snapshotData['zoom']
        : ConfZoomStruct.maybeFromMap(snapshotData['zoom']);
    _planSuscripcion = snapshotData['planSuscripcion'] as DocumentReference?;
    _direccionClinica = snapshotData['direccionClinica'] is DireccionStruct
        ? snapshotData['direccionClinica']
        : DireccionStruct.maybeFromMap(snapshotData['direccionClinica']);
    _stripeCustId = snapshotData['stripe_cust_id'] as String?;
    _stripeSubscriptionId = snapshotData['stripe_subscription_id'] as String?;
    _stripeSubscriptionStatus =
        snapshotData['stripe_subscription_status'] as String?;
    _stripeSubscriptionProductId =
        snapshotData['stripe_subscription_product_id'] as String?;
    _stripeSubscriptionPriceId =
        snapshotData['stripe_subscription_price_id'] as String?;
    _stripePlanEndDate = snapshotData['stripe_plan_end_date'] as DateTime?;
    _nombrePlan = snapshotData['nombrePlan'] as String?;
    _limitePersonal = castToType<int>(snapshotData['limitePersonal']);
    _limitePacientes = castToType<int>(snapshotData['limitePacientes']);
    _pacientesUsados = castToType<int>(snapshotData['pacientesUsados']);
    _zoomLinkInstantaneo = snapshotData['Zoom_link_instantaneo'] as String?;
    _stripeSKKey = snapshotData['stripeSK_key'] as String?;
    _ownerUser = snapshotData['owner_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clinica');

  static Stream<ClinicaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClinicaRecord.fromSnapshot(s));

  static Future<ClinicaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClinicaRecord.fromSnapshot(s));

  static ClinicaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClinicaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClinicaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClinicaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClinicaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClinicaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClinicaRecordData({
  String? uid,
  String? nombre,
  String? telefono,
  String? email,
  String? logo,
  Color? brandColor,
  DateTime? createdDate,
  ConfPagosStruct? pagos,
  ConfZoomStruct? zoom,
  DocumentReference? planSuscripcion,
  DireccionStruct? direccionClinica,
  String? stripeCustId,
  String? stripeSubscriptionId,
  String? stripeSubscriptionStatus,
  String? stripeSubscriptionProductId,
  String? stripeSubscriptionPriceId,
  DateTime? stripePlanEndDate,
  String? nombrePlan,
  int? limitePersonal,
  int? limitePacientes,
  int? pacientesUsados,
  String? zoomLinkInstantaneo,
  String? stripeSKKey,
  DocumentReference? ownerUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'logo': logo,
      'brandColor': brandColor,
      'createdDate': createdDate,
      'pagos': ConfPagosStruct().toMap(),
      'zoom': ConfZoomStruct().toMap(),
      'planSuscripcion': planSuscripcion,
      'direccionClinica': DireccionStruct().toMap(),
      'stripe_cust_id': stripeCustId,
      'stripe_subscription_id': stripeSubscriptionId,
      'stripe_subscription_status': stripeSubscriptionStatus,
      'stripe_subscription_product_id': stripeSubscriptionProductId,
      'stripe_subscription_price_id': stripeSubscriptionPriceId,
      'stripe_plan_end_date': stripePlanEndDate,
      'nombrePlan': nombrePlan,
      'limitePersonal': limitePersonal,
      'limitePacientes': limitePacientes,
      'pacientesUsados': pacientesUsados,
      'Zoom_link_instantaneo': zoomLinkInstantaneo,
      'stripeSK_key': stripeSKKey,
      'owner_user': ownerUser,
    }.withoutNulls,
  );

  // Handle nested data for "pagos" field.
  addConfPagosStructData(firestoreData, pagos, 'pagos');

  // Handle nested data for "zoom" field.
  addConfZoomStructData(firestoreData, zoom, 'zoom');

  // Handle nested data for "direccionClinica" field.
  addDireccionStructData(firestoreData, direccionClinica, 'direccionClinica');

  return firestoreData;
}

class ClinicaRecordDocumentEquality implements Equality<ClinicaRecord> {
  const ClinicaRecordDocumentEquality();

  @override
  bool equals(ClinicaRecord? e1, ClinicaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono &&
        e1?.email == e2?.email &&
        e1?.logo == e2?.logo &&
        e1?.brandColor == e2?.brandColor &&
        e1?.createdDate == e2?.createdDate &&
        listEquality.equals(e1?.horarioAtencion, e2?.horarioAtencion) &&
        e1?.pagos == e2?.pagos &&
        e1?.zoom == e2?.zoom &&
        e1?.planSuscripcion == e2?.planSuscripcion &&
        e1?.direccionClinica == e2?.direccionClinica &&
        e1?.stripeCustId == e2?.stripeCustId &&
        e1?.stripeSubscriptionId == e2?.stripeSubscriptionId &&
        e1?.stripeSubscriptionStatus == e2?.stripeSubscriptionStatus &&
        e1?.stripeSubscriptionProductId == e2?.stripeSubscriptionProductId &&
        e1?.stripeSubscriptionPriceId == e2?.stripeSubscriptionPriceId &&
        e1?.stripePlanEndDate == e2?.stripePlanEndDate &&
        e1?.nombrePlan == e2?.nombrePlan &&
        e1?.limitePersonal == e2?.limitePersonal &&
        e1?.limitePacientes == e2?.limitePacientes &&
        e1?.pacientesUsados == e2?.pacientesUsados &&
        e1?.zoomLinkInstantaneo == e2?.zoomLinkInstantaneo &&
        e1?.stripeSKKey == e2?.stripeSKKey &&
        e1?.ownerUser == e2?.ownerUser;
  }

  @override
  int hash(ClinicaRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.nombre,
        e?.telefono,
        e?.email,
        e?.logo,
        e?.brandColor,
        e?.createdDate,
        e?.horarioAtencion,
        e?.pagos,
        e?.zoom,
        e?.planSuscripcion,
        e?.direccionClinica,
        e?.stripeCustId,
        e?.stripeSubscriptionId,
        e?.stripeSubscriptionStatus,
        e?.stripeSubscriptionProductId,
        e?.stripeSubscriptionPriceId,
        e?.stripePlanEndDate,
        e?.nombrePlan,
        e?.limitePersonal,
        e?.limitePacientes,
        e?.pacientesUsados,
        e?.zoomLinkInstantaneo,
        e?.stripeSKKey,
        e?.ownerUser
      ]);

  @override
  bool isValidKey(Object? o) => o is ClinicaRecord;
}
