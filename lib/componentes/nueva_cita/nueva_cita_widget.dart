import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/componentes/sin_horarios/sin_horarios_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/onboarding/slots_datepicker/slots_datepicker_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nueva_cita_model.dart';
export 'nueva_cita_model.dart';

class NuevaCitaWidget extends StatefulWidget {
  const NuevaCitaWidget({
    super.key,
    this.paciente,
  });

  final DocumentReference? paciente;

  @override
  State<NuevaCitaWidget> createState() => _NuevaCitaWidgetState();
}

class _NuevaCitaWidgetState extends State<NuevaCitaWidget>
    with TickerProviderStateMixin {
  late NuevaCitaModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaCitaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.otroHorarioDoctor = false;
      _model.selectDay = getCurrentTimestamp;
      _model.horario = null;
      _model.refPaciente = widget.paciente;
      safeSetState(() {});
      if (valueOrDefault(currentUserDocument?.role, '') == 'Asistente') {
        _model.citasquery = await queryCitasRecordOnce(
          queryBuilder: (citasRecord) => citasRecord.where(Filter.or(
            Filter(
              'clinica',
              isEqualTo: currentUserDocument?.clinica,
            ),
            Filter(
              'doctor',
              isEqualTo: _model.docID?.reference,
            ),
          )),
        );
        FFAppState().seleccionoPaciente = false;
        FFAppState().seleccionoServicio = false;
        FFAppState().seleccionoDoctor = false;
        FFAppState().VerSlots = false;
        FFAppState().SelectSlots = null;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 2000));
      } else {
        _model.citasqueryDoctor = await queryCitasRecordOnce(
          queryBuilder: (citasRecord) => citasRecord.where(Filter.or(
            Filter(
              'clinica',
              isEqualTo: currentUserDocument?.clinica,
            ),
            Filter(
              'doctor',
              isEqualTo: _model.docID?.reference,
            ),
          )),
        );
        FFAppState().seleccionoPaciente = false;
        FFAppState().seleccionoServicio = false;
        FFAppState().seleccionoDoctor = false;
        FFAppState().VerSlots = false;
        FFAppState().SelectSlots = null;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 2000));
      }
    });

    _model.switchValue = false;
    _model.observacionTextController ??= TextEditingController();
    _model.observacionFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord
              .where(
                'clinicas',
                arrayContains: currentUserDocument?.clinica,
              )
              .where(
                'role',
                isEqualTo: 'Paciente',
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> overlayUsersRecordList = snapshot.data!;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 16.0),
                    child: StreamBuilder<List<ServiciosRecord>>(
                      stream: queryServiciosRecord(
                        queryBuilder: (serviciosRecord) =>
                            serviciosRecord.where(
                          'clinica',
                          isEqualTo: currentUserDocument?.clinica,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ServiciosRecord> containerServiciosRecordList =
                            snapshot.data!;

                        return Container(
                          constraints: BoxConstraints(
                            maxWidth: 670.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Nueva cita',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .quicksand(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              icon: Icon(
                                                Icons.close_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                title: Text(
                                                                    'Confirmar'),
                                                                content: Text(
                                                                    'Desea salir de la configuracion de esta cita?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancelar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirmar'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  Navigator.pop(context);
                                                  FFAppState().VerSlots = false;
                                                  safeSetState(() {});
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 30.0),
                                            child: Text(
                                              'Completa los datos para añadir una cita.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Lugar',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowRadioButton(
                                                options: [
                                                  'Virtual',
                                                  'Presencial'
                                                ].toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() {}),
                                                controller: _model
                                                        .rdTipoCitaValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 32.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                selectedTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
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
                                                          fontSize: 18.0,
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
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.horizontal,
                                                radioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        if (widget.paciente == null)
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .ddPacienteValueController ??=
                                                FormFieldController<String>(
                                              _model.ddPacienteValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                overlayUsersRecordList
                                                    .where((e) =>
                                                        e.role == 'Paciente')
                                                    .toList()
                                                    .map((e) => e.reference.id)
                                                    .toList()),
                                            optionLabels: overlayUsersRecordList
                                                .where(
                                                    (e) => e.role == 'Paciente')
                                                .toList()
                                                .map((e) => e.displayName)
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.ddPacienteValue = val);
                                              _model.proID =
                                                  await queryUsersRecordOnce(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'uid',
                                                  isEqualTo:
                                                      _model.ddPacienteValue,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              FFAppState().seleccionoPaciente =
                                                  true;
                                              safeSetState(() {});
                                              _model.refPaciente =
                                                  _model.proID?.reference;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            width: double.infinity,
                                            height: 50.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.lato(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
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
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                                      fontSize: 16.0,
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
                                            hintText: 'Elija el paciente...',
                                            searchHintText:
                                                'Search for an item...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .ddServicioValueController ??=
                                                    FormFieldController<String>(
                                                  _model.ddServicioValue ??= '',
                                                ),
                                                options: List<String>.from(
                                                    containerServiciosRecordList
                                                        .where((e) =>
                                                            e.disponible ==
                                                            true)
                                                        .toList()
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels:
                                                    containerServiciosRecordList
                                                        .where((e) =>
                                                            e.disponible ==
                                                            true)
                                                        .toList()
                                                        .map((e) =>
                                                            valueOrDefault<
                                                                String>(
                                                              e.nombreServicio,
                                                              '[noService]',
                                                            ))
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                      .ddServicioValue = val);
                                                  _model.serviceID =
                                                      await queryServiciosRecordOnce(
                                                    queryBuilder:
                                                        (serviciosRecord) =>
                                                            serviciosRecord
                                                                .where(
                                                      'uid',
                                                      isEqualTo: _model
                                                          .ddServicioValue,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _model.refService = _model
                                                      .serviceID?.reference;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                width: 300.0,
                                                height: 50.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
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
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
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
                                                          fontSize: 16.0,
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
                                                hintText:
                                                    'Elija el servicio...',
                                                searchHintText:
                                                    'Search for an item...',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            if (!(containerServiciosRecordList
                                                .isNotEmpty))
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      CrearServicioWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'onboarding':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: 'Crear Servicio',
                                                  icon: Icon(
                                                    Icons.add_rounded,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 56.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord
                                                          .where(
                                                            'role',
                                                            isEqualTo: 'Doctor',
                                                          )
                                                          .where(
                                                            'clinica',
                                                            isEqualTo:
                                                                currentUserDocument
                                                                    ?.clinica,
                                                          ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      ddDoctorUsersRecordList =
                                                      snapshot.data!;

                                                  return FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .ddDoctorValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.ddDoctorValue ??=
                                                          '',
                                                    ),
                                                    options: List<String>.from(
                                                        ddDoctorUsersRecordList
                                                            .where((e) => e
                                                                .serviciosList
                                                                .contains(_model
                                                                    .refService))
                                                            .toList()
                                                            .map((e) =>
                                                                e.reference.id)
                                                            .toList()),
                                                    optionLabels:
                                                        ddDoctorUsersRecordList
                                                            .where((e) => e
                                                                .serviciosList
                                                                .contains(_model
                                                                    .refService))
                                                            .toList()
                                                            .map((e) =>
                                                                e.displayName)
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .ddDoctorValue = val);
                                                      _model.docID =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'uid',
                                                          isEqualTo: _model
                                                              .ddDoctorValue,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _model.refDoctor = _model
                                                          .docID?.reference;
                                                      safeSetState(() {});
                                                      FFAppState().SelectSlots =
                                                          getCurrentTimestamp;
                                                      safeSetState(() {});
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  2000));
                                                      FFAppState().VerSlots =
                                                          true;
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    width: 300.0,
                                                    height: 50.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .lato(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    searchTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .lato(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
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
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.lato(
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
                                                          fontSize: 16.0,
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
                                                    hintText:
                                                        'Elija el doctor...',
                                                    searchHintText:
                                                        'Search for an item...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!FFAppState().VerSlots)
                                              Text(
                                                '*Selecciona un doctor para visualizar sus horarios de disponibilidad',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
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
                                          ],
                                        ),
                                        if ((_model.otroHorarioDoctor ==
                                                false) &&
                                            FFAppState().VerSlots)
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 15.0,
                                                          10.0, 10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Elija su Fecha de Consulta',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .lato(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      if (FFAppState().VerSlots)
                                                        StreamBuilder<
                                                            List<CitasRecord>>(
                                                          stream:
                                                              queryCitasRecord(
                                                            queryBuilder:
                                                                (citasRecord) =>
                                                                    citasRecord
                                                                        .where(
                                                                          'clinica',
                                                                          isEqualTo:
                                                                              currentUserDocument?.clinica,
                                                                        )
                                                                        .where(
                                                                          'doctor',
                                                                          isEqualTo: _model.ddDoctorValue != null && _model.ddDoctorValue != ''
                                                                              ? _model.refDoctor
                                                                              : currentUserReference,
                                                                        ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CitasRecord>
                                                                containerCitasRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FlutterFlowCalendar(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    weekFormat:
                                                                        true,
                                                                    weekStartsMonday:
                                                                        true,
                                                                    initialDate:
                                                                        getCurrentTimestamp,
                                                                    rowHeight:
                                                                        48.0,
                                                                    onChange:
                                                                        (DateTimeRange?
                                                                            newSelectedDate) async {
                                                                      if (_model
                                                                              .calendarSelectedDay ==
                                                                          newSelectedDate) {
                                                                        return;
                                                                      }
                                                                      _model.calendarSelectedDay =
                                                                          newSelectedDate;
                                                                      _model.selectDay = _model
                                                                          .calendarSelectedDay
                                                                          ?.start;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    titleStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.quicksand(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                    dayOfWeekStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lato(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                    dateStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lato(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    selectedDateStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lato(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    inactiveDateStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lato(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      if (functions
                                                                              .getAvailabileSlots(containerCitasRecordList.map((e) => e.fechaCIta).withoutNulls.toList(), _model.datePicked != null ? _model.datePicked! : FFAppState().SelectSlots!, _model.docID?.availability.toList(), _model.serviceID!.duracion)!
                                                                              .length <=
                                                                          0)
                                                                        Container(
                                                                          height:
                                                                              200.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.sinHorariosModel,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                SinHorariosWidget(
                                                                              dias: _model.docID!.availability,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            180.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              15.0),
                                                                          child:
                                                                              FlutterFlowChoiceChips(
                                                                            options: functions
                                                                                .getAvailabileSlots(containerCitasRecordList.map((e) => e.fechaCIta).withoutNulls.toList(), _model.selectDay!, _model.docID?.availability.toList(), _model.serviceID!.duracion)!
                                                                                .map((e) => valueOrDefault<String>(
                                                                                      dateTimeFormat(
                                                                                        "jm",
                                                                                        e,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      '00:00',
                                                                                    ))
                                                                                .toList()
                                                                                .map((label) => ChipData(label))
                                                                                .toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
                                                                              FFAppState().SelectSlots = functions.convertSlots(_model.choiceChipsValue);
                                                                              safeSetState(() {});
                                                                              _model.horario = functions.convertSlotsTest(_model.choiceChipsValue, _model.calendarSelectedDay!.start);
                                                                              safeSetState(() {});
                                                                              await actions.customPrint(
                                                                                dateTimeFormat(
                                                                                  "d/M/y",
                                                                                  FFAppState().SelectSlots,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                              );
                                                                              await actions.customPrint(
                                                                                dateTimeFormat(
                                                                                  "d/M h:mm a",
                                                                                  _model.horario,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                              );
                                                                            },
                                                                            selectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.lato(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 4.0,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            unselectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.lato(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                              iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              iconSize: 18.0,
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            chipSpacing:
                                                                                12.0,
                                                                            rowSpacing:
                                                                                12.0,
                                                                            multiselect:
                                                                                false,
                                                                            alignment:
                                                                                WrapAlignment.center,
                                                                            controller: _model.choiceChipsValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                              [],
                                                                            ),
                                                                            wrapped:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if ((_model.otroHorarioDoctor ==
                                                false) &&
                                            (_model.horario != null))
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          'Horario seleccionado:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            dateTimeFormat(
                                                              "E, MMMM d y - h:mm a",
                                                              _model.horario,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().VerSlots)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Switch.adaptive(
                                                value: _model.switchValue!,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .switchValue = newValue);
                                                  if (newValue) {
                                                    _model.otroHorarioDoctor =
                                                        true;
                                                    _model.horario = null;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.otroHorarioDoctor =
                                                        false;
                                                    _model.horario = null;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Seleccionar otro horario',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (_model.otroHorarioDoctor == true)
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            dateTimeFormat(
                                                              "E, MMMM d y - h:mm a",
                                                              FFAppState()
                                                                  .SelectSlots,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final _datePickedDate =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    getCurrentTimestamp,
                                                                firstDate:
                                                                    getCurrentTimestamp,
                                                                lastDate:
                                                                    DateTime(
                                                                        2050),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return wrapInMaterialDatePickerTheme(
                                                                    context,
                                                                    child!,
                                                                    headerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    headerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    headerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.quicksand(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              32.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .fontStyle,
                                                                        ),
                                                                    pickerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    pickerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    selectedDateTimeBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    selectedDateTimeForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    actionButtonForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    iconSize:
                                                                        24.0,
                                                                  );
                                                                },
                                                              );

                                                              TimeOfDay?
                                                                  _datePickedTime;
                                                              if (_datePickedDate !=
                                                                  null) {
                                                                _datePickedTime =
                                                                    await showTimePicker(
                                                                  context:
                                                                      context,
                                                                  initialTime: TimeOfDay
                                                                      .fromDateTime(
                                                                          getCurrentTimestamp),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialTimePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.quicksand(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              if (_datePickedDate !=
                                                                      null &&
                                                                  _datePickedTime !=
                                                                      null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked =
                                                                      DateTime(
                                                                    _datePickedDate
                                                                        .year,
                                                                    _datePickedDate
                                                                        .month,
                                                                    _datePickedDate
                                                                        .day,
                                                                    _datePickedTime!
                                                                        .hour,
                                                                    _datePickedTime
                                                                        .minute,
                                                                  );
                                                                });
                                                              } else if (_model
                                                                      .datePicked !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked =
                                                                      getCurrentTimestamp;
                                                                });
                                                              }
                                                              FFAppState()
                                                                      .SelectSlots =
                                                                  _model
                                                                      .datePicked;
                                                              safeSetState(
                                                                  () {});
                                                              await actions
                                                                  .customPrint(
                                                                dateTimeFormat(
                                                                  "d/M h:mm a",
                                                                  _model
                                                                      .datePicked,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                              );
                                                              _model.demoCalendar =
                                                                  await queryCitasRecordOnce(
                                                                queryBuilder:
                                                                    (citasRecord) =>
                                                                        citasRecord
                                                                            .where(
                                                                              'clinica',
                                                                              isEqualTo: currentUserDocument?.clinica,
                                                                            )
                                                                            .where(
                                                                              'doctor',
                                                                              isEqualTo: _model.docID?.reference,
                                                                            ),
                                                              );
                                                              if (functions
                                                                  .getAvailabileSlots(
                                                                      _model
                                                                          .demoCalendar!
                                                                          .map((e) => e
                                                                              .fechaCIta)
                                                                          .withoutNulls
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .SelectSlots!,
                                                                      _model
                                                                          .docID
                                                                          ?.availability
                                                                          .toList(),
                                                                      _model
                                                                          .serviceID!
                                                                          .duracion)!
                                                                  .where((e) =>
                                                                      e ==
                                                                      FFAppState()
                                                                          .SelectSlots)
                                                                  .toList()
                                                                  .isNotEmpty) {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Advertencia'),
                                                                                content: Text('No hay espacios libre para hoy'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancelar'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirmar'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          WebViewAware(
                                                                        child:
                                                                            SlotsDatepickerWidget(
                                                                          slot:
                                                                              FFAppState().SelectSlots!,
                                                                          citas:
                                                                              _model.demoCalendar!,
                                                                          avilia:
                                                                              _model.docID!,
                                                                          servicio:
                                                                              _model.serviceID!,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .calendarCheck,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model
                                                .observacionTextController,
                                            focusNode:
                                                _model.observacionFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Observaciones',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              alignLabelWithHint: true,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 12.0),
                                            ),
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
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .observacionTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.05),
                                          child:
                                              StreamBuilder<List<CitasRecord>>(
                                            stream: queryCitasRecord(
                                              queryBuilder: (citasRecord) =>
                                                  citasRecord
                                                      .where(
                                                        'clinica',
                                                        isEqualTo:
                                                            currentUserDocument
                                                                ?.clinica,
                                                      )
                                                      .where(
                                                        'doctor',
                                                        isEqualTo: _model
                                                            .docID?.reference,
                                                      ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CitasRecord>
                                                  buttonCitasRecordList =
                                                  snapshot.data!;

                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  if (widget.paciente !=
                                                      null) {
                                                  } else if (_model
                                                          .refPaciente ==
                                                      null) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Datos Incompletos'),
                                                            content: Text(
                                                                'Debes elegir a un paciente.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Confirmar'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  if (!(_model.ddServicioValue !=
                                                          null &&
                                                      _model.ddServicioValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Datos Incompletos'),
                                                            content: Text(
                                                                'Debes escoger un servicio para la cita!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Confirmar'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                  if (!(_model.ddDoctorValue !=
                                                          null &&
                                                      _model.ddDoctorValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Datos Incompletos'),
                                                            content: Text(
                                                                'Selecciona un doctor por favor!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Confirmar'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                  if (!(_model.rdTipoCitaValue !=
                                                          null &&
                                                      _model.rdTipoCitaValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Datos Incompletos'),
                                                            content: Text(
                                                                'Selecciona el tipo de cita'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Confirmar'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                  if ((_model.horario !=
                                                          null) ||
                                                      (FFAppState()
                                                              .SelectSlots !=
                                                          null)) {
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .rdTipoCitaValue ==
                                                        null) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Datos incompletos'),
                                                              content: Text(
                                                                  'Escoge el tipo de cita por favor!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      return;
                                                    }
                                                    _model.dataPaciente =
                                                        await UsersRecord
                                                            .getDocumentOnce(_model
                                                                .refPaciente!);

                                                    var citasRecordReference =
                                                        CitasRecord.collection
                                                            .doc();
                                                    await citasRecordReference
                                                        .set(
                                                            createCitasRecordData(
                                                      tipoCita: _model
                                                          .rdTipoCitaValue,
                                                      paciente:
                                                          widget.paciente !=
                                                                  null
                                                              ? widget.paciente
                                                              : _model.proID
                                                                  ?.reference,
                                                      createdDate:
                                                          getCurrentTimestamp,
                                                      estado: 'Confirmada',
                                                      duracion:
                                                          valueOrDefault<int>(
                                                        _model.serviceID
                                                            ?.duracion,
                                                        30,
                                                      ),
                                                      precio: _model
                                                          .serviceID?.precio,
                                                      servicio: _model
                                                          .serviceID?.reference,
                                                      observaciones: _model
                                                          .observacionTextController
                                                          .text,
                                                      doctor: _model
                                                          .docID?.reference,
                                                      color: Color(0xFF07A7D5),
                                                      paymentStatus:
                                                          'pendiente',
                                                      fechaCIta:
                                                          _model.horario != null
                                                              ? _model.horario
                                                              : FFAppState()
                                                                  .SelectSlots,
                                                      nombrePaciente: _model
                                                          .dataPaciente
                                                          ?.displayName,
                                                      clinica:
                                                          currentUserDocument
                                                              ?.clinica,
                                                      doctorAprobado: false,
                                                    ));
                                                    _model.crearCita = CitasRecord
                                                        .getDocumentFromData(
                                                            createCitasRecordData(
                                                              tipoCita: _model
                                                                  .rdTipoCitaValue,
                                                              paciente: widget
                                                                          .paciente !=
                                                                      null
                                                                  ? widget
                                                                      .paciente
                                                                  : _model.proID
                                                                      ?.reference,
                                                              createdDate:
                                                                  getCurrentTimestamp,
                                                              estado:
                                                                  'Confirmada',
                                                              duracion:
                                                                  valueOrDefault<
                                                                      int>(
                                                                _model.serviceID
                                                                    ?.duracion,
                                                                30,
                                                              ),
                                                              precio: _model
                                                                  .serviceID
                                                                  ?.precio,
                                                              servicio: _model
                                                                  .serviceID
                                                                  ?.reference,
                                                              observaciones: _model
                                                                  .observacionTextController
                                                                  .text,
                                                              doctor: _model
                                                                  .docID
                                                                  ?.reference,
                                                              color: Color(
                                                                  0xFF07A7D5),
                                                              paymentStatus:
                                                                  'pendiente',
                                                              fechaCIta: _model
                                                                          .horario !=
                                                                      null
                                                                  ? _model
                                                                      .horario
                                                                  : FFAppState()
                                                                      .SelectSlots,
                                                              nombrePaciente: _model
                                                                  .dataPaciente
                                                                  ?.displayName,
                                                              clinica:
                                                                  currentUserDocument
                                                                      ?.clinica,
                                                              doctorAprobado:
                                                                  false,
                                                            ),
                                                            citasRecordReference);

                                                    await _model
                                                        .crearCita!.reference
                                                        .update(
                                                            createCitasRecordData(
                                                      uid: _model.crearCita
                                                          ?.reference.id,
                                                    ));
                                                    if (_model
                                                            .rdTipoCitaValue ==
                                                        'Virtual') {
                                                      _model.dataClinica =
                                                          await ClinicaRecord
                                                              .getDocumentOnce(
                                                                  currentUserDocument!
                                                                      .clinica!);

                                                      await _model
                                                          .crearCita!.reference
                                                          .update(
                                                              createCitasRecordData(
                                                        linkZoom: _model
                                                            .dataClinica
                                                            ?.zoomLinkInstantaneo,
                                                      ));
                                                    }

                                                    var notificacionesRecordReference =
                                                        NotificacionesRecord
                                                            .collection
                                                            .doc();
                                                    await notificacionesRecordReference
                                                        .set(
                                                            createNotificacionesRecordData(
                                                      createdDate:
                                                          getCurrentTimestamp,
                                                      sender:
                                                          currentUserReference,
                                                      titulo:
                                                          'Nueva Cita Medica',
                                                      mensaje: valueOrDefault<
                                                          String>(
                                                        'Saludos ${valueOrDefault<String>(
                                                          _model.proID?.nombre,
                                                          '[noName]',
                                                        )} tienes una cita el ${_model.horario != null ? dateTimeFormat(
                                                            "d/M/y",
                                                            _model.horario,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) : dateTimeFormat(
                                                            "d/M/y",
                                                            FFAppState()
                                                                .SelectSlots,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )} a las ${_model.horario != null ? dateTimeFormat(
                                                            "jm",
                                                            _model.horario,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) : dateTimeFormat(
                                                            "jm",
                                                            FFAppState()
                                                                .SelectSlots,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )} con el Dr. ${_model.docID?.displayName} en el area de ${_model.serviceID?.nombreServicio} revisa tu calendario por favor.',
                                                        '[citaCreada]',
                                                      ),
                                                      especificUser: _model
                                                          .proID?.reference,
                                                      image: _model.serviceID
                                                          ?.imagenServicio,
                                                      citaRef: _model
                                                          .crearCita?.reference,
                                                      clinica:
                                                          currentUserDocument
                                                              ?.clinica,
                                                    ));
                                                    _model.newNotification =
                                                        NotificacionesRecord
                                                            .getDocumentFromData(
                                                                createNotificacionesRecordData(
                                                                  createdDate:
                                                                      getCurrentTimestamp,
                                                                  sender:
                                                                      currentUserReference,
                                                                  titulo:
                                                                      'Nueva Cita Medica',
                                                                  mensaje:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'Saludos ${valueOrDefault<String>(
                                                                      _model
                                                                          .proID
                                                                          ?.nombre,
                                                                      '[noName]',
                                                                    )} tienes una cita el ${_model.horario != null ? dateTimeFormat(
                                                                        "d/M/y",
                                                                        _model
                                                                            .horario,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) : dateTimeFormat(
                                                                        "d/M/y",
                                                                        FFAppState()
                                                                            .SelectSlots,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} a las ${_model.horario != null ? dateTimeFormat(
                                                                        "jm",
                                                                        _model
                                                                            .horario,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) : dateTimeFormat(
                                                                        "jm",
                                                                        FFAppState()
                                                                            .SelectSlots,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} con el Dr. ${_model.docID?.displayName} en el area de ${_model.serviceID?.nombreServicio} revisa tu calendario por favor.',
                                                                    '[citaCreada]',
                                                                  ),
                                                                  especificUser:
                                                                      _model
                                                                          .proID
                                                                          ?.reference,
                                                                  image: _model
                                                                      .serviceID
                                                                      ?.imagenServicio,
                                                                  citaRef: _model
                                                                      .crearCita
                                                                      ?.reference,
                                                                  clinica:
                                                                      currentUserDocument
                                                                          ?.clinica,
                                                                ),
                                                                notificacionesRecordReference);
                                                    await action_blocks
                                                        .notificationAssitant(
                                                      context,
                                                      docCita: _model.crearCita,
                                                      clinica:
                                                          currentUserDocument
                                                              ?.clinica,
                                                      doctor: _model.docID,
                                                      servicio:
                                                          _model.serviceID,
                                                      paciente:
                                                          _model.dataPaciente,
                                                      motivo: 'nueva',
                                                    );
                                                    await actions.customPrint(
                                                      'despues de crear notificacion',
                                                    );
                                                    if (widget.paciente !=
                                                        null) {
                                                      _model.pacienteDatosParametro =
                                                          await UsersRecord
                                                              .getDocumentOnce(
                                                                  widget
                                                                      .paciente!);

                                                      await _model
                                                          .crearCita!.reference
                                                          .update(
                                                              createCitasRecordData(
                                                        resumen: valueOrDefault<
                                                            String>(
                                                          '${valueOrDefault<String>(
                                                            _model.horario !=
                                                                    null
                                                                ? dateTimeFormat(
                                                                    "jm",
                                                                    _model
                                                                        .horario,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )
                                                                : dateTimeFormat(
                                                                    "jm",
                                                                    FFAppState()
                                                                        .SelectSlots,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                            'null',
                                                          )} | Dr. ${_model.docID?.displayName} | ${_model.pacienteDatosParametro?.displayName} | ${_model.serviceID?.nombreServicio} | ${_model.rdTipoCitaValue} | ${_model.crearCita?.estado}',
                                                          '[noData]',
                                                        ),
                                                      ));
                                                      await actions.customPrint(
                                                        'despues de leer documento ususario paciente',
                                                      );
                                                      // Envio de correo al paciente
                                                      // Email Paciente
                                                      await EmailsResendGroup
                                                          .consultaConfirmadaCall
                                                          .call(
                                                        to: _model
                                                            .pacienteDatosParametro
                                                            ?.email,
                                                        subject: 'Nueva cita!',
                                                        appointmentsLink:
                                                            'https://app.doctorcapi.com/citaspaciente',
                                                        patientName: _model
                                                            .pacienteDatosParametro
                                                            ?.displayName,
                                                        consultationType: _model
                                                            .rdTipoCitaValue,
                                                        date: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "d/M/y",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "d/M/y",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        time: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "jm",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "jm",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                      );

                                                      await actions.customPrint(
                                                        'despues de enviar primer correo',
                                                      );
                                                      // Envio de correo al doctor
                                                      // Email doctor
                                                      await EmailsResendGroup
                                                          .envoDeCorreoParaConsultaDelDoctorCall
                                                          .call(
                                                        to: _model.docID?.email,
                                                        link:
                                                            'https://app.doctorcapi.com/citas',
                                                        paciente: _model
                                                            .pacienteDatosParametro
                                                            ?.displayName,
                                                        tipConsulta: _model
                                                            .rdTipoCitaValue,
                                                        date: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "d/M/y",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "d/M/y",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        hora: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "jm",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "jm",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                      );

                                                      _model.dataAsistenteTrue =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'clinica',
                                                                      isEqualTo: _model
                                                                          .docID
                                                                          ?.clinica,
                                                                    )
                                                                    .where(
                                                                      'role',
                                                                      isEqualTo:
                                                                          'Asistente',
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model.dataAsistenteTrue
                                                                  ?.email !=
                                                              null &&
                                                          _model.dataAsistenteTrue
                                                                  ?.email !=
                                                              '') {
                                                        await EmailsResendGroup
                                                            .envoDeCorreoParaConsultaDelDoctorCall
                                                            .call(
                                                          to: valueOrDefault<
                                                              String>(
                                                            _model
                                                                .dataAsistenteTrue
                                                                ?.email,
                                                            'test.test@test.com',
                                                          ),
                                                          link:
                                                              'https://app.doctorcapi.com/citas',
                                                          paciente: _model
                                                              .pacienteDatosParametro
                                                              ?.displayName,
                                                          tipConsulta: _model
                                                              .rdTipoCitaValue,
                                                          date: _model.horario !=
                                                                  null
                                                              ? dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .horario,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "d/M/y",
                                                                  FFAppState()
                                                                      .SelectSlots,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                          hora: _model.horario !=
                                                                  null
                                                              ? dateTimeFormat(
                                                                  "jm",
                                                                  _model
                                                                      .horario,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "jm",
                                                                  FFAppState()
                                                                      .SelectSlots,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                        );

                                                        await actions
                                                            .customPrint(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .dataAsistenteTrue
                                                                ?.email,
                                                            'test.test@test.com',
                                                          ),
                                                        );
                                                      }
                                                      await actions.customPrint(
                                                        'despues de enviar segundo correo',
                                                      );

                                                      await _model
                                                          .newNotification!
                                                          .reference
                                                          .update(
                                                              createNotificacionesRecordData(
                                                        uid: _model
                                                            .newNotification
                                                            ?.reference
                                                            .id,
                                                      ));
                                                      FFAppState()
                                                              .mnuPacienteDetails =
                                                          'Citas';
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Cita creada con éxito.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                      FFAppState().VerSlots =
                                                          false;
                                                      safeSetState(() {});
                                                      Navigator.pop(context);
                                                    } else {
                                                      _model.pacienteDatosState =
                                                          await UsersRecord
                                                              .getDocumentOnce(
                                                                  _model
                                                                      .refPaciente!);

                                                      await _model
                                                          .crearCita!.reference
                                                          .update(
                                                              createCitasRecordData(
                                                        resumen: valueOrDefault<
                                                            String>(
                                                          '${valueOrDefault<String>(
                                                            _model.horario !=
                                                                    null
                                                                ? dateTimeFormat(
                                                                    "jm",
                                                                    _model
                                                                        .horario,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )
                                                                : dateTimeFormat(
                                                                    "jm",
                                                                    FFAppState()
                                                                        .SelectSlots,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                            'null',
                                                          )} | Dr. ${_model.docID?.displayName} | ${_model.pacienteDatosState?.displayName} | ${_model.serviceID?.nombreServicio} | ${_model.rdTipoCitaValue} | ${_model.crearCita?.estado}',
                                                          '[noData]',
                                                        ),
                                                      ));
                                                      await actions.customPrint(
                                                        'despues de leer documento ususario paciente',
                                                      );
                                                      await EmailsResendGroup
                                                          .consultaConfirmadaCall
                                                          .call(
                                                        to: _model
                                                            .pacienteDatosState
                                                            ?.email,
                                                        subject: 'Nueva cita !',
                                                        appointmentsLink:
                                                            'https://app.doctorcapi.com/citaspaciente',
                                                        patientName: _model
                                                            .pacienteDatosState
                                                            ?.displayName,
                                                        consultationType: _model
                                                            .rdTipoCitaValue,
                                                        date: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "d/M/y",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "d/M/y",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        time: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "jm",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "jm",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                      );

                                                      await actions.customPrint(
                                                        'despues de enviar primer correo',
                                                      );
                                                      await EmailsResendGroup
                                                          .envoDeCorreoParaConsultaDelDoctorCall
                                                          .call(
                                                        to: _model.docID?.email,
                                                        link:
                                                            'https://app.doctorcapi.com/citas',
                                                        paciente: _model
                                                            .pacienteDatosState
                                                            ?.displayName,
                                                        tipConsulta: _model
                                                            .rdTipoCitaValue,
                                                        date: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "d/M/y",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "d/M/y",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        hora: _model.horario !=
                                                                null
                                                            ? dateTimeFormat(
                                                                "jm",
                                                                _model.horario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "jm",
                                                                FFAppState()
                                                                    .SelectSlots,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                      );

                                                      _model.dataAsistenteFalse =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'clinica',
                                                                      isEqualTo: _model
                                                                          .docID
                                                                          ?.clinica,
                                                                    )
                                                                    .where(
                                                                      'role',
                                                                      isEqualTo:
                                                                          'Asistente',
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model.dataAsistenteFalse
                                                                  ?.email !=
                                                              null &&
                                                          _model.dataAsistenteFalse
                                                                  ?.email !=
                                                              '') {
                                                        await EmailsResendGroup
                                                            .envoDeCorreoParaConsultaDelDoctorCall
                                                            .call(
                                                          to: valueOrDefault<
                                                              String>(
                                                            _model
                                                                .dataAsistenteFalse
                                                                ?.email,
                                                            'test.test@test.com',
                                                          ),
                                                          link:
                                                              'https://app.doctorcapi.com/citas',
                                                          paciente: _model
                                                              .pacienteDatosState
                                                              ?.displayName,
                                                          tipConsulta: _model
                                                              .rdTipoCitaValue,
                                                          date: _model.horario !=
                                                                  null
                                                              ? dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .horario,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "d/M/y",
                                                                  FFAppState()
                                                                      .SelectSlots,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                          hora: _model.horario !=
                                                                  null
                                                              ? dateTimeFormat(
                                                                  "jm",
                                                                  _model
                                                                      .horario,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "jm",
                                                                  FFAppState()
                                                                      .SelectSlots,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                        );

                                                        await actions
                                                            .customPrint(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .dataAsistenteFalse
                                                                ?.email,
                                                            'test.test@test.com',
                                                          ),
                                                        );
                                                      }
                                                      await actions.customPrint(
                                                        'despues de enviar segundo correo',
                                                      );

                                                      await _model
                                                          .newNotification!
                                                          .reference
                                                          .update(
                                                              createNotificacionesRecordData(
                                                        uid: _model
                                                            .newNotification
                                                            ?.reference
                                                            .id,
                                                      ));
                                                      FFAppState()
                                                              .mnuPacienteDetails =
                                                          'Citas';
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Cita creada con éxito.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                      FFAppState().VerSlots =
                                                          false;
                                                      safeSetState(() {});
                                                      Navigator.pop(context);
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Datos Incompletos'),
                                                            content: Text(
                                                                'Selecciona la fecha y hora'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Crear cita',
                                                options: FFButtonOptions(
                                                  width: 170.0,
                                                  height: 56.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
