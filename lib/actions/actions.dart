import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes/generate_p_d_f_consulta/generate_p_d_f_consulta_widget.dart';
import '/componentes/view_p_d_f/view_p_d_f_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future notificationAssitant(
  BuildContext context, {
  required CitasRecord? docCita,
  required DocumentReference? clinica,
  required UsersRecord? doctor,
  required ServiciosRecord? servicio,
  required UsersRecord? paciente,
  required String? motivo,
}) async {
  UsersRecord? asistenteData1;
  ApiCallResponse? notificacionCItaCancelada;
  ApiCallResponse? notificationNuevaCita;
  NotificacionesRecord? newNotificationAssitant;

  asistenteData1 = await queryUsersRecordOnce(
    queryBuilder: (usersRecord) => usersRecord
        .where(
          'clinica',
          isEqualTo: clinica,
        )
        .where(
          'role',
          isEqualTo: 'Asistente',
        ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (asistenteData1?.email != null && asistenteData1?.email != '') {
    if (motivo == 'cancelada') {
      notificacionCItaCancelada =
          await EmailsResendGroup.cancelarCitaDoctorCall.call(
        to: asistenteData1?.email,
        subject: 'Cita Cancelada',
        rescheduleUrl: 'https://app.doctorcapi.com/citas',
        patientName: paciente?.displayName,
      );
    } else {
      notificationNuevaCita =
          await EmailsResendGroup.envoDeCorreoParaConsultaDelDoctorCall.call(
        to: asistenteData1?.email,
        link: 'https://app.doctorcapi.com/citas',
        paciente: currentUserDisplayName,
        tipConsulta: docCita?.tipoCita,
        date: dateTimeFormat(
          "d/M",
          docCita?.fechaCIta,
          locale: FFLocalizations.of(context).languageCode,
        ),
        hora: dateTimeFormat(
          "jm",
          docCita?.fechaCIta,
          locale: FFLocalizations.of(context).languageCode,
        ),
      );
    }

    var notificacionesRecordReference = NotificacionesRecord.collection.doc();
    await notificacionesRecordReference.set(createNotificacionesRecordData(
      createdDate: getCurrentTimestamp,
      sender: currentUserReference,
      titulo: () {
        if (motivo == 'nueva') {
          return 'Nueva Cita';
        } else if (motivo == 'cancelada') {
          return 'Cita Cancelada';
        } else {
          return 'Nueva notificación';
        }
      }(),
      mensaje: () {
        if (motivo == 'nueva') {
          return valueOrDefault<String>(
            'Saludos ${asistenteData1?.displayName}se genero una nueva cita para el ${dateTimeFormat(
              "d/M",
              docCita?.fechaCIta,
              locale: FFLocalizations.of(context).languageCode,
            )} a las ${dateTimeFormat(
              "jm",
              docCita?.fechaCIta,
              locale: FFLocalizations.of(context).languageCode,
            )} con el Dr. ${doctor?.displayName} en el area de ${servicio?.nombreServicio} con el paciente ${paciente?.displayName} revisa tu calendario por favor.',
            '[citaCreada]',
          );
        } else if (motivo == 'cancelada') {
          return valueOrDefault<String>(
            'Saludos ${asistenteData1?.displayName}la cita para el dia ${dateTimeFormat(
              "d/M",
              docCita?.fechaCIta,
              locale: FFLocalizations.of(context).languageCode,
            )} a las ${dateTimeFormat(
              "jm",
              docCita?.fechaCIta,
              locale: FFLocalizations.of(context).languageCode,
            )} con el Dr. ${doctor?.displayName} en el area de ${servicio?.nombreServicio} con el paciente ${paciente?.displayName}fue cancelada.',
            '[citaCreada]',
          );
        } else {
          return valueOrDefault<String>(
            'Saludos ${asistenteData1?.displayName} se genero esta notificacion es por defecto, alguna accion genero la notificacion pero no se especifico el motivo de la misma',
            '[citaCreada]',
          );
        }
      }(),
      especificUser: asistenteData1?.reference,
      image: servicio?.imagenServicio,
      citaRef: docCita?.reference,
      clinica: currentUserDocument?.clinica,
    ));
    newNotificationAssitant = NotificacionesRecord.getDocumentFromData(
        createNotificacionesRecordData(
          createdDate: getCurrentTimestamp,
          sender: currentUserReference,
          titulo: () {
            if (motivo == 'nueva') {
              return 'Nueva Cita';
            } else if (motivo == 'cancelada') {
              return 'Cita Cancelada';
            } else {
              return 'Nueva notificación';
            }
          }(),
          mensaje: () {
            if (motivo == 'nueva') {
              return valueOrDefault<String>(
                'Saludos ${asistenteData1?.displayName}se genero una nueva cita para el ${dateTimeFormat(
                  "d/M",
                  docCita?.fechaCIta,
                  locale: FFLocalizations.of(context).languageCode,
                )} a las ${dateTimeFormat(
                  "jm",
                  docCita?.fechaCIta,
                  locale: FFLocalizations.of(context).languageCode,
                )} con el Dr. ${doctor?.displayName} en el area de ${servicio?.nombreServicio} con el paciente ${paciente?.displayName} revisa tu calendario por favor.',
                '[citaCreada]',
              );
            } else if (motivo == 'cancelada') {
              return valueOrDefault<String>(
                'Saludos ${asistenteData1?.displayName}la cita para el dia ${dateTimeFormat(
                  "d/M",
                  docCita?.fechaCIta,
                  locale: FFLocalizations.of(context).languageCode,
                )} a las ${dateTimeFormat(
                  "jm",
                  docCita?.fechaCIta,
                  locale: FFLocalizations.of(context).languageCode,
                )} con el Dr. ${doctor?.displayName} en el area de ${servicio?.nombreServicio} con el paciente ${paciente?.displayName}fue cancelada.',
                '[citaCreada]',
              );
            } else {
              return valueOrDefault<String>(
                'Saludos ${asistenteData1?.displayName} se genero esta notificacion es por defecto, alguna accion genero la notificacion pero no se especifico el motivo de la misma',
                '[citaCreada]',
              );
            }
          }(),
          especificUser: asistenteData1?.reference,
          image: servicio?.imagenServicio,
          citaRef: docCita?.reference,
          clinica: currentUserDocument?.clinica,
        ),
        notificacionesRecordReference);

    await newNotificationAssitant.reference
        .update(createNotificacionesRecordData(
      uid: newNotificationAssitant.reference.id,
    ));
  }
}

