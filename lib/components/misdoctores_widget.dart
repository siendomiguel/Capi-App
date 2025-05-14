import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/estado_vacio/estado_vacio_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'misdoctores_model.dart';
export 'misdoctores_model.dart';

class MisdoctoresWidget extends StatefulWidget {
  const MisdoctoresWidget({super.key});

  @override
  State<MisdoctoresWidget> createState() => _MisdoctoresWidgetState();
}

class _MisdoctoresWidgetState extends State<MisdoctoresWidget> {
  late MisdoctoresModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisdoctoresModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'role',
          isEqualTo: 'Doctor',
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
        List<UsersRecord> containerUsersRecordList = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 220.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: AuthUserStreamWidget(
            builder: (context) => Builder(
              builder: (context) {
                final mismedicos = containerUsersRecordList
                    .where((e) =>
                        (currentUserDocument?.misDoctores.toList() ?? [])
                            .contains(e.reference))
                    .toList();
                if (mismedicos.isEmpty) {
                  return EstadoVacioWidget();
                }

                return FlutterFlowDataTable<UsersRecord>(
                  controller: _model.paginatedDataTableController,
                  data: mismedicos,
                  columnsBuilder: (onSortChanged) => [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Nombre',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.quicksand(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Cant consultas',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.quicksand(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      fixedWidth: 90.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Acciones',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.quicksand(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      fixedWidth: 240.0,
                    ),
                  ],
                  dataRowBuilder: (mismedicosItem, mismedicosIndex, selected,
                          onSelectChanged) =>
                      DataRow(
                    color: WidgetStateProperty.all(
                      mismedicosIndex % 2 == 0
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    cells: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            DetallesdoctorWidget.routeName,
                            queryParameters: {
                              'doctorDetails': serializeParam(
                                mismedicosItem,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'doctorDetails': mismedicosItem,
                            },
                          );
                        },
                        child: Text(
                          mismedicosItem.displayName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: StreamBuilder<List<CitasRecord>>(
                          stream: queryCitasRecord(
                            queryBuilder: (citasRecord) => citasRecord
                                .where(
                                  'paciente',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'doctor',
                                  isEqualTo: mismedicosItem.reference,
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
                            List<CitasRecord> textCitasRecordList =
                                snapshot.data!;

                            return Text(
                              valueOrDefault<String>(
                                textCitasRecordList.length.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!mismedicosItem.pacientes
                              .contains(currentUserReference))
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Aceptar invitación'),
                                            content: Text(
                                                'El Dr ${mismedicosItem.displayName} te agrego como paciente!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Rechazar'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Aceptar'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await mismedicosItem.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'pacientes': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                        'Solicitudes': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  return;
                                } else {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'blockList': FieldValue.arrayUnion(
                                            [mismedicosItem.reference]),
                                        'mis_doctores': FieldValue.arrayRemove(
                                            [mismedicosItem.reference]),
                                      },
                                    ),
                                  });
                                  return;
                                }
                              },
                              text: 'Aceptar solicitud',
                              icon: Icon(
                                Icons.check_sharp,
                                color: FlutterFlowTheme.of(context).success,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.lato(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                              ),
                            ),
                          if (mismedicosItem.pacientes
                              .contains(currentUserReference))
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.block_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title:
                                                Text('Bloqueo de profesional'),
                                            content: Text(
                                                'Estas por bloquear a ${mismedicosItem.displayName}'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirmar'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'mis_doctores': FieldValue.arrayRemove(
                                            [mismedicosItem.reference]),
                                        'blockList': FieldValue.arrayUnion(
                                            [mismedicosItem.reference]),
                                      },
                                    ),
                                  });

                                  await mismedicosItem.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'pacientes': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  return;
                                } else {
                                  return;
                                }
                              },
                            ),
                          if (mismedicosItem.pacientes
                              .contains(currentUserReference))
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.delete_forever,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Eliminar profesional'),
                                            content: Text(
                                                'Estas por eliminar a ${mismedicosItem.displayName}'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirmar'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'mis_doctores': FieldValue.arrayRemove(
                                            [mismedicosItem.reference]),
                                        'blockList': FieldValue.arrayUnion(
                                            [mismedicosItem.reference]),
                                      },
                                    ),
                                  });

                                  await mismedicosItem.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'pacientes': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  return;
                                } else {
                                  return;
                                }
                              },
                            ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ].map((c) => DataCell(c)).toList(),
                  ),
                  emptyBuilder: () => EstadoVacioWidget(),
                  paginated: true,
                  selectable: false,
                  hidePaginator: false,
                  showFirstLastButtons: false,
                  headingRowHeight: 44.0,
                  dataRowHeight: 48.0,
                  columnSpacing: 16.0,
                  headingRowColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(8.0),
                  addHorizontalDivider: true,
                  addTopAndBottomDivider: false,
                  hideDefaultHorizontalDivider: true,
                  horizontalDividerColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  horizontalDividerThickness: 1.0,
                  addVerticalDivider: false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
