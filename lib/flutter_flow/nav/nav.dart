import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? ValidacionRolWidget() : InicioWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? ValidacionRolWidget()
              : InicioWidget(),
        ),
        FFRoute(
          name: EstadisticasWidget.routeName,
          path: EstadisticasWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EstadisticasWidget(),
        ),
        FFRoute(
          name: ConversacionesWidget.routeName,
          path: ConversacionesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConversacionesWidget(),
        ),
        FFRoute(
          name: PacientesWidget.routeName,
          path: PacientesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PacientesWidget(),
        ),
        FFRoute(
          name: CalendarioWidget.routeName,
          path: CalendarioWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CalendarioWidget(),
        ),
        FFRoute(
          name: CrearCuentaWidget.routeName,
          path: CrearCuentaWidget.routePath,
          builder: (context, params) => CrearCuentaWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: OlvidoContrasenaWidget.routeName,
          path: OlvidoContrasenaWidget.routePath,
          builder: (context, params) => OlvidoContrasenaWidget(),
        ),
        FFRoute(
          name: EditarPerfilWidget.routeName,
          path: EditarPerfilWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditarPerfilWidget(
            profileToEdit: params.getParam(
              'profileToEdit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: Chat2DetailsWidget.routeName,
          path: Chat2DetailsWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: Chat2InviteUsersWidget.routeName,
          path: Chat2InviteUsersWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ImageDetailsWidget.routeName,
          path: ImageDetailsWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PerfilWidget.routeName,
          path: PerfilWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PerfilWidget(),
        ),
        FFRoute(
          name: InicioWidget.routeName,
          path: InicioWidget.routePath,
          builder: (context, params) => InicioWidget(),
        ),
        FFRoute(
          name: CrearPacienteWidget.routeName,
          path: CrearPacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CrearPacienteWidget(),
        ),
        FFRoute(
          name: DetallesPacienteWidget.routeName,
          path: DetallesPacienteWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'pacienteDetails': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesPacienteWidget(
            pacienteDetails: params.getParam(
              'pacienteDetails',
              ParamType.Document,
            ),
            pacienteRef: params.getParam(
              'pacienteRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: CrearServicioWidget.routeName,
          path: CrearServicioWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CrearServicioWidget(
            onboarding: params.getParam(
              'onboarding',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ConfiguracionWidget.routeName,
          path: ConfiguracionWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConfiguracionWidget(
            select: params.getParam(
              'select',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MiPlanWidget.routeName,
          path: MiPlanWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MiPlanWidget(),
        ),
        FFRoute(
          name: CompletePerfilProfesionalWidget.routeName,
          path: CompletePerfilProfesionalWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CompletePerfilProfesionalWidget(),
        ),
        FFRoute(
          name: CitasWidget.routeName,
          path: CitasWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CitasWidget(),
        ),
        FFRoute(
          name: EditarPerfiEquipoWidget.routeName,
          path: EditarPerfiEquipoWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'memberToEdit': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => EditarPerfiEquipoWidget(
            memberToEdit: params.getParam(
              'memberToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesCitaWidget.routeName,
          path: DetallesCitaWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meetingDetail': getDoc(['citas'], CitasRecord.fromSnapshot),
            'servicio': getDoc(['servicios'], ServiciosRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesCitaWidget(
            meetingDetail: params.getParam(
              'meetingDetail',
              ParamType.Document,
            ),
            userData: params.getParam(
              'userData',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            servicio: params.getParam(
              'servicio',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesServicioWidget.routeName,
          path: DetallesServicioWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'serviceDetails':
                getDoc(['servicios'], ServiciosRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesServicioWidget(
            serviceDetails: params.getParam(
              'serviceDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ConfirmacionWidget.routeName,
          path: ConfirmacionWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meetingToConfirm': getDoc(['citas'], CitasRecord.fromSnapshot),
          },
          builder: (context, params) => ConfirmacionWidget(
            meetingToConfirm: params.getParam(
              'meetingToConfirm',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesMiembroEquipoWidget.routeName,
          path: DetallesMiembroEquipoWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'memberDetails': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesMiembroEquipoWidget(
            memberDetails: params.getParam(
              'memberDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: OnboardingpacienteWidget.routeName,
          path: OnboardingpacienteWidget.routePath,
          builder: (context, params) => OnboardingpacienteWidget(),
        ),
        FFRoute(
          name: LoginpacienteWidget.routeName,
          path: LoginpacienteWidget.routePath,
          builder: (context, params) => LoginpacienteWidget(),
        ),
        FFRoute(
          name: CompletePerfilpacienteWidget.routeName,
          path: CompletePerfilpacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CompletePerfilpacienteWidget(),
        ),
        FFRoute(
          name: OlvidoContrasenapacienteWidget.routeName,
          path: OlvidoContrasenapacienteWidget.routePath,
          builder: (context, params) => OlvidoContrasenapacienteWidget(),
        ),
        FFRoute(
          name: EditarPerfilpacienteWidget.routeName,
          path: EditarPerfilpacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditarPerfilpacienteWidget(),
        ),
        FFRoute(
          name: CalendariopacienteWidget.routeName,
          path: CalendariopacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CalendariopacienteWidget(),
        ),
        FFRoute(
          name: CitaspacienteWidget.routeName,
          path: CitaspacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CitaspacienteWidget(),
        ),
        FFRoute(
          name: ConversacionespacienteWidget.routeName,
          path: ConversacionespacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConversacionespacienteWidget(),
        ),
        FFRoute(
          name: PlanpacienteWidget.routeName,
          path: PlanpacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PlanpacienteWidget(),
        ),
        FFRoute(
          name: PerfilPacienteWidget.routeName,
          path: PerfilPacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PerfilPacienteWidget(),
        ),
        FFRoute(
          name: DetallesCitapacienteWidget.routeName,
          path: DetallesCitapacienteWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'cita': getDoc(['citas'], CitasRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesCitapacienteWidget(
            cita: params.getParam(
              'cita',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesdoctorWidget.routeName,
          path: DetallesdoctorWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'doctorDetails': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesdoctorWidget(
            doctorDetails: params.getParam(
              'doctorDetails',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: EditarServicioWidget.routeName,
          path: EditarServicioWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'serviceToEdit':
                getDoc(['servicios'], ServiciosRecord.fromSnapshot),
          },
          builder: (context, params) => EditarServicioWidget(
            serviceToEdit: params.getParam(
              'serviceToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CrearPerfilEquipoWidget.routeName,
          path: CrearPerfilEquipoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CrearPerfilEquipoWidget(
            onboarding: params.getParam(
              'onboarding',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EditarPacienteWidget.routeName,
          path: EditarPacienteWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'pacienteToEdit': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => EditarPacienteWidget(
            pacienteToEdit: params.getParam(
              'pacienteToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditarArchivoWidget.routeName,
          path: EditarArchivoWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'pacienteDetails': getDoc(['users'], UsersRecord.fromSnapshot),
            'archivosDetails': getDoc(
                ['estudiosArchivos'], EstudiosArchivosRecord.fromSnapshot),
          },
          builder: (context, params) => EditarArchivoWidget(
            pacienteDetails: params.getParam(
              'pacienteDetails',
              ParamType.Document,
            ),
            archivosDetails: params.getParam(
              'archivosDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CrearArchivoWidget.routeName,
          path: CrearArchivoWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'pacienteDetails': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => CrearArchivoWidget(
            pacienteDetails: params.getParam(
              'pacienteDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesPerfilPacienteWidget.routeName,
          path: DetallesPerfilPacienteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DetallesPerfilPacienteWidget(),
        ),
        FFRoute(
          name: ConsultaWidget.routeName,
          path: ConsultaWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'citaParaConsulta': getDoc(['citas'], CitasRecord.fromSnapshot),
            'servicio': getDoc(['servicios'], ServiciosRecord.fromSnapshot),
          },
          builder: (context, params) => ConsultaWidget(
            citaParaConsulta: params.getParam(
              'citaParaConsulta',
              ParamType.Document,
            ),
            servicio: params.getParam(
              'servicio',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PlanSubscripcionWidget.routeName,
          path: PlanSubscripcionWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PlanSubscripcionWidget(),
        ),
        FFRoute(
          name: DetallesConsultaWidget.routeName,
          path: DetallesConsultaWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'consultaDetails':
                getDoc(['consulta'], ConsultaRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesConsultaWidget(
            consultaDetails: params.getParam(
              'consultaDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PlanSubscripcionLoginWidget.routeName,
          path: PlanSubscripcionLoginWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PlanSubscripcionLoginWidget(),
        ),
        FFRoute(
          name: ConsultasWidget.routeName,
          path: ConsultasWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConsultasWidget(),
        ),
        FFRoute(
          name: SuccessPaymentWidget.routeName,
          path: SuccessPaymentWidget.routePath,
          builder: (context, params) => SuccessPaymentWidget(),
        ),
        FFRoute(
          name: CancelPaymentWidget.routeName,
          path: CancelPaymentWidget.routePath,
          builder: (context, params) => CancelPaymentWidget(),
        ),
        FFRoute(
          name: PdftestWidget.routeName,
          path: PdftestWidget.routePath,
          builder: (context, params) => PdftestWidget(),
        ),
        FFRoute(
          name: BuscadordoctoresWidget.routeName,
          path: BuscadordoctoresWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BuscadordoctoresWidget(),
        ),
        FFRoute(
          name: Test2Widget.routeName,
          path: Test2Widget.routePath,
          builder: (context, params) => Test2Widget(),
        ),
        FFRoute(
          name: MisdoctoresPacWidget.routeName,
          path: MisdoctoresPacWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MisdoctoresPacWidget(),
        ),
        FFRoute(
          name: ConversacionesAsistenteWidget.routeName,
          path: ConversacionesAsistenteWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConversacionesAsistenteWidget(),
        ),
        FFRoute(
          name: CrearArchivoPacienteWidget.routeName,
          path: CrearArchivoPacienteWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'pacienteDetails': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => CrearArchivoPacienteWidget(
            pacienteDetails: params.getParam(
              'pacienteDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SuccessStripeConnectWidget.routeName,
          path: SuccessStripeConnectWidget.routePath,
          builder: (context, params) => SuccessStripeConnectWidget(),
        ),
        FFRoute(
          name: ConfiguracionOnboardingWidget.routeName,
          path: ConfiguracionOnboardingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ConfiguracionOnboardingWidget(),
        ),
        FFRoute(
          name: ValidacionRolWidget.routeName,
          path: ValidacionRolWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ValidacionRolWidget(),
        ),
        FFRoute(
          name: FailedStripeConnectWidget.routeName,
          path: FailedStripeConnectWidget.routePath,
          builder: (context, params) => FailedStripeConnectWidget(),
        ),
        FFRoute(
          name: AceptarInvitacionWidget.routeName,
          path: AceptarInvitacionWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AceptarInvitacionWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/inicio';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Color(0xFFE9E9E9),
                      child: Image.asset(
                        'assets/images/INTRO_APP_CAPI.gif',
                        fit: BoxFit.contain,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
