import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/componentes/editar_citapaciente/editar_citapaciente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'acciones_citas_paciente_model.dart';
export 'acciones_citas_paciente_model.dart';

class AccionesCitasPacienteWidget extends StatefulWidget {
  const AccionesCitasPacienteWidget({
    super.key,
    required this.refCita,
  });

  final CitasRecord? refCita;

  @override
  State<AccionesCitasPacienteWidget> createState() =>
      _AccionesCitasPacienteWidgetState();
}

class _AccionesCitasPacienteWidgetState
    extends State<AccionesCitasPacienteWidget> with TickerProviderStateMixin {
  late AccionesCitasPacienteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccionesCitasPacienteModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: 270.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.blur_on_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Opciones de la Cita',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.refCita?.estado == 'Por Confirmar')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: EditarCitapacienteWidget(
                                          citaToEdit: widget.refCita!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Editar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.lato(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Icon(
                                        Icons.edit_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Stack(
                          children: [
                            if ((widget.refCita?.estado == 'Confirmada') &&
                                (_model.clicChat == false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.clicChat = true;
                                    safeSetState(() {});
                                    FFAppState().userschat = [];
                                    safeSetState(() {});
                                    FFAppState().addToUserschat(valueOrDefault(
                                                currentUserDocument?.role,
                                                '') ==
                                            'paciente'
                                        ? currentUserReference!
                                        : widget.refCita!.paciente!);
                                    safeSetState(() {});
                                    FFAppState().addToUserschat(
                                        widget.refCita!.doctor!);
                                    safeSetState(() {});
                                    _model.queryChat =
                                        await queryChatsRecordOnce(
                                      queryBuilder: (chatsRecord) => chatsRecord
                                          .where(
                                            'user_a',
                                            isEqualTo:
                                                widget.refCita?.paciente,
                                          )
                                          .where(
                                            'user_b',
                                            isEqualTo: widget.refCita?.doctor,
                                          ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    if (_model.queryChat?.reference != null) {
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        Chat2DetailsWidget.routeName,
                                        queryParameters: {
                                          'chatRef': serializeParam(
                                            _model.queryChat,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatRef': _model.queryChat,
                                        },
                                      );
                                    } else {
                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));
                                      _model.createThreadId =
                                          await CreateThreadIDCall.call();

                                      _shouldSetState = true;
                                      if ((_model.createThreadId?.succeeded ??
                                          true)) {
                                        // newChat

                                        var chatsRecordReference =
                                            ChatsRecord.collection.doc();
                                        await chatsRecordReference.set({
                                          ...createChatsRecordData(
                                            userA: widget.refCita?.paciente,
                                            userB: widget.refCita?.doctor,
                                            lastMessage: '',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageSentBy:
                                                currentUserReference,
                                            groupChatId:
                                                random_data.randomInteger(
                                                    1000000, 9999999),
                                            doctor: widget.refCita?.doctor,
                                            runAssistant: false,
                                            threadId:
                                                CreateThreadIDCall.threadId(
                                              (_model.createThreadId
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            clinica: widget.refCita?.clinica,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'users': FFAppState().userschat,
                                            },
                                          ),
                                        });
                                        _model.newChatThread1 =
                                            ChatsRecord.getDocumentFromData({
                                          ...createChatsRecordData(
                                            userA: widget.refCita?.paciente,
                                            userB: widget.refCita?.doctor,
                                            lastMessage: '',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageSentBy:
                                                currentUserReference,
                                            groupChatId:
                                                random_data.randomInteger(
                                                    1000000, 9999999),
                                            doctor: widget.refCita?.doctor,
                                            runAssistant: false,
                                            threadId:
                                                CreateThreadIDCall.threadId(
                                              (_model.createThreadId
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            clinica: widget.refCita?.clinica,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'users': FFAppState().userschat,
                                            },
                                          ),
                                        }, chatsRecordReference);
                                        _shouldSetState = true;

                                        await widget.refCita!.reference
                                            .update(createCitasRecordData(
                                          chatRef:
                                              _model.newChatThread1?.reference,
                                        ));

                                        await widget.refCita!.doctor!.update({
                                          ...mapToFirestore(
                                            {
                                              'ChatsIniciados':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          Chat2DetailsWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              _model.newChatThread1,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatRef': _model.newChatThread1,
                                          },
                                        );
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Chat',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.lato(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.chat_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if ((widget.refCita?.estado == 'Confirmada') &&
                                (_model.clicChat == true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Chat',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.lato(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.chat_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if ((widget.refCita?.estado == 'Por Confirmar') ||
                            (widget.refCita?.estado == 'Confirmada'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Cancelar cita'),
                                                content: Text(
                                                    'Estas seguro de eliminar esta cita?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  _model.dataDoctor =
                                      await UsersRecord.getDocumentOnce(
                                          widget.refCita!.doctor!);
                                  _model.dataService =
                                      await ServiciosRecord.getDocumentOnce(
                                          widget.refCita!.servicio!);
                                  _model.dataPaciente =
                                      await UsersRecord.getDocumentOnce(
                                          widget.refCita!.paciente!);
                                  await Future.delayed(
                                      const Duration(milliseconds: 300));

                                  await widget.refCita!.reference
                                      .update(createCitasRecordData(
                                    estado: 'Cancelada',
                                    color: FlutterFlowTheme.of(context).error,
                                    resumen: valueOrDefault<String>(
                                      '${dateTimeFormat(
                                        "jm",
                                        widget.refCita?.fechaCIta,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} | Dr. ${_model.dataDoctor?.displayName} | ${currentUserDisplayName} | ${_model.dataService?.nombreServicio} | ${widget.refCita?.tipoCita} | Cancelada',
                                      '[noData]',
                                    ),
                                  ));
                                  await EmailsResendGroup.cancelacionDeCitaCall
                                      .call(
                                    to: currentUserEmail,
                                    subject: 'Cita Cancelada',
                                    rescheduleUrl:
                                        'https://app.doctorcapi.com/citaspaciente',
                                    patientName: currentUserDisplayName,
                                    date: dateTimeFormat(
                                      "d/M",
                                      widget.refCita?.fechaCIta,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    time: dateTimeFormat(
                                      "jm",
                                      widget.refCita?.fechaCIta,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    consultationType: widget.refCita?.tipoCita,
                                  );

                                  await Future.delayed(
                                      const Duration(milliseconds: 300));
                                  await EmailsResendGroup.cancelacionDeCitaCall
                                      .call(
                                    to: _model.dataDoctor?.email,
                                    subject: 'Cita Cancelada',
                                    rescheduleUrl:
                                        'https://app.doctorcapi.com/citas',
                                    patientName: currentUserDisplayName,
                                    date: dateTimeFormat(
                                      "d/M",
                                      widget.refCita?.fechaCIta,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    time: dateTimeFormat(
                                      "jm",
                                      widget.refCita?.fechaCIta,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    consultationType: widget.refCita?.tipoCita,
                                  );

                                  var notificacionesRecordReference =
                                      NotificacionesRecord.collection.doc();
                                  await notificacionesRecordReference
                                      .set(createNotificacionesRecordData(
                                    createdDate: getCurrentTimestamp,
                                    sender: currentUserReference,
                                    clinica: widget.refCita?.clinica,
                                    titulo: 'Cita Cancelada',
                                    mensaje:
                                        'Saludos ${_model.dataDoctor?.displayName} su cita con el paciente ${currentUserDisplayName} de ${_model.dataService?.nombreServicio} para el dia ${dateTimeFormat(
                                      "E, MMMM d y - h:mm a",
                                      widget.refCita?.fechaCIta,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} fue cancelada.',
                                    especificUser: widget.refCita?.doctor,
                                    image: _model.dataService?.imagenServicio,
                                    citaRef: widget.refCita?.reference,
                                  ));
                                  _model.newNotificacion =
                                      NotificacionesRecord.getDocumentFromData(
                                          createNotificacionesRecordData(
                                            createdDate: getCurrentTimestamp,
                                            sender: currentUserReference,
                                            clinica: widget.refCita?.clinica,
                                            titulo: 'Cita Cancelada',
                                            mensaje:
                                                'Saludos ${_model.dataDoctor?.displayName} su cita con el paciente ${currentUserDisplayName} de ${_model.dataService?.nombreServicio} para el dia ${dateTimeFormat(
                                              "E, MMMM d y - h:mm a",
                                              widget.refCita?.fechaCIta,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} fue cancelada.',
                                            especificUser:
                                                widget.refCita?.doctor,
                                            image: _model
                                                .dataService?.imagenServicio,
                                            citaRef: widget.refCita?.reference,
                                          ),
                                          notificacionesRecordReference);
                                  await action_blocks.notificationAssitant(
                                    context,
                                    docCita: widget.refCita,
                                    clinica: _model.dataDoctor?.clinica,
                                    doctor: _model.dataDoctor,
                                    servicio: _model.dataService,
                                    paciente: _model.dataPaciente,
                                    motivo: 'cancelada',
                                  );

                                  await _model.newNotificacion!.reference
                                      .update(createNotificacionesRecordData(
                                    uid: _model.newNotificacion?.reference.id,
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Cita cancelada con exito!!!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Cancelar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.lato(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if ((widget.refCita?.estado == 'Concluida') ||
                            (widget.refCita?.estado == 'Cancelada'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 10.0),
                            child: Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Tu cita esta concluida o cancelada, no puedes realizar ninguna acción',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.lato(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