/// Esta es la validacion de la navegacion del flujo del onboarding
Future navegacionMenuOnboarding(
  BuildContext context, {
  String? choiseSelect,
}) async {
  bool? isOnboardingSuccess;

  // Actualizar avance del usuario

  await currentUserReference!.update(createUsersRecordData(
    seccioActualenMenu: choiseSelect,
  ));
  isOnboardingSuccess = await actions.validarOnboarding(
    functions.userRoleConfOptions(() {
      if (valueOrDefault(currentUserDocument?.role, '') == 'Doctor') {
        return Roles.Doctor;
      } else if (valueOrDefault(currentUserDocument?.role, '') == 'Asistente') {
        return Roles.Asistente;
      } else {
        return Roles.Paciente;
      }
    }(), valueOrDefault<bool>(currentUserDocument?.isAdmin, false)).toList(),
    FFAppState().seleccionMenuOnboarding,
  );
  if (isOnboardingSuccess) {
    if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false) == true) {
      await currentUserReference!.update(createUsersRecordData(
        etapaIncorporacion: EtapaIncorporacion.configuroNegocio_03,
      ));

      context.pushNamed(
        PlanSubscripcionWidget.routeName,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
          ),
        },
      );
    } else {
      await currentUserReference!.update(createUsersRecordData(
        etapaIncorporacion: EtapaIncorporacion.aceptoInvitacion_05,
      ));

      context.pushNamed(
        ValidacionRolWidget.routeName,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
          ),
        },
      );
    }
  } else {
    context.pushNamed(
      ConfiguracionOnboardingWidget.routeName,
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
        ),
      },
    );
  }
}

