import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'slots_datepicker_model.dart';
export 'slots_datepicker_model.dart';

class SlotsDatepickerWidget extends StatefulWidget {
  const SlotsDatepickerWidget({
    super.key,
    required this.slot,
    required this.citas,
    required this.avilia,
    required this.servicio,
  });

  final DateTime? slot;
  final List<CitasRecord>? citas;
  final UsersRecord? avilia;
  final ServiciosRecord? servicio;

  @override
  State<SlotsDatepickerWidget> createState() => _SlotsDatepickerWidgetState();
}

class _SlotsDatepickerWidgetState extends State<SlotsDatepickerWidget> {
  late SlotsDatepickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlotsDatepickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.769,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'El horario ${dateTimeFormat(
                "jm",
                widget.slot,
                locale: FFLocalizations.of(context).languageCode,
              )} no está disponible. ',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.lato(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  FFAppState().SelectSlots = widget.slot;
                  safeSetState(() {});
                  Navigator.pop(context);
                },
                text: 'Usar de todos modos',
                options: FFButtonOptions(
                  height: 50.0,
                  padding: EdgeInsets.all(10.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.lato(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            if (functions.getAvailabileSlots(
                        widget.citas!
                            .map((e) => e.fechaCIta)
                            .withoutNulls
                            .toList(),
                        widget.slot!,
                        widget.avilia?.availability.toList(),
                        widget.servicio!.duracion) !=
                    null &&
                (functions.getAvailabileSlots(
                        widget.citas!
                            .map((e) => e.fechaCIta)
                            .withoutNulls
                            .toList(),
                        widget.slot!,
                        widget.avilia?.availability.toList(),
                        widget.servicio!.duracion))!
                    .isNotEmpty)
              Text(
                'O a continuación, se muestran los horarios disponibles. ',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.lato(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
              child: FlutterFlowChoiceChips(
                options: functions
                    .getAvailabileSlots(
                        widget.citas!
                            .map((e) => e.fechaCIta)
                            .withoutNulls
                            .toList(),
                        widget.slot!,
                        widget.avilia?.availability.toList(),
                        widget.servicio!.duracion)!
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
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull);
                  FFAppState().SelectSlots =
                      functions.convertSlots(_model.choiceChipsValue);
                  safeSetState(() {});
                  Navigator.pop(context);
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.lato(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  iconSize: 18.0,
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.lato(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                chipSpacing: 12.0,
                rowSpacing: 12.0,
                multiselect: false,
                alignment: WrapAlignment.center,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
