import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horarios_config_onboarding_model.dart';
export 'horarios_config_onboarding_model.dart';

class HorariosConfigOnboardingWidget extends StatefulWidget {
  const HorariosConfigOnboardingWidget({super.key});

  @override
  State<HorariosConfigOnboardingWidget> createState() =>
      _HorariosConfigOnboardingWidgetState();
}

class _HorariosConfigOnboardingWidgetState
    extends State<HorariosConfigOnboardingWidget> {
  late HorariosConfigOnboardingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorariosConfigOnboardingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((currentUserDocument?.availability.toList() ?? []).isNotEmpty)) {
        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'availability': getAvailabilityListFirestoreData(
                functions.initialAvailability(9, 17),
              ),
            },
          ),
        });
      }
      FFAppState().availability =
          (currentUserDocument?.availability.toList() ?? [])
              .toList()
              .cast<AvailabilityStruct>();
      safeSetState(() {});
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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Horarios de la semana',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.quicksand(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Indica qué días de la semana se trabaja y el horario de cada día.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.lato(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Divider(
            height: 16.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent2,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Lunes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked1Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked1Time != null) {
                          safeSetState(() {
                            _model.datePicked1 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked1Time.hour,
                              _datePicked1Time.minute,
                            );
                          });
                        } else if (_model.datePicked1 != null) {
                          safeSetState(() {
                            _model.datePicked1 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          0,
                          (e) => e..startTime = _model.datePicked1,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(0)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(0)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(0)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked3,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked2Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked2Time != null) {
                          safeSetState(() {
                            _model.datePicked2 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked2Time.hour,
                              _datePicked2Time.minute,
                            );
                          });
                        } else if (_model.datePicked2 != null) {
                          safeSetState(() {
                            _model.datePicked2 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          0,
                          (e) => e..endTime = _model.datePicked2,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(0)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(0)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(0)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked2,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Martes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked3Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked3Time != null) {
                          safeSetState(() {
                            _model.datePicked3 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked3Time.hour,
                              _datePicked3Time.minute,
                            );
                          });
                        } else if (_model.datePicked3 != null) {
                          safeSetState(() {
                            _model.datePicked3 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          1,
                          (e) => e..startTime = _model.datePicked3,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(1)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(1)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(1)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked3,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked4Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked4Time != null) {
                          safeSetState(() {
                            _model.datePicked4 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked4Time.hour,
                              _datePicked4Time.minute,
                            );
                          });
                        } else if (_model.datePicked4 != null) {
                          safeSetState(() {
                            _model.datePicked4 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          1,
                          (e) => e..endTime = _model.datePicked4,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(1)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(1)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(1)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked4,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Miercoles',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked5Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked5Time != null) {
                          safeSetState(() {
                            _model.datePicked5 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked5Time.hour,
                              _datePicked5Time.minute,
                            );
                          });
                        } else if (_model.datePicked5 != null) {
                          safeSetState(() {
                            _model.datePicked5 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          2,
                          (e) => e..startTime = _model.datePicked5,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(2)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(2)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(2)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked5,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked6Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked6Time != null) {
                          safeSetState(() {
                            _model.datePicked6 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked6Time.hour,
                              _datePicked6Time.minute,
                            );
                          });
                        } else if (_model.datePicked6 != null) {
                          safeSetState(() {
                            _model.datePicked6 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          2,
                          (e) => e..endTime = _model.datePicked6,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(2)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(2)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(2)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked6,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Jueves',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked7Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked7Time != null) {
                          safeSetState(() {
                            _model.datePicked7 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked7Time.hour,
                              _datePicked7Time.minute,
                            );
                          });
                        } else if (_model.datePicked7 != null) {
                          safeSetState(() {
                            _model.datePicked7 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          3,
                          (e) => e..startTime = _model.datePicked7,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(3)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(3)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(3)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked7,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked8Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked8Time != null) {
                          safeSetState(() {
                            _model.datePicked8 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked8Time.hour,
                              _datePicked8Time.minute,
                            );
                          });
                        } else if (_model.datePicked8 != null) {
                          safeSetState(() {
                            _model.datePicked8 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          3,
                          (e) => e..endTime = _model.datePicked8,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(3)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(3)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(3)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked8,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Viernes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked9Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked9Time != null) {
                          safeSetState(() {
                            _model.datePicked9 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked9Time.hour,
                              _datePicked9Time.minute,
                            );
                          });
                        } else if (_model.datePicked9 != null) {
                          safeSetState(() {
                            _model.datePicked9 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          4,
                          (e) => e..startTime = _model.datePicked9,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(4)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(4)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(4)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked9,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked10Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked10Time != null) {
                          safeSetState(() {
                            _model.datePicked10 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked10Time.hour,
                              _datePicked10Time.minute,
                            );
                          });
                        } else if (_model.datePicked10 != null) {
                          safeSetState(() {
                            _model.datePicked10 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          4,
                          (e) => e..endTime = _model.datePicked10,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(4)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(4)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(4)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked10,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Sabado',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked11Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked11Time != null) {
                          safeSetState(() {
                            _model.datePicked11 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked11Time.hour,
                              _datePicked11Time.minute,
                            );
                          });
                        } else if (_model.datePicked11 != null) {
                          safeSetState(() {
                            _model.datePicked11 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          5,
                          (e) => e..startTime = _model.datePicked11,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(5)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(5)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(5)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked11,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked12Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked12Time != null) {
                          safeSetState(() {
                            _model.datePicked12 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked12Time.hour,
                              _datePicked12Time.minute,
                            );
                          });
                        } else if (_model.datePicked12 != null) {
                          safeSetState(() {
                            _model.datePicked12 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          5,
                          (e) => e..endTime = _model.datePicked12,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(5)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(5)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(5)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked12,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Domingo',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lato(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked13Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked13Time != null) {
                          safeSetState(() {
                            _model.datePicked13 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked13Time.hour,
                              _datePicked13Time.minute,
                            );
                          });
                        } else if (_model.datePicked13 != null) {
                          safeSetState(() {
                            _model.datePicked13 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          6,
                          (e) => e..startTime = _model.datePicked13,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState()
                                    .availability
                                    .elementAtOrNull(6)
                                    ?.startTime ==
                                null
                            ? 'Fecha Inicio'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(6)!
                                        .hasStartTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(6)
                                              ?.startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked13,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'Start Time',
                              ),
                        'Fecha Inicio',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.lato(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked14Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );
                        if (_datePicked14Time != null) {
                          safeSetState(() {
                            _model.datePicked14 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked14Time.hour,
                              _datePicked14Time.minute,
                            );
                          });
                        } else if (_model.datePicked14 != null) {
                          safeSetState(() {
                            _model.datePicked14 = getCurrentTimestamp;
                          });
                        }
                        FFAppState().updateAvailabilityAtIndex(
                          6,
                          (e) => e..endTime = _model.datePicked14,
                        );
                        safeSetState(() {});
                      },
                      text: valueOrDefault<String>(
                        FFAppState().availability.elementAtOrNull(6)?.endTime ==
                                null
                            ? 'Fecha Final'
                            : valueOrDefault<String>(
                                FFAppState()
                                        .availability
                                        .elementAtOrNull(6)!
                                        .hasEndTime()
                                    ? valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          FFAppState()
                                              .availability
                                              .elementAtOrNull(6)
                                              ?.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      )
                                    : valueOrDefault<String>(
                                        dateTimeFormat(
                                          "jm",
                                          _model.datePicked14,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '00:00',
                                      ),
                                'End Time',
                              ),
                        'Fecha Final',
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.lato(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SizedBox(
                        height: 30.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                      ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
          Divider(
            height: 16.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent2,
          ),
        ],
      ),
    );
  }
}
