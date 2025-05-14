import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "apellidoPaterno" field.
  String? _apellidoPaterno;
  String get apellidoPaterno => _apellidoPaterno ?? '';
  bool hasApellidoPaterno() => _apellidoPaterno != null;

  // "apellidoMaterno" field.
  String? _apellidoMaterno;
  String get apellidoMaterno => _apellidoMaterno ?? '';
  bool hasApellidoMaterno() => _apellidoMaterno != null;

  // "edad" field.
  String? _edad;
  String get edad => _edad ?? '';
  bool hasEdad() => _edad != null;

  // "fechaNacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "estadoCivil" field.
  String? _estadoCivil;
  String get estadoCivil => _estadoCivil ?? '';
  bool hasEstadoCivil() => _estadoCivil != null;

  // "ocupacion" field.
  String? _ocupacion;
  String get ocupacion => _ocupacion ?? '';
  bool hasOcupacion() => _ocupacion != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  // "otroTelefono" field.
  String? _otroTelefono;
  String get otroTelefono => _otroTelefono ?? '';
  bool hasOtroTelefono() => _otroTelefono != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "clinica" field.
  DocumentReference? _clinica;
  DocumentReference? get clinica => _clinica;
  bool hasClinica() => _clinica != null;

  // "direccion" field.
  DireccionStruct? _direccion;
  DireccionStruct get direccion => _direccion ?? DireccionStruct();
  bool hasDireccion() => _direccion != null;

  // "longDescription" field.
  String? _longDescription;
  String get longDescription => _longDescription ?? '';
  bool hasLongDescription() => _longDescription != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "religion" field.
  String? _religion;
  String get religion => _religion ?? '';
  bool hasReligion() => _religion != null;

  // "alergias" field.
  List<AlergiasStruct>? _alergias;
  List<AlergiasStruct> get alergias => _alergias ?? const [];
  bool hasAlergias() => _alergias != null;

  // "lugarOrigen" field.
  String? _lugarOrigen;
  String get lugarOrigen => _lugarOrigen ?? '';
  bool hasLugarOrigen() => _lugarOrigen != null;

  // "lugarResidencia" field.
  String? _lugarResidencia;
  String get lugarResidencia => _lugarResidencia ?? '';
  bool hasLugarResidencia() => _lugarResidencia != null;

  // "referidoPor" field.
  String? _referidoPor;
  String get referidoPor => _referidoPor ?? '';
  bool hasReferidoPor() => _referidoPor != null;

  // "DNI" field.
  String? _dni;
  String get dni => _dni ?? '';
  bool hasDni() => _dni != null;

  // "tipoSangre" field.
  String? _tipoSangre;
  String get tipoSangre => _tipoSangre ?? '';
  bool hasTipoSangre() => _tipoSangre != null;

  // "seguroMedico" field.
  SeguroMedicoStruct? _seguroMedico;
  SeguroMedicoStruct get seguroMedico => _seguroMedico ?? SeguroMedicoStruct();
  bool hasSeguroMedico() => _seguroMedico != null;

  // "infoFamiliar" field.
  List<InfoFamiliarStruct>? _infoFamiliar;
  List<InfoFamiliarStruct> get infoFamiliar => _infoFamiliar ?? const [];
  bool hasInfoFamiliar() => _infoFamiliar != null;

  // "expediente" field.
  String? _expediente;
  String get expediente => _expediente ?? '';
  bool hasExpediente() => _expediente != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "talla" field.
  double? _talla;
  double get talla => _talla ?? 0.0;
  bool hasTalla() => _talla != null;

  // "nacionalidad" field.
  String? _nacionalidad;
  String get nacionalidad => _nacionalidad ?? '';
  bool hasNacionalidad() => _nacionalidad != null;

  // "completeProfile" field.
  bool? _completeProfile;
  bool get completeProfile => _completeProfile ?? false;
  bool hasCompleteProfile() => _completeProfile != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "ICM" field.
  String? _icm;
  String get icm => _icm ?? '';
  bool hasIcm() => _icm != null;

  // "zoomAccountID" field.
  String? _zoomAccountID;
  String get zoomAccountID => _zoomAccountID ?? '';
  bool hasZoomAccountID() => _zoomAccountID != null;

  // "zoomClientID" field.
  String? _zoomClientID;
  String get zoomClientID => _zoomClientID ?? '';
  bool hasZoomClientID() => _zoomClientID != null;

  // "zoomSecretID" field.
  String? _zoomSecretID;
  String get zoomSecretID => _zoomSecretID ?? '';
  bool hasZoomSecretID() => _zoomSecretID != null;

  // "zoomLinkInstantaneo" field.
  String? _zoomLinkInstantaneo;
  String get zoomLinkInstantaneo => _zoomLinkInstantaneo ?? '';
  bool hasZoomLinkInstantaneo() => _zoomLinkInstantaneo != null;

  // "permisos" field.
  PermisosStruct? _permisos;
  PermisosStruct get permisos => _permisos ?? PermisosStruct();
  bool hasPermisos() => _permisos != null;

  // "stripePk_key" field.
  String? _stripePkKey;
  String get stripePkKey => _stripePkKey ?? '';
  bool hasStripePkKey() => _stripePkKey != null;

  // "stripeSK_key" field.
  String? _stripeSKKey;
  String get stripeSKKey => _stripeSKKey ?? '';
  bool hasStripeSKKey() => _stripeSKKey != null;

  // "availability" field.
  List<AvailabilityStruct>? _availability;
  List<AvailabilityStruct> get availability => _availability ?? const [];
  bool hasAvailability() => _availability != null;

  // "configCompleta" field.
  bool? _configCompleta;
  bool get configCompleta => _configCompleta ?? false;
  bool hasConfigCompleta() => _configCompleta != null;

  // "ChatsIniciados" field.
  List<DocumentReference>? _chatsIniciados;
  List<DocumentReference> get chatsIniciados => _chatsIniciados ?? const [];
  bool hasChatsIniciados() => _chatsIniciados != null;

  // "cedulaProfesional" field.
  List<String>? _cedulaProfesional;
  List<String> get cedulaProfesional => _cedulaProfesional ?? const [];
  bool hasCedulaProfesional() => _cedulaProfesional != null;

  // "CertificadoPor" field.
  List<String>? _certificadoPor;
  List<String> get certificadoPor => _certificadoPor ?? const [];
  bool hasCertificadoPor() => _certificadoPor != null;

  // "horarios" field.
  bool? _horarios;
  bool get horarios => _horarios ?? false;
  bool hasHorarios() => _horarios != null;

  // "servicios" field.
  bool? _servicios;
  bool get servicios => _servicios ?? false;
  bool hasServicios() => _servicios != null;

  // "equipo" field.
  bool? _equipo;
  bool get equipo => _equipo ?? false;
  bool hasEquipo() => _equipo != null;

  // "zoom" field.
  bool? _zoom;
  bool get zoom => _zoom ?? false;
  bool hasZoom() => _zoom != null;

  // "stripe" field.
  bool? _stripe;
  bool get stripe => _stripe ?? false;
  bool hasStripe() => _stripe != null;

  // "clinicas" field.
  List<DocumentReference>? _clinicas;
  List<DocumentReference> get clinicas => _clinicas ?? const [];
  bool hasClinicas() => _clinicas != null;

  // "pacientes" field.
  List<DocumentReference>? _pacientes;
  List<DocumentReference> get pacientes => _pacientes ?? const [];
  bool hasPacientes() => _pacientes != null;

  // "serviciosList" field.
  List<DocumentReference>? _serviciosList;
  List<DocumentReference> get serviciosList => _serviciosList ?? const [];
  bool hasServiciosList() => _serviciosList != null;

  // "especialidadList" field.
  List<DocumentReference>? _especialidadList;
  List<DocumentReference> get especialidadList => _especialidadList ?? const [];
  bool hasEspecialidadList() => _especialidadList != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "mis_doctores" field.
  List<DocumentReference>? _misDoctores;
  List<DocumentReference> get misDoctores => _misDoctores ?? const [];
  bool hasMisDoctores() => _misDoctores != null;

  // "blockList" field.
  List<DocumentReference>? _blockList;
  List<DocumentReference> get blockList => _blockList ?? const [];
  bool hasBlockList() => _blockList != null;

  // "Solicitudes" field.
  List<DocumentReference>? _solicitudes;
  List<DocumentReference> get solicitudes => _solicitudes ?? const [];
  bool hasSolicitudes() => _solicitudes != null;

  // "onboardingComplete" field.
  bool? _onboardingComplete;
  bool get onboardingComplete => _onboardingComplete ?? false;
  bool hasOnboardingComplete() => _onboardingComplete != null;

  // "credits_ai" field.
  double? _creditsAi;
  double get creditsAi => _creditsAi ?? 0.0;
  bool hasCreditsAi() => _creditsAi != null;

  // "StripeOAuthID" field.
  String? _stripeOAuthID;
  String get stripeOAuthID => _stripeOAuthID ?? '';
  bool hasStripeOAuthID() => _stripeOAuthID != null;

  // "seccioActualenMenu" field.
  String? _seccioActualenMenu;
  String get seccioActualenMenu => _seccioActualenMenu ?? '';
  bool hasSeccioActualenMenu() => _seccioActualenMenu != null;

  // "etapaIncorporacion" field.
  EtapaIncorporacion? _etapaIncorporacion;
  EtapaIncorporacion? get etapaIncorporacion => _etapaIncorporacion;
  bool hasEtapaIncorporacion() => _etapaIncorporacion != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _apellidoPaterno = snapshotData['apellidoPaterno'] as String?;
    _apellidoMaterno = snapshotData['apellidoMaterno'] as String?;
    _edad = snapshotData['edad'] as String?;
    _fechaNacimiento = snapshotData['fechaNacimiento'] as DateTime?;
    _estadoCivil = snapshotData['estadoCivil'] as String?;
    _ocupacion = snapshotData['ocupacion'] as String?;
    _notas = snapshotData['notas'] as String?;
    _otroTelefono = snapshotData['otroTelefono'] as String?;
    _genero = snapshotData['genero'] as String?;
    _clinica = snapshotData['clinica'] as DocumentReference?;
    _direccion = snapshotData['direccion'] is DireccionStruct
        ? snapshotData['direccion']
        : DireccionStruct.maybeFromMap(snapshotData['direccion']);
    _longDescription = snapshotData['longDescription'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _religion = snapshotData['religion'] as String?;
    _alergias = getStructList(
      snapshotData['alergias'],
      AlergiasStruct.fromMap,
    );
    _lugarOrigen = snapshotData['lugarOrigen'] as String?;
    _lugarResidencia = snapshotData['lugarResidencia'] as String?;
    _referidoPor = snapshotData['referidoPor'] as String?;
    _dni = snapshotData['DNI'] as String?;
    _tipoSangre = snapshotData['tipoSangre'] as String?;
    _seguroMedico = snapshotData['seguroMedico'] is SeguroMedicoStruct
        ? snapshotData['seguroMedico']
        : SeguroMedicoStruct.maybeFromMap(snapshotData['seguroMedico']);
    _infoFamiliar = getStructList(
      snapshotData['infoFamiliar'],
      InfoFamiliarStruct.fromMap,
    );
    _expediente = snapshotData['expediente'] as String?;
    _peso = castToType<double>(snapshotData['peso']);
    _talla = castToType<double>(snapshotData['talla']);
    _nacionalidad = snapshotData['nacionalidad'] as String?;
    _completeProfile = snapshotData['completeProfile'] as bool?;
    _color = getSchemaColor(snapshotData['color']);
    _icm = snapshotData['ICM'] as String?;
    _zoomAccountID = snapshotData['zoomAccountID'] as String?;
    _zoomClientID = snapshotData['zoomClientID'] as String?;
    _zoomSecretID = snapshotData['zoomSecretID'] as String?;
    _zoomLinkInstantaneo = snapshotData['zoomLinkInstantaneo'] as String?;
    _permisos = snapshotData['permisos'] is PermisosStruct
        ? snapshotData['permisos']
        : PermisosStruct.maybeFromMap(snapshotData['permisos']);
    _stripePkKey = snapshotData['stripePk_key'] as String?;
    _stripeSKKey = snapshotData['stripeSK_key'] as String?;
    _availability = getStructList(
      snapshotData['availability'],
      AvailabilityStruct.fromMap,
    );
    _configCompleta = snapshotData['configCompleta'] as bool?;
    _chatsIniciados = getDataList(snapshotData['ChatsIniciados']);
    _cedulaProfesional = getDataList(snapshotData['cedulaProfesional']);
    _certificadoPor = getDataList(snapshotData['CertificadoPor']);
    _horarios = snapshotData['horarios'] as bool?;
    _servicios = snapshotData['servicios'] as bool?;
    _equipo = snapshotData['equipo'] as bool?;
    _zoom = snapshotData['zoom'] as bool?;
    _stripe = snapshotData['stripe'] as bool?;
    _clinicas = getDataList(snapshotData['clinicas']);
    _pacientes = getDataList(snapshotData['pacientes']);
    _serviciosList = getDataList(snapshotData['serviciosList']);
    _especialidadList = getDataList(snapshotData['especialidadList']);
    _ciudad = snapshotData['ciudad'] as String?;
    _misDoctores = getDataList(snapshotData['mis_doctores']);
    _blockList = getDataList(snapshotData['blockList']);
    _solicitudes = getDataList(snapshotData['Solicitudes']);
    _onboardingComplete = snapshotData['onboardingComplete'] as bool?;
    _creditsAi = castToType<double>(snapshotData['credits_ai']);
    _stripeOAuthID = snapshotData['StripeOAuthID'] as String?;
    _seccioActualenMenu = snapshotData['seccioActualenMenu'] as String?;
    _etapaIncorporacion =
        snapshotData['etapaIncorporacion'] is EtapaIncorporacion
            ? snapshotData['etapaIncorporacion']
            : deserializeEnum<EtapaIncorporacion>(
                snapshotData['etapaIncorporacion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'shortDescription': snapshot.data['shortDescription'],
          'last_active_time': convertAlgoliaParam(
            snapshot.data['last_active_time'],
            ParamType.DateTime,
            false,
          ),
          'role': snapshot.data['role'],
          'title': snapshot.data['title'],
          'nombre': snapshot.data['nombre'],
          'apellidoPaterno': snapshot.data['apellidoPaterno'],
          'apellidoMaterno': snapshot.data['apellidoMaterno'],
          'edad': snapshot.data['edad'],
          'fechaNacimiento': convertAlgoliaParam(
            snapshot.data['fechaNacimiento'],
            ParamType.DateTime,
            false,
          ),
          'estadoCivil': snapshot.data['estadoCivil'],
          'ocupacion': snapshot.data['ocupacion'],
          'notas': snapshot.data['notas'],
          'otroTelefono': snapshot.data['otroTelefono'],
          'genero': snapshot.data['genero'],
          'clinica': convertAlgoliaParam(
            snapshot.data['clinica'],
            ParamType.DocumentReference,
            false,
          ),
          'direccion':
              DireccionStruct.fromAlgoliaData(snapshot.data['direccion'] ?? {})
                  .toMap(),
          'longDescription': snapshot.data['longDescription'],
          'isAdmin': snapshot.data['isAdmin'],
          'religion': snapshot.data['religion'],
          'alergias': safeGet(
            () => (snapshot.data['alergias'] as Iterable)
                .map((d) => AlergiasStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'lugarOrigen': snapshot.data['lugarOrigen'],
          'lugarResidencia': snapshot.data['lugarResidencia'],
          'referidoPor': snapshot.data['referidoPor'],
          'DNI': snapshot.data['DNI'],
          'tipoSangre': snapshot.data['tipoSangre'],
          'seguroMedico': SeguroMedicoStruct.fromAlgoliaData(
                  snapshot.data['seguroMedico'] ?? {})
              .toMap(),
          'infoFamiliar': safeGet(
            () => (snapshot.data['infoFamiliar'] as Iterable)
                .map((d) => InfoFamiliarStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'expediente': snapshot.data['expediente'],
          'peso': convertAlgoliaParam(
            snapshot.data['peso'],
            ParamType.double,
            false,
          ),
          'talla': convertAlgoliaParam(
            snapshot.data['talla'],
            ParamType.double,
            false,
          ),
          'nacionalidad': snapshot.data['nacionalidad'],
          'completeProfile': snapshot.data['completeProfile'],
          'color': convertAlgoliaParam(
            snapshot.data['color'],
            ParamType.Color,
            false,
          ),
          'ICM': snapshot.data['ICM'],
          'zoomAccountID': snapshot.data['zoomAccountID'],
          'zoomClientID': snapshot.data['zoomClientID'],
          'zoomSecretID': snapshot.data['zoomSecretID'],
          'zoomLinkInstantaneo': snapshot.data['zoomLinkInstantaneo'],
          'permisos':
              PermisosStruct.fromAlgoliaData(snapshot.data['permisos'] ?? {})
                  .toMap(),
          'stripePk_key': snapshot.data['stripePk_key'],
          'stripeSK_key': snapshot.data['stripeSK_key'],
          'availability': safeGet(
            () => (snapshot.data['availability'] as Iterable)
                .map((d) => AvailabilityStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'configCompleta': snapshot.data['configCompleta'],
          'ChatsIniciados': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['ChatsIniciados'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'cedulaProfesional': safeGet(
            () => snapshot.data['cedulaProfesional'].toList(),
          ),
          'CertificadoPor': safeGet(
            () => snapshot.data['CertificadoPor'].toList(),
          ),
          'horarios': snapshot.data['horarios'],
          'servicios': snapshot.data['servicios'],
          'equipo': snapshot.data['equipo'],
          'zoom': snapshot.data['zoom'],
          'stripe': snapshot.data['stripe'],
          'clinicas': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['clinicas'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'pacientes': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['pacientes'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'serviciosList': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['serviciosList'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'especialidadList': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['especialidadList'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'ciudad': snapshot.data['ciudad'],
          'mis_doctores': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['mis_doctores'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'blockList': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['blockList'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'Solicitudes': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['Solicitudes'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'onboardingComplete': snapshot.data['onboardingComplete'],
          'credits_ai': convertAlgoliaParam(
            snapshot.data['credits_ai'],
            ParamType.double,
            false,
          ),
          'StripeOAuthID': snapshot.data['StripeOAuthID'],
          'seccioActualenMenu': snapshot.data['seccioActualenMenu'],
          'etapaIncorporacion': convertAlgoliaParam<EtapaIncorporacion>(
            snapshot.data['etapaIncorporacion'],
            ParamType.Enum,
            false,
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? nombre,
  String? apellidoPaterno,
  String? apellidoMaterno,
  String? edad,
  DateTime? fechaNacimiento,
  String? estadoCivil,
  String? ocupacion,
  String? notas,
  String? otroTelefono,
  String? genero,
  DocumentReference? clinica,
  DireccionStruct? direccion,
  String? longDescription,
  bool? isAdmin,
  String? religion,
  String? lugarOrigen,
  String? lugarResidencia,
  String? referidoPor,
  String? dni,
  String? tipoSangre,
  SeguroMedicoStruct? seguroMedico,
  String? expediente,
  double? peso,
  double? talla,
  String? nacionalidad,
  bool? completeProfile,
  Color? color,
  String? icm,
  String? zoomAccountID,
  String? zoomClientID,
  String? zoomSecretID,
  String? zoomLinkInstantaneo,
  PermisosStruct? permisos,
  String? stripePkKey,
  String? stripeSKKey,
  bool? configCompleta,
  bool? horarios,
  bool? servicios,
  bool? equipo,
  bool? zoom,
  bool? stripe,
  String? ciudad,
  bool? onboardingComplete,
  double? creditsAi,
  String? stripeOAuthID,
  String? seccioActualenMenu,
  EtapaIncorporacion? etapaIncorporacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'nombre': nombre,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'edad': edad,
      'fechaNacimiento': fechaNacimiento,
      'estadoCivil': estadoCivil,
      'ocupacion': ocupacion,
      'notas': notas,
      'otroTelefono': otroTelefono,
      'genero': genero,
      'clinica': clinica,
      'direccion': DireccionStruct().toMap(),
      'longDescription': longDescription,
      'isAdmin': isAdmin,
      'religion': religion,
      'lugarOrigen': lugarOrigen,
      'lugarResidencia': lugarResidencia,
      'referidoPor': referidoPor,
      'DNI': dni,
      'tipoSangre': tipoSangre,
      'seguroMedico': SeguroMedicoStruct().toMap(),
      'expediente': expediente,
      'peso': peso,
      'talla': talla,
      'nacionalidad': nacionalidad,
      'completeProfile': completeProfile,
      'color': color,
      'ICM': icm,
      'zoomAccountID': zoomAccountID,
      'zoomClientID': zoomClientID,
      'zoomSecretID': zoomSecretID,
      'zoomLinkInstantaneo': zoomLinkInstantaneo,
      'permisos': PermisosStruct().toMap(),
      'stripePk_key': stripePkKey,
      'stripeSK_key': stripeSKKey,
      'configCompleta': configCompleta,
      'horarios': horarios,
      'servicios': servicios,
      'equipo': equipo,
      'zoom': zoom,
      'stripe': stripe,
      'ciudad': ciudad,
      'onboardingComplete': onboardingComplete,
      'credits_ai': creditsAi,
      'StripeOAuthID': stripeOAuthID,
      'seccioActualenMenu': seccioActualenMenu,
      'etapaIncorporacion': etapaIncorporacion,
    }.withoutNulls,
  );

  // Handle nested data for "direccion" field.
  addDireccionStructData(firestoreData, direccion, 'direccion');

  // Handle nested data for "seguroMedico" field.
  addSeguroMedicoStructData(firestoreData, seguroMedico, 'seguroMedico');

  // Handle nested data for "permisos" field.
  addPermisosStructData(firestoreData, permisos, 'permisos');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.nombre == e2?.nombre &&
        e1?.apellidoPaterno == e2?.apellidoPaterno &&
        e1?.apellidoMaterno == e2?.apellidoMaterno &&
        e1?.edad == e2?.edad &&
        e1?.fechaNacimiento == e2?.fechaNacimiento &&
        e1?.estadoCivil == e2?.estadoCivil &&
        e1?.ocupacion == e2?.ocupacion &&
        e1?.notas == e2?.notas &&
        e1?.otroTelefono == e2?.otroTelefono &&
        e1?.genero == e2?.genero &&
        e1?.clinica == e2?.clinica &&
        e1?.direccion == e2?.direccion &&
        e1?.longDescription == e2?.longDescription &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.religion == e2?.religion &&
        listEquality.equals(e1?.alergias, e2?.alergias) &&
        e1?.lugarOrigen == e2?.lugarOrigen &&
        e1?.lugarResidencia == e2?.lugarResidencia &&
        e1?.referidoPor == e2?.referidoPor &&
        e1?.dni == e2?.dni &&
        e1?.tipoSangre == e2?.tipoSangre &&
        e1?.seguroMedico == e2?.seguroMedico &&
        listEquality.equals(e1?.infoFamiliar, e2?.infoFamiliar) &&
        e1?.expediente == e2?.expediente &&
        e1?.peso == e2?.peso &&
        e1?.talla == e2?.talla &&
        e1?.nacionalidad == e2?.nacionalidad &&
        e1?.completeProfile == e2?.completeProfile &&
        e1?.color == e2?.color &&
        e1?.icm == e2?.icm &&
        e1?.zoomAccountID == e2?.zoomAccountID &&
        e1?.zoomClientID == e2?.zoomClientID &&
        e1?.zoomSecretID == e2?.zoomSecretID &&
        e1?.zoomLinkInstantaneo == e2?.zoomLinkInstantaneo &&
        e1?.permisos == e2?.permisos &&
        e1?.stripePkKey == e2?.stripePkKey &&
        e1?.stripeSKKey == e2?.stripeSKKey &&
        listEquality.equals(e1?.availability, e2?.availability) &&
        e1?.configCompleta == e2?.configCompleta &&
        listEquality.equals(e1?.chatsIniciados, e2?.chatsIniciados) &&
        listEquality.equals(e1?.cedulaProfesional, e2?.cedulaProfesional) &&
        listEquality.equals(e1?.certificadoPor, e2?.certificadoPor) &&
        e1?.horarios == e2?.horarios &&
        e1?.servicios == e2?.servicios &&
        e1?.equipo == e2?.equipo &&
        e1?.zoom == e2?.zoom &&
        e1?.stripe == e2?.stripe &&
        listEquality.equals(e1?.clinicas, e2?.clinicas) &&
        listEquality.equals(e1?.pacientes, e2?.pacientes) &&
        listEquality.equals(e1?.serviciosList, e2?.serviciosList) &&
        listEquality.equals(e1?.especialidadList, e2?.especialidadList) &&
        e1?.ciudad == e2?.ciudad &&
        listEquality.equals(e1?.misDoctores, e2?.misDoctores) &&
        listEquality.equals(e1?.blockList, e2?.blockList) &&
        listEquality.equals(e1?.solicitudes, e2?.solicitudes) &&
        e1?.onboardingComplete == e2?.onboardingComplete &&
        e1?.creditsAi == e2?.creditsAi &&
        e1?.stripeOAuthID == e2?.stripeOAuthID &&
        e1?.seccioActualenMenu == e2?.seccioActualenMenu &&
        e1?.etapaIncorporacion == e2?.etapaIncorporacion;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.nombre,
        e?.apellidoPaterno,
        e?.apellidoMaterno,
        e?.edad,
        e?.fechaNacimiento,
        e?.estadoCivil,
        e?.ocupacion,
        e?.notas,
        e?.otroTelefono,
        e?.genero,
        e?.clinica,
        e?.direccion,
        e?.longDescription,
        e?.isAdmin,
        e?.religion,
        e?.alergias,
        e?.lugarOrigen,
        e?.lugarResidencia,
        e?.referidoPor,
        e?.dni,
        e?.tipoSangre,
        e?.seguroMedico,
        e?.infoFamiliar,
        e?.expediente,
        e?.peso,
        e?.talla,
        e?.nacionalidad,
        e?.completeProfile,
        e?.color,
        e?.icm,
        e?.zoomAccountID,
        e?.zoomClientID,
        e?.zoomSecretID,
        e?.zoomLinkInstantaneo,
        e?.permisos,
        e?.stripePkKey,
        e?.stripeSKKey,
        e?.availability,
        e?.configCompleta,
        e?.chatsIniciados,
        e?.cedulaProfesional,
        e?.certificadoPor,
        e?.horarios,
        e?.servicios,
        e?.equipo,
        e?.zoom,
        e?.stripe,
        e?.clinicas,
        e?.pacientes,
        e?.serviciosList,
        e?.especialidadList,
        e?.ciudad,
        e?.misDoctores,
        e?.blockList,
        e?.solicitudes,
        e?.onboardingComplete,
        e?.creditsAi,
        e?.stripeOAuthID,
        e?.seccioActualenMenu,
        e?.etapaIncorporacion
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
