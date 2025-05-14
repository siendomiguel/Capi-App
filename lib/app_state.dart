import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _viewStripeKeys = prefs.getBool('ff_viewStripeKeys') ?? _viewStripeKeys;
    });
    _safeInit(() {
      _availability = prefs
              .getStringList('ff_availability')
              ?.map((x) {
                try {
                  return AvailabilityStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _availability;
    });
    _safeInit(() {
      _ciudades = prefs.getStringList('ff_ciudades') ?? _ciudades;
    });
    _safeInit(() {
      _seleccionMenuOnboarding =
          prefs.getString('ff_seleccionMenuOnboarding') ??
              _seleccionMenuOnboarding;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _myCurrentLocation;
  LatLng? get myCurrentLocation => _myCurrentLocation;
  set myCurrentLocation(LatLng? value) {
    _myCurrentLocation = value;
  }

  String _mnuAdminOpt = 'General';
  String get mnuAdminOpt => _mnuAdminOpt;
  set mnuAdminOpt(String value) {
    _mnuAdminOpt = value;
  }

  List<AlergiasStruct> _alergias = [];
  List<AlergiasStruct> get alergias => _alergias;
  set alergias(List<AlergiasStruct> value) {
    _alergias = value;
  }

  void addToAlergias(AlergiasStruct value) {
    alergias.add(value);
  }

  void removeFromAlergias(AlergiasStruct value) {
    alergias.remove(value);
  }

  void removeAtIndexFromAlergias(int index) {
    alergias.removeAt(index);
  }

  void updateAlergiasAtIndex(
    int index,
    AlergiasStruct Function(AlergiasStruct) updateFn,
  ) {
    alergias[index] = updateFn(_alergias[index]);
  }

  void insertAtIndexInAlergias(int index, AlergiasStruct value) {
    alergias.insert(index, value);
  }

  List<InfoFamiliarStruct> _datosFamiliares = [];
  List<InfoFamiliarStruct> get datosFamiliares => _datosFamiliares;
  set datosFamiliares(List<InfoFamiliarStruct> value) {
    _datosFamiliares = value;
  }

  void addToDatosFamiliares(InfoFamiliarStruct value) {
    datosFamiliares.add(value);
  }

  void removeFromDatosFamiliares(InfoFamiliarStruct value) {
    datosFamiliares.remove(value);
  }

  void removeAtIndexFromDatosFamiliares(int index) {
    datosFamiliares.removeAt(index);
  }

  void updateDatosFamiliaresAtIndex(
    int index,
    InfoFamiliarStruct Function(InfoFamiliarStruct) updateFn,
  ) {
    datosFamiliares[index] = updateFn(_datosFamiliares[index]);
  }

  void insertAtIndexInDatosFamiliares(int index, InfoFamiliarStruct value) {
    datosFamiliares.insert(index, value);
  }

  String _mnuPacienteDetails = 'General';
  String get mnuPacienteDetails => _mnuPacienteDetails;
  set mnuPacienteDetails(String value) {
    _mnuPacienteDetails = value;
  }

  String _mnuCitasInitOpt = 'Confirmada';
  String get mnuCitasInitOpt => _mnuCitasInitOpt;
  set mnuCitasInitOpt(String value) {
    _mnuCitasInitOpt = value;
  }

  DateTime? _currentDay;
  DateTime? get currentDay => _currentDay;
  set currentDay(DateTime? value) {
    _currentDay = value;
  }

  bool _prevDay = false;
  bool get prevDay => _prevDay;
  set prevDay(bool value) {
    _prevDay = value;
  }

  bool _nextDay = false;
  bool get nextDay => _nextDay;
  set nextDay(bool value) {
    _nextDay = value;
  }

  bool _today = false;
  bool get today => _today;
  set today(bool value) {
    _today = value;
  }

  bool _showCalendar = false;
  bool get showCalendar => _showCalendar;
  set showCalendar(bool value) {
    _showCalendar = value;
  }

  String _mnuPacienteOpt = 'General';
  String get mnuPacienteOpt => _mnuPacienteOpt;
  set mnuPacienteOpt(String value) {
    _mnuPacienteOpt = value;
  }

  String _calendarView = 'day';
  String get calendarView => _calendarView;
  set calendarView(String value) {
    _calendarView = value;
  }

  CurrentMeetingStruct _currentMeeting = CurrentMeetingStruct();
  CurrentMeetingStruct get currentMeeting => _currentMeeting;
  set currentMeeting(CurrentMeetingStruct value) {
    _currentMeeting = value;
  }

  void updateCurrentMeetingStruct(Function(CurrentMeetingStruct) updateFn) {
    updateFn(_currentMeeting);
  }

  List<String> _tratamiento = [];
  List<String> get tratamiento => _tratamiento;
  set tratamiento(List<String> value) {
    _tratamiento = value;
  }

  void addToTratamiento(String value) {
    tratamiento.add(value);
  }

  void removeFromTratamiento(String value) {
    tratamiento.remove(value);
  }

  void removeAtIndexFromTratamiento(int index) {
    tratamiento.removeAt(index);
  }

  void updateTratamientoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tratamiento[index] = updateFn(_tratamiento[index]);
  }

  void insertAtIndexInTratamiento(int index, String value) {
    tratamiento.insert(index, value);
  }

  bool _viewStripeKeys = true;
  bool get viewStripeKeys => _viewStripeKeys;
  set viewStripeKeys(bool value) {
    _viewStripeKeys = value;
    prefs.setBool('ff_viewStripeKeys', value);
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
    prefs.setStringList(
        'ff_availability', value.map((x) => x.serialize()).toList());
  }

  void addToAvailability(AvailabilityStruct value) {
    availability.add(value);
    prefs.setStringList(
        'ff_availability', _availability.map((x) => x.serialize()).toList());
  }

  void removeFromAvailability(AvailabilityStruct value) {
    availability.remove(value);
    prefs.setStringList(
        'ff_availability', _availability.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAvailability(int index) {
    availability.removeAt(index);
    prefs.setStringList(
        'ff_availability', _availability.map((x) => x.serialize()).toList());
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    availability[index] = updateFn(_availability[index]);
    prefs.setStringList(
        'ff_availability', _availability.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    availability.insert(index, value);
    prefs.setStringList(
        'ff_availability', _availability.map((x) => x.serialize()).toList());
  }

  String _docRef = '';
  String get docRef => _docRef;
  set docRef(String value) {
    _docRef = value;
  }

  String _mnuDoctorOpt = 'Días de atención';
  String get mnuDoctorOpt => _mnuDoctorOpt;
  set mnuDoctorOpt(String value) {
    _mnuDoctorOpt = value;
  }

  String _mnuAsistOpt = 'Servicios';
  String get mnuAsistOpt => _mnuAsistOpt;
  set mnuAsistOpt(String value) {
    _mnuAsistOpt = value;
  }

  int _onboardingPage = 0;
  int get onboardingPage => _onboardingPage;
  set onboardingPage(int value) {
    _onboardingPage = value;
  }

  bool _seleccionoPaciente = false;
  bool get seleccionoPaciente => _seleccionoPaciente;
  set seleccionoPaciente(bool value) {
    _seleccionoPaciente = value;
  }

  bool _seleccionoServicio = false;
  bool get seleccionoServicio => _seleccionoServicio;
  set seleccionoServicio(bool value) {
    _seleccionoServicio = value;
  }

  bool _seleccionoDoctor = false;
  bool get seleccionoDoctor => _seleccionoDoctor;
  set seleccionoDoctor(bool value) {
    _seleccionoDoctor = value;
  }

  List<DocumentReference> _citas = [];
  List<DocumentReference> get citas => _citas;
  set citas(List<DocumentReference> value) {
    _citas = value;
  }

  void addToCitas(DocumentReference value) {
    citas.add(value);
  }

  void removeFromCitas(DocumentReference value) {
    citas.remove(value);
  }

  void removeAtIndexFromCitas(int index) {
    citas.removeAt(index);
  }

  void updateCitasAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    citas[index] = updateFn(_citas[index]);
  }

  void insertAtIndexInCitas(int index, DocumentReference value) {
    citas.insert(index, value);
  }

  int _WaitQuerySlots = 0;
  int get WaitQuerySlots => _WaitQuerySlots;
  set WaitQuerySlots(int value) {
    _WaitQuerySlots = value;
  }

  bool _ConfigHorarios = true;
  bool get ConfigHorarios => _ConfigHorarios;
  set ConfigHorarios(bool value) {
    _ConfigHorarios = value;
  }

  bool _ConfigStripe = false;
  bool get ConfigStripe => _ConfigStripe;
  set ConfigStripe(bool value) {
    _ConfigStripe = value;
  }

  bool _ConfigZoom = false;
  bool get ConfigZoom => _ConfigZoom;
  set ConfigZoom(bool value) {
    _ConfigZoom = value;
  }

  List<DocumentReference> _userschat = [];
  List<DocumentReference> get userschat => _userschat;
  set userschat(List<DocumentReference> value) {
    _userschat = value;
  }

  void addToUserschat(DocumentReference value) {
    userschat.add(value);
  }

  void removeFromUserschat(DocumentReference value) {
    userschat.remove(value);
  }

  void removeAtIndexFromUserschat(int index) {
    userschat.removeAt(index);
  }

  void updateUserschatAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    userschat[index] = updateFn(_userschat[index]);
  }

  void insertAtIndexInUserschat(int index, DocumentReference value) {
    userschat.insert(index, value);
  }

  bool _VerSlots = false;
  bool get VerSlots => _VerSlots;
  set VerSlots(bool value) {
    _VerSlots = value;
  }

  DateTime? _SelectSlots;
  DateTime? get SelectSlots => _SelectSlots;
  set SelectSlots(DateTime? value) {
    _SelectSlots = value;
  }

  List<int> _Listameses = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> get Listameses => _Listameses;
  set Listameses(List<int> value) {
    _Listameses = value;
  }

  void addToListameses(int value) {
    Listameses.add(value);
  }

  void removeFromListameses(int value) {
    Listameses.remove(value);
  }

  void removeAtIndexFromListameses(int index) {
    Listameses.removeAt(index);
  }

  void updateListamesesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    Listameses[index] = updateFn(_Listameses[index]);
  }

  void insertAtIndexInListameses(int index, int value) {
    Listameses.insert(index, value);
  }

  List<String> _cedulas = [];
  List<String> get cedulas => _cedulas;
  set cedulas(List<String> value) {
    _cedulas = value;
  }

  void addToCedulas(String value) {
    cedulas.add(value);
  }

  void removeFromCedulas(String value) {
    cedulas.remove(value);
  }

  void removeAtIndexFromCedulas(int index) {
    cedulas.removeAt(index);
  }

  void updateCedulasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cedulas[index] = updateFn(_cedulas[index]);
  }

  void insertAtIndexInCedulas(int index, String value) {
    cedulas.insert(index, value);
  }

  List<String> _certificaciones = [];
  List<String> get certificaciones => _certificaciones;
  set certificaciones(List<String> value) {
    _certificaciones = value;
  }

  void addToCertificaciones(String value) {
    certificaciones.add(value);
  }

  void removeFromCertificaciones(String value) {
    certificaciones.remove(value);
  }

  void removeAtIndexFromCertificaciones(int index) {
    certificaciones.removeAt(index);
  }

  void updateCertificacionesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    certificaciones[index] = updateFn(_certificaciones[index]);
  }

  void insertAtIndexInCertificaciones(int index, String value) {
    certificaciones.insert(index, value);
  }

  List<String> _docRef1 = [];
  List<String> get docRef1 => _docRef1;
  set docRef1(List<String> value) {
    _docRef1 = value;
  }

  void addToDocRef1(String value) {
    docRef1.add(value);
  }

  void removeFromDocRef1(String value) {
    docRef1.remove(value);
  }

  void removeAtIndexFromDocRef1(int index) {
    docRef1.removeAt(index);
  }

  void updateDocRef1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    docRef1[index] = updateFn(_docRef1[index]);
  }

  void insertAtIndexInDocRef1(int index, String value) {
    docRef1.insert(index, value);
  }

  List<DocumentReference> _Listaservicios = [];
  List<DocumentReference> get Listaservicios => _Listaservicios;
  set Listaservicios(List<DocumentReference> value) {
    _Listaservicios = value;
  }

  void addToListaservicios(DocumentReference value) {
    Listaservicios.add(value);
  }

  void removeFromListaservicios(DocumentReference value) {
    Listaservicios.remove(value);
  }

  void removeAtIndexFromListaservicios(int index) {
    Listaservicios.removeAt(index);
  }

  void updateListaserviciosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    Listaservicios[index] = updateFn(_Listaservicios[index]);
  }

  void insertAtIndexInListaservicios(int index, DocumentReference value) {
    Listaservicios.insert(index, value);
  }

  int _numbreIndexServicios = 0;
  int get numbreIndexServicios => _numbreIndexServicios;
  set numbreIndexServicios(int value) {
    _numbreIndexServicios = value;
  }

  DocumentReference? _uidEspecialidad;
  DocumentReference? get uidEspecialidad => _uidEspecialidad;
  set uidEspecialidad(DocumentReference? value) {
    _uidEspecialidad = value;
  }

  DocumentReference? _uidServicios;
  DocumentReference? get uidServicios => _uidServicios;
  set uidServicios(DocumentReference? value) {
    _uidServicios = value;
  }

  List<String> _ciudades = [
    'Ciudad de México',
    'Guadalajara',
    'Monterrey',
    'Puebla'
  ];
  List<String> get ciudades => _ciudades;
  set ciudades(List<String> value) {
    _ciudades = value;
    prefs.setStringList('ff_ciudades', value);
  }

  void addToCiudades(String value) {
    ciudades.add(value);
    prefs.setStringList('ff_ciudades', _ciudades);
  }

  void removeFromCiudades(String value) {
    ciudades.remove(value);
    prefs.setStringList('ff_ciudades', _ciudades);
  }

  void removeAtIndexFromCiudades(int index) {
    ciudades.removeAt(index);
    prefs.setStringList('ff_ciudades', _ciudades);
  }

  void updateCiudadesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ciudades[index] = updateFn(_ciudades[index]);
    prefs.setStringList('ff_ciudades', _ciudades);
  }

  void insertAtIndexInCiudades(int index, String value) {
    ciudades.insert(index, value);
    prefs.setStringList('ff_ciudades', _ciudades);
  }

  List<DocumentReference> _ListaEspecialidades = [];
  List<DocumentReference> get ListaEspecialidades => _ListaEspecialidades;
  set ListaEspecialidades(List<DocumentReference> value) {
    _ListaEspecialidades = value;
  }

  void addToListaEspecialidades(DocumentReference value) {
    ListaEspecialidades.add(value);
  }

  void removeFromListaEspecialidades(DocumentReference value) {
    ListaEspecialidades.remove(value);
  }

  void removeAtIndexFromListaEspecialidades(int index) {
    ListaEspecialidades.removeAt(index);
  }

  void updateListaEspecialidadesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    ListaEspecialidades[index] = updateFn(_ListaEspecialidades[index]);
  }

  void insertAtIndexInListaEspecialidades(int index, DocumentReference value) {
    ListaEspecialidades.insert(index, value);
  }

  DocumentReference? _clinicaDefault =
      FirebaseFirestore.instance.doc('/clinica/2n0JCNVOaI85GYFNLE8S');
  DocumentReference? get clinicaDefault => _clinicaDefault;
  set clinicaDefault(DocumentReference? value) {
    _clinicaDefault = value;
  }

  String _seleccionMenuOnboarding = '';
  String get seleccionMenuOnboarding => _seleccionMenuOnboarding;
  set seleccionMenuOnboarding(String value) {
    _seleccionMenuOnboarding = value;
    prefs.setString('ff_seleccionMenuOnboarding', value);
  }

  String _validarClinicaPorInvitacion = '';
  String get validarClinicaPorInvitacion => _validarClinicaPorInvitacion;
  set validarClinicaPorInvitacion(String value) {
    _validarClinicaPorInvitacion = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
