import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'validacion_rol_model.dart';
export 'validacion_rol_model.dart';

class ValidacionRolWidget extends StatefulWidget {
  const ValidacionRolWidget({super.key});

  static String routeName = 'validacionRol';
  static String routePath = '/validacionRol';

  @override
  State<ValidacionRolWidget> createState() => _ValidacionRolWidgetState();
}

class _ValidacionRolWidgetState extends State<ValidacionRolWidget> {
  late ValidacionRolModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValidacionRolModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 700));
      if (loggedIn) {
        if (currentUserDocument?.etapaIncorporacion != null) {
          if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false)) {
            await actions.customPrint(
              'isAdmin',
            );
            await actions.customPrint(
              currentUserDocument!.etapaIncorporacion!.name,
            );
            if (currentUserDocument?.etapaIncorporacion ==
                EtapaIncorporacion.inicio_01) {
              context.pushNamedAuth(
                  CompletePerfilProfesionalWidget.routeName, context.mounted);
            } else {
              if (currentUserDocument?.etapaIncorporacion ==
                  EtapaIncorporacion.completoPerfil_02) {
                context.pushNamedAuth(
                    ConfiguracionOnboardingWidget.routeName, context.mounted);
              } else {
                if (currentUserDocument?.etapaIncorporacion ==
                    EtapaIncorporacion.configuroNegocio_03) {
                  context.pushNamedAuth(
                      PlanSubscripcionWidget.routeName, context.mounted);
                } else {
                  if (currentUserDocument?.etapaIncorporacion ==
                      EtapaIncorporacion.adquirioSuscripcion_04) {
                    context.pushNamedAuth(
                        PacientesWidget.routeName, context.mounted);
                  } else {
                    context.pushNamedAuth(
                        PlanSubscripcionWidget.routeName, context.mounted);
                  }
                }
              }
            }
          } else if (valueOrDefault(currentUserDocument?.role, '') ==
              Roles.Asistente.name) {
            await actions.customPrint(
              'isAsistente',
            );
            await actions.customPrint(
              currentUserDocument!.etapaIncorporacion!.name,
            );
            if (currentUserDocument?.etapaIncorporacion ==
                EtapaIncorporacion.inicio_01) {
              context.pushNamedAuth(
                  CompletePerfilProfesionalWidget.routeName, context.mounted);
            } else {
              if (currentUserDocument?.etapaIncorporacion ==
                  EtapaIncorporacion.completoPerfil_02) {
                context.pushNamedAuth(
                    ConfiguracionOnboardingWidget.routeName, context.mounted);
              } else {
                if (currentUserDocument?.etapaIncorporacion ==
                    EtapaIncorporacion.configuroNegocio_03) {
                  context.pushNamedAuth(
                      PlanSubscripcionWidget.routeName, context.mounted);
                } else {
                  if (currentUserDocument?.etapaIncorporacion ==
                      EtapaIncorporacion.aceptoInvitacion_05) {
                    context.pushNamedAuth(
                        PacientesWidget.routeName, context.mounted);
                  } else {
                    context.pushNamedAuth(
                        PlanSubscripcionWidget.routeName, context.mounted);
                  }
                }
              }
            }
          } else if (valueOrDefault(currentUserDocument?.role, '') ==
              Roles.Doctor.name) {
            await actions.customPrint(
              'isDoctor',
            );
            await actions.customPrint(
              currentUserDocument!.etapaIncorporacion!.name,
            );
            if (currentUserDocument?.etapaIncorporacion ==
                EtapaIncorporacion.inicio_01) {
              context.pushNamedAuth(
                  CompletePerfilProfesionalWidget.routeName, context.mounted);
            } else {
              if (currentUserDocument?.etapaIncorporacion ==
                  EtapaIncorporacion.completoPerfil_02) {
                context.pushNamedAuth(
                    ConfiguracionOnboardingWidget.routeName, context.mounted);
              } else {
                if (currentUserDocument?.etapaIncorporacion ==
                    EtapaIncorporacion.configuroNegocio_03) {
                  context.pushNamedAuth(
                      PlanSubscripcionWidget.routeName, context.mounted);
                } else {
                  if (currentUserDocument?.etapaIncorporacion ==
                      EtapaIncorporacion.aceptoInvitacion_05) {
                    context.pushNamedAuth(
                        PacientesWidget.routeName, context.mounted);
                  } else {
                    context.pushNamedAuth(
                        PlanSubscripcionWidget.routeName, context.mounted);
                  }
                }
              }
            }
          } else if (valueOrDefault(currentUserDocument?.role, '') ==
              Roles.Paciente.name) {
            await actions.customPrint(
              'isPaciente',
            );
            await actions.customPrint(
              currentUserDocument!.etapaIncorporacion!.name,
            );
            if (currentUserDocument?.etapaIncorporacion ==
                EtapaIncorporacion.inicio_01) {
              context.pushNamedAuth(
                  CompletePerfilpacienteWidget.routeName, context.mounted);
            } else {
              if (currentUserDocument?.etapaIncorporacion ==
                  EtapaIncorporacion.completoPerfil_02) {
                context.pushNamedAuth(
                    CitaspacienteWidget.routeName, context.mounted);
              }
            }
          } else {
            await actions.customPrint(
              'No es admin y no tiene rol',
            );
            await actions.customPrint(
              currentUserDocument!.etapaIncorporacion!.name,
            );
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();
          }
        } else {
          await currentUserReference!.update(createUsersRecordData(
            etapaIncorporacion: EtapaIncorporacion.inicio_01,
          ));

          context.pushNamedAuth(ValidacionRolWidget.routeName, context.mounted);
        }
      } else {
        await actions.customPrint(
          'Logout',
        );
        await actions.customPrint(
          currentUserDocument!.etapaIncorporacion!.name,
        );

        context.pushNamedAuth(InicioWidget.routeName, context.mounted);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