/// Bloque de generacion de receta a traves del servidor Llamado de API
Future generateRecetaPDF(
  BuildContext context, {
  DocumentReference? clinica,
  DocumentReference? doctor,
  DocumentReference? diagnosticoTratamiento,
  DocumentReference? consulta,
  DocumentReference? cita,
  DocumentReference? paciente,
  List<String>? tratamiento,
}) async {
  dynamic browser;
  ClinicaRecord? dataClinica;
  UsersRecord? dataPaciente;
  UsersRecord? dataDoctor;
  DiagnosticoTratamientoRecord? dataDiagnosticoTratamiento;
  ApiCallResponse? base64PDFTrue;
  ApiCallResponse? base64PDFFalse;

  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: GeneratePDFConsultaWidget(),
        ),
      );
    },
  );

  browser = await actions.detectarNavegador();
  // dataClinica
  dataClinica = await ClinicaRecord.getDocumentOnce(clinica!);
  // dataPaciente
  dataPaciente = await UsersRecord.getDocumentOnce(paciente!);
  dataDoctor = await queryUsersRecordOnce(
    queryBuilder: (usersRecord) => usersRecord.where(
      'uid',
      isEqualTo: doctor?.id,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (diagnosticoTratamiento != null) {
    // dataDiagnostico
    dataDiagnosticoTratamiento =
        await DiagnosticoTratamientoRecord.getDocumentOnce(
            diagnosticoTratamiento);
    await Future.delayed(const Duration(milliseconds: 800));
    base64PDFTrue = await GeneratePDFCall.call(
      logoUrl: valueOrDefault<String>(
        dataClinica.logo != ''
            ? dataClinica.logo
            : dataDoctor?.photoUrl,
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/capi-app-hirb0z/assets/6dgu6sil58p7/foto_perfil_avatar.png',
      ),
      nombreMedico: valueOrDefault<String>(
        'Dr. ${dataDoctor?.nombre} ${dataDoctor?.apellidoPaterno} ${dataDoctor?.apellidoMaterno}',
        'Dr: N/A',
      ),
      nombrePaciente: dataPaciente.displayName,
      edadPaciente: '${dataPaciente.edad} años',
      telefono: valueOrDefault<String>(
        dataClinica.telefono != ''
            ? dataClinica.telefono
            : dataDoctor?.phoneNumber,
        '\"\"',
      ),
      fechaConsulta: valueOrDefault<String>(
        dateTimeFormat(
          "yMMMd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        'dd-mm-yyyy',
      ),
      direccion: dataClinica.direccionClinica != null
          ? '${dataClinica.direccionClinica.callePrincipal} ${dataClinica.direccionClinica.ciudad} ${dataClinica.direccionClinica.estado}'
          : '${dataDoctor?.direccion.callePrincipal} ${dataDoctor?.direccion.ciudad} ${dataDoctor?.direccion.estado}',
      certificadoPorList: dataDoctor?.certificadoPor,
      cedulasList: dataDoctor?.cedulaProfesional,
      medicamentosList: diagnosticoTratamiento != null
          ? dataDiagnosticoTratamiento.tratamiento
          : tratamiento,
    );

    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pop(context);
    if ((base64PDFTrue.succeeded ?? true)) {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ViewPDFWidget(
                pdfBase64: GeneratePDFCall.pdfBase64(
                  (base64PDFTrue?.jsonBody ?? ''),
                ),
              ),
            ),
          );
        },
      );
    }
  } else {
    await Future.delayed(const Duration(milliseconds: 800));
    base64PDFFalse = await GeneratePDFCall.call(
      logoUrl: valueOrDefault<String>(
        dataClinica.logo != ''
            ? dataClinica.logo
            : dataDoctor?.photoUrl,
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/capi-app-hirb0z/assets/6dgu6sil58p7/foto_perfil_avatar.png',
      ),
      nombreMedico: valueOrDefault<String>(
        'Dr. ${dataDoctor?.nombre} ${dataDoctor?.apellidoPaterno} ${dataDoctor?.apellidoMaterno}',
        'Dr: N/A',
      ),
      nombrePaciente: dataPaciente.displayName,
      edadPaciente: '${dataPaciente.edad} años',
      telefono: valueOrDefault<String>(
        dataClinica.telefono != ''
            ? dataClinica.telefono
            : dataDoctor?.phoneNumber,
        '\"\"',
      ),
      fechaConsulta: valueOrDefault<String>(
        dateTimeFormat(
          "yMMMd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        'dd-mm-yyyy',
      ),
      direccion: dataClinica.direccionClinica != null
          ? '${dataClinica.direccionClinica.callePrincipal} ${dataClinica.direccionClinica.ciudad} ${dataClinica.direccionClinica.estado}'
          : '${dataDoctor?.direccion.callePrincipal} ${dataDoctor?.direccion.ciudad} ${dataDoctor?.direccion.estado}',
      certificadoPorList: dataDoctor?.certificadoPor,
      cedulasList: dataDoctor?.cedulaProfesional,
      medicamentosList: tratamiento,
    );

    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pop(context);
    if ((base64PDFFalse.succeeded ?? true)) {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ViewPDFWidget(
                pdfBase64: GeneratePDFCall.pdfBase64(
                  (base64PDFFalse?.jsonBody ?? ''),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
