import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/chat/chat_empty_state_simple/chat_empty_state_simple_widget.dart';
import '/chat/chat_thread_update/chat_thread_update_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_thread_component_model.dart';
export 'chat_thread_component_model.dart';

class ChatThreadComponentWidget extends StatefulWidget {
  const ChatThreadComponentWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatThreadComponentWidget> createState() =>
      _ChatThreadComponentWidgetState();
}

class _ChatThreadComponentWidgetState extends State<ChatThreadComponentWidget> {
  late ChatThreadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.assistantDelay = false;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 1200.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: StreamBuilder<List<ChatMessagesRecord>>(
                  stream: queryChatMessagesRecord(
                    queryBuilder: (chatMessagesRecord) => chatMessagesRecord
                        .where(
                          'chat',
                          isEqualTo: widget.chatRef?.reference,
                        )
                        .orderBy('timestamp', descending: true),
                    limit: 200,
                  )..listen((snapshot) {
                      List<ChatMessagesRecord> listViewChatMessagesRecordList =
                          snapshot;
                      if (_model.listViewPreviousSnapshot != null &&
                          !const ListEquality(
                                  ChatMessagesRecordDocumentEquality())
                              .equals(listViewChatMessagesRecordList,
                                  _model.listViewPreviousSnapshot)) {
                        () async {
                          if (!widget.chatRef!.lastMessageSeenBy
                              .contains(currentUserReference)) {
                            await widget.chatRef!.reference.update({
                              ...mapToFirestore(
                                {
                                  'last_message_seen_by': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          }

                          safeSetState(() {});
                        }();
                      }
                      _model.listViewPreviousSnapshot = snapshot;
                    }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    List<ChatMessagesRecord> listViewChatMessagesRecordList =
                        snapshot.data!;
                    if (listViewChatMessagesRecordList.isEmpty) {
                      return ChatEmptyStateSimpleWidget(
                        icon: Icon(
                          Icons.forum_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 90.0,
                        ),
                        title: 'Sin mensajes',
                        body: 'Aún no has enviado ningún mensaje en este chat.',
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        12.0,
                        0,
                        24.0,
                      ),
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatMessagesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatMessagesRecord =
                            listViewChatMessagesRecordList[listViewIndex];
                        return Container(
                          constraints: BoxConstraints(
                            maxWidth: 900.0,
                          ),
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.chatThreadUpdateModels.getModel(
                              listViewChatMessagesRecord.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: ChatThreadUpdateWidget(
                              key: Key(
                                'Keyde7_${listViewChatMessagesRecord.reference.id}',
                              ),
                              chatMessagesRef: listViewChatMessagesRecord,
                              runAssistant:
                                  listViewChatMessagesRecord.assistant,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              StreamBuilder<ChatsRecord>(
                stream: ChatsRecord.getDocument(widget.chatRef!.reference),
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

                  final containerChatsRecord = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.uploadedFileUrl != '')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FlutterFlowMediaDisplay(
                                          path: _model.uploadedFileUrl,
                                          imageBuilder: (path) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: path,
                                              width: 120.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          videoPlayerBuilder: (path) =>
                                              FlutterFlowVideoPlayer(
                                            path: path,
                                            width: 300.0,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            borderRadius: 20.0,
                                            borderWidth: 2.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: Icon(
                                              Icons.delete_outline_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.isDataUploading = false;
                                                _model.uploadedLocalFile =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                                _model.uploadedFileUrl = '';
                                              });
                                            },
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 8.0))
                                          .addToStart(SizedBox(width: 16.0))
                                          .addToEnd(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (() {
                          if (valueOrDefault(currentUserDocument?.role, '') ==
                              'Paciente') {
                            return true;
                          } else if ((valueOrDefault(
                                      currentUserDocument?.role, '') ==
                                  'Asistente') &&
                              (containerChatsRecord.runAssistant == false) &&
                              containerChatsRecord.users
                                  .contains(currentUserReference)) {
                            return true;
                          } else {
                            return ((valueOrDefault(
                                        currentUserDocument?.role, '') ==
                                    'Doctor') &&
                                (containerChatsRecord.runAssistant == false));
                          }
                        }())
                          AuthUserStreamWidget(
                            builder: (context) => Form(
                              key: _model.formKey2,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.assistantDelay == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Escribiendo AI . . .',
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
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 60.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                                allowVideo: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                pickerFontFamily: 'Outfit',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Subiendo archivo...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, '¡Éxito!');
                                                } else {
                                                  safeSetState(() {});
                                                  showUploadMessage(context,
                                                      'Error al subir los datos');
                                                  return;
                                                }
                                              }

                                              if (_model.uploadedFileUrl !=
                                                      '') {
                                                _model.addToImagesUploaded(
                                                    _model.uploadedFileUrl);
                                                safeSetState(() {});
                                              }
                                            },
                                          ),
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      _model.chatData =
                                                          await queryChatsRecordOnce(
                                                        queryBuilder:
                                                            (chatsRecord) =>
                                                                chatsRecord
                                                                    .where(
                                                          'group_chat_id',
                                                          isEqualTo: widget
                                                              .chatRef
                                                              ?.groupChatId,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.role,
                                                                  '') ==
                                                              'Paciente') &&
                                                          _model.chatData!
                                                              .runAssistant) {
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        await actions
                                                            .customPrint(
                                                          '== run assistant true ==',
                                                        );
                                                        _model.userMessage =
                                                            _model
                                                                .textController1
                                                                .text;
                                                        safeSetState(() {});
                                                        // newChatMessage

                                                        var chatMessagesRecordReference1 =
                                                            ChatMessagesRecord
                                                                .collection
                                                                .doc();
                                                        await chatMessagesRecordReference1
                                                            .set(
                                                                createChatMessagesRecordData(
                                                          user:
                                                              currentUserReference,
                                                          chat: widget.chatRef
                                                              ?.reference,
                                                          text: _model
                                                              .textController1
                                                              .text,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          image: _model
                                                              .uploadedFileUrl,
                                                          assistant: false,
                                                          useTokens: 0,
                                                        ));
                                                        _model.newChatMessageAssistant =
                                                            ChatMessagesRecord
                                                                .getDocumentFromData(
                                                                    createChatMessagesRecordData(
                                                                      user:
                                                                          currentUserReference,
                                                                      chat: widget
                                                                          .chatRef
                                                                          ?.reference,
                                                                      text: _model
                                                                          .textController1
                                                                          .text,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      image: _model
                                                                          .uploadedFileUrl,
                                                                      assistant:
                                                                          false,
                                                                      useTokens:
                                                                          0,
                                                                    ),
                                                                    chatMessagesRecordReference1);
                                                        // clearUsers
                                                        _model.lastSeenBy = [];
                                                        // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                        //
                                                        // We will then set the value of the user reference list from this page state.
                                                        // addMyUserToList
                                                        _model.addToLastSeenBy(
                                                            currentUserReference!);
                                                        // updateChatDocument

                                                        await widget
                                                            .chatRef!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'last_message_seen_by':
                                                                  FieldValue
                                                                      .delete(),
                                                            },
                                                          ),
                                                        });
                                                        // updateChatDocument

                                                        await widget
                                                            .chatRef!.reference
                                                            .update({
                                                          ...createChatsRecordData(
                                                            lastMessageTime:
                                                                getCurrentTimestamp,
                                                            lastMessageSentBy:
                                                                currentUserReference,
                                                            lastMessage: _model
                                                                .textController1
                                                                .text,
                                                            runAssistant: _model
                                                                .chatData
                                                                ?.runAssistant,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'last_message_seen_by':
                                                                  _model
                                                                      .lastSeenBy,
                                                            },
                                                          ),
                                                        });
                                                        // clearUsers
                                                        _model.lastSeenBy = [];
                                                        safeSetState(() {
                                                          _model.textController1
                                                              ?.clear();
                                                        });
                                                        _model.queryDoctorAi =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo: widget
                                                                .chatRef
                                                                ?.userB
                                                                ?.id,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        if (_model
                                                                .queryDoctorAi!
                                                                .creditsAi >
                                                            0.1) {
                                                          if (_model.chatData
                                                                  ?.runAssistant ==
                                                              true) {
                                                            _model.assistantDelay =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.responseAssistant =
                                                                await AssistantTestCall
                                                                    .call(
                                                              message: _model
                                                                  .userMessage,
                                                              userId: widget
                                                                  .chatRef
                                                                  ?.userA
                                                                  ?.id,
                                                              threadId: widget
                                                                  .chatRef
                                                                  ?.threadId,
                                                              assistantId:
                                                                  'asst_CsFUZxisQLLY0Md1PjV9rLAA',
                                                              doctorId: widget
                                                                  .chatRef
                                                                  ?.doctor
                                                                  ?.id,
                                                            );

                                                            if ((_model
                                                                    .responseAssistant
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await _model
                                                                  .queryDoctorAi!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'credits_ai':
                                                                        FieldValue.increment(-(functions.calcCostosAI(
                                                                            AssistantTestCall.totalTokens(
                                                                              (_model.responseAssistant?.jsonBody ?? ''),
                                                                            )!,
                                                                            0.000150))),
                                                                  },
                                                                ),
                                                              });
                                                              await actions
                                                                  .customPrint(
                                                                functions
                                                                    .calcCostosAI(
                                                                        AssistantTestCall
                                                                            .totalTokens(
                                                                          (_model.responseAssistant?.jsonBody ??
                                                                              ''),
                                                                        )!,
                                                                        0.000150)
                                                                    .toString(),
                                                              );
                                                              await actions
                                                                  .customPrint(
                                                                functions
                                                                    .calcSaldoCreditos(
                                                                        _model
                                                                            .queryDoctorAi!
                                                                            .creditsAi,
                                                                        functions.calcCostosAI(
                                                                            AssistantTestCall.totalTokens(
                                                                              (_model.responseAssistant?.jsonBody ?? ''),
                                                                            )!,
                                                                            0.000150))
                                                                    .toString(),
                                                              );

                                                              var chatMessagesRecordReference2 =
                                                                  ChatMessagesRecord
                                                                      .collection
                                                                      .doc();
                                                              await chatMessagesRecordReference2
                                                                  .set(
                                                                      createChatMessagesRecordData(
                                                                user: widget
                                                                    .chatRef
                                                                    ?.userB,
                                                                chat: widget
                                                                    .chatRef
                                                                    ?.reference,
                                                                text: AssistantTestCall
                                                                    .responseAssistant(
                                                                  (_model.responseAssistant
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                image: _model
                                                                    .uploadedFileUrl,
                                                                assistant: true,
                                                                useTokens:
                                                                    AssistantTestCall
                                                                        .totalTokens(
                                                                  (_model.responseAssistant
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              ));
                                                              _model.chatAssistantSend =
                                                                  ChatMessagesRecord
                                                                      .getDocumentFromData(
                                                                          createChatMessagesRecordData(
                                                                            user:
                                                                                widget.chatRef?.userB,
                                                                            chat:
                                                                                widget.chatRef?.reference,
                                                                            text:
                                                                                AssistantTestCall.responseAssistant(
                                                                              (_model.responseAssistant?.jsonBody ?? ''),
                                                                            ),
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            image:
                                                                                _model.uploadedFileUrl,
                                                                            assistant:
                                                                                true,
                                                                            useTokens:
                                                                                AssistantTestCall.totalTokens(
                                                                              (_model.responseAssistant?.jsonBody ?? ''),
                                                                            ),
                                                                          ),
                                                                          chatMessagesRecordReference2);
                                                              await actions
                                                                  .customPrint(
                                                                '== Despues cuando ejecuta el asistente ==',
                                                              );
                                                              _model.assistantDelay =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              _model.lastSeenBy =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.addToLastSeenBy(
                                                                  currentUserReference!);
                                                              safeSetState(
                                                                  () {});
                                                              await actions
                                                                  .customPrintString(
                                                                _model
                                                                    .lastSeenBy
                                                                    .map((e) =>
                                                                        e.id)
                                                                    .toList(),
                                                              );

                                                              await widget
                                                                  .chatRef!
                                                                  .reference
                                                                  .update({
                                                                ...createChatsRecordData(
                                                                  lastMessageTime:
                                                                      getCurrentTimestamp,
                                                                  lastMessageSentBy:
                                                                      widget
                                                                          .chatRef
                                                                          ?.userB,
                                                                  lastMessage:
                                                                      AssistantTestCall
                                                                          .responseAssistant(
                                                                    (_model.responseAssistant
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  runAssistant: _model
                                                                      .chatData
                                                                      ?.runAssistant,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'last_message_seen_by':
                                                                        _model
                                                                            .lastSeenBy,
                                                                  },
                                                                ),
                                                              });
                                                              _model.lastSeenBy =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });

                                                              _model.imagesUploaded =
                                                                  [];
                                                              _model.userMessage =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            safeSetState(() {
                                                              _model
                                                                  .textController1
                                                                  ?.clear();
                                                            });
                                                            safeSetState(() {
                                                              _model.isDataUploading =
                                                                  false;
                                                              _model.uploadedLocalFile =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                              _model.uploadedFileUrl =
                                                                  '';
                                                            });

                                                            _model.imagesUploaded =
                                                                [];
                                                            safeSetState(() {});
                                                          }
                                                        } else {
                                                          if (_model.chatData
                                                                  ?.runAssistant ==
                                                              true) {
                                                            await widget
                                                                .chatRef!
                                                                .reference
                                                                .update(
                                                                    createChatsRecordData(
                                                              runAssistant:
                                                                  false,
                                                            ));
                                                            safeSetState(() {
                                                              _model
                                                                  .textController1
                                                                  ?.clear();
                                                            });
                                                            safeSetState(() {
                                                              _model.isDataUploading =
                                                                  false;
                                                              _model.uploadedLocalFile =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                              _model.uploadedFileUrl =
                                                                  '';
                                                            });

                                                            _model.imagesUploaded =
                                                                [];
                                                            safeSetState(() {});
                                                          } else {
                                                            safeSetState(() {
                                                              _model
                                                                  .textController1
                                                                  ?.clear();
                                                            });
                                                            safeSetState(() {
                                                              _model.isDataUploading =
                                                                  false;
                                                              _model.uploadedLocalFile =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                              _model.uploadedFileUrl =
                                                                  '';
                                                            });

                                                            _model.imagesUploaded =
                                                                [];
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      } else {
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        _model.dataDoc =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo: widget
                                                                .chatRef
                                                                ?.userB
                                                                ?.id,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        await actions
                                                            .customPrint(
                                                          '== Lado del doctor ==',
                                                        );
                                                        // newChatMessage

                                                        var chatMessagesRecordReference3 =
                                                            ChatMessagesRecord
                                                                .collection
                                                                .doc();
                                                        await chatMessagesRecordReference3
                                                            .set(
                                                                createChatMessagesRecordData(
                                                          user:
                                                              currentUserReference,
                                                          chat: widget.chatRef
                                                              ?.reference,
                                                          text: _model
                                                              .textController1
                                                              .text,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          image: _model
                                                              .uploadedFileUrl,
                                                          assistant: false,
                                                          useTokens: 0,
                                                        ));
                                                        _model.newChatMessageDoc =
                                                            ChatMessagesRecord
                                                                .getDocumentFromData(
                                                                    createChatMessagesRecordData(
                                                                      user:
                                                                          currentUserReference,
                                                                      chat: widget
                                                                          .chatRef
                                                                          ?.reference,
                                                                      text: _model
                                                                          .textController1
                                                                          .text,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      image: _model
                                                                          .uploadedFileUrl,
                                                                      assistant:
                                                                          false,
                                                                      useTokens:
                                                                          0,
                                                                    ),
                                                                    chatMessagesRecordReference3);
                                                        // clearUsers
                                                        _model.lastSeenBy = [];
                                                        // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                        //
                                                        // We will then set the value of the user reference list from this page state.
                                                        // addMyUserToList
                                                        _model.addToLastSeenBy(
                                                            currentUserReference!);
                                                        await actions
                                                            .customPrintString(
                                                          _model.lastSeenBy
                                                              .map((e) => e.id)
                                                              .toList(),
                                                        );
                                                        // updateChatDocument

                                                        await widget
                                                            .chatRef!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'last_message_seen_by':
                                                                  FieldValue
                                                                      .delete(),
                                                            },
                                                          ),
                                                        });
                                                        // updateChatDocument

                                                        await widget
                                                            .chatRef!.reference
                                                            .update({
                                                          ...createChatsRecordData(
                                                            lastMessageTime:
                                                                getCurrentTimestamp,
                                                            lastMessageSentBy:
                                                                currentUserReference,
                                                            lastMessage: _model
                                                                .textController1
                                                                .text,
                                                            runAssistant: _model
                                                                .chatData
                                                                ?.runAssistant,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'last_message_seen_by':
                                                                  _model
                                                                      .lastSeenBy,
                                                            },
                                                          ),
                                                        });
                                                        // clearUsers
                                                        _model.lastSeenBy = [];
                                                        safeSetState(() {
                                                          _model.textController1
                                                              ?.clear();
                                                        });
                                                        safeSetState(() {
                                                          _model.isDataUploading =
                                                              false;
                                                          _model.uploadedLocalFile =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl =
                                                              '';
                                                        });

                                                        _model.imagesUploaded =
                                                            [];
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    autofocus: true,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    textInputAction:
                                                        TextInputAction.send,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          'Escriba su mensaje',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 12.0,
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
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  56.0,
                                                                  16.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    maxLines: 12,
                                                    minLines: 1,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .sentences),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 6.0, 4.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.send_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        _model.chatDataButton =
                                                            await queryChatsRecordOnce(
                                                          queryBuilder:
                                                              (chatsRecord) =>
                                                                  chatsRecord
                                                                      .where(
                                                            'group_chat_id',
                                                            isEqualTo: widget
                                                                .chatRef
                                                                ?.groupChatId,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.role,
                                                                    '') ==
                                                                'Paciente') &&
                                                            _model
                                                                .chatDataButton!
                                                                .runAssistant) {
                                                          if (_model.formKey2
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey2
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          await actions
                                                              .customPrint(
                                                            '== run assistant true ==',
                                                          );
                                                          _model.userMessage =
                                                              _model
                                                                  .textController1
                                                                  .text;
                                                          safeSetState(() {});
                                                          // newChatMessage

                                                          var chatMessagesRecordReference1 =
                                                              ChatMessagesRecord
                                                                  .collection
                                                                  .doc();
                                                          firestoreBatch.set(
                                                              chatMessagesRecordReference1,
                                                              createChatMessagesRecordData(
                                                                user:
                                                                    currentUserReference,
                                                                chat: widget
                                                                    .chatRef
                                                                    ?.reference,
                                                                text: _model
                                                                    .textController1
                                                                    .text,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                image: _model
                                                                    .uploadedFileUrl,
                                                                assistant:
                                                                    false,
                                                                useTokens: 0,
                                                              ));
                                                          _model.newChatMessageAssistantCopy =
                                                              ChatMessagesRecord
                                                                  .getDocumentFromData(
                                                                      createChatMessagesRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        chat: widget
                                                                            .chatRef
                                                                            ?.reference,
                                                                        text: _model
                                                                            .textController1
                                                                            .text,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        image: _model
                                                                            .uploadedFileUrl,
                                                                        assistant:
                                                                            false,
                                                                        useTokens:
                                                                            0,
                                                                      ),
                                                                      chatMessagesRecordReference1);
                                                          // clearUsers
                                                          _model.lastSeenBy =
                                                              [];
                                                          // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                          //
                                                          // We will then set the value of the user reference list from this page state.
                                                          // addMyUserToList
                                                          _model.addToLastSeenBy(
                                                              currentUserReference!);
                                                          // updateChatDocument

                                                          firestoreBatch.update(
                                                              widget.chatRef!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'last_message_seen_by':
                                                                        FieldValue
                                                                            .delete(),
                                                                  },
                                                                ),
                                                              });
                                                          // updateChatDocument

                                                          firestoreBatch.update(
                                                              widget.chatRef!
                                                                  .reference,
                                                              {
                                                                ...createChatsRecordData(
                                                                  lastMessageTime:
                                                                      getCurrentTimestamp,
                                                                  lastMessageSentBy:
                                                                      currentUserReference,
                                                                  lastMessage:
                                                                      _model
                                                                          .textController1
                                                                          .text,
                                                                  runAssistant: _model
                                                                      .chatDataButton
                                                                      ?.runAssistant,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'last_message_seen_by':
                                                                        _model
                                                                            .lastSeenBy,
                                                                  },
                                                                ),
                                                              });
                                                          // clearUsers
                                                          _model.lastSeenBy =
                                                              [];
                                                          safeSetState(() {
                                                            _model
                                                                .textController1
                                                                ?.clear();
                                                          });
                                                          _model.doctorQueryCredits =
                                                              await queryUsersRecordOnce(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                              'uid',
                                                              isEqualTo: widget
                                                                  .chatRef
                                                                  ?.userB
                                                                  ?.id,
                                                            ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          if (_model
                                                                  .doctorQueryCredits!
                                                                  .creditsAi >
                                                              0.1) {
                                                            if (_model
                                                                    .chatDataButton
                                                                    ?.runAssistant ==
                                                                true) {
                                                              _model.assistantDelay =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              _model.responseAssistantCopy =
                                                                  await AssistantTestCall
                                                                      .call(
                                                                message: _model
                                                                    .userMessage,
                                                                userId: widget
                                                                    .chatRef
                                                                    ?.userA
                                                                    ?.id,
                                                                threadId: widget
                                                                    .chatRef
                                                                    ?.threadId,
                                                                assistantId:
                                                                    'asst_CsFUZxisQLLY0Md1PjV9rLAA',
                                                                doctorId:
                                                                    widget
                                                                        .chatRef
                                                                        ?.doctor
                                                                        ?.id,
                                                              );

                                                              if ((_model
                                                                      .responseAssistantCopy
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                firestoreBatch.update(
                                                                    _model
                                                                        .doctorQueryCredits!
                                                                        .reference,
                                                                    {
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'credits_ai': FieldValue.increment(-(functions.calcCostosAI(
                                                                              AssistantTestCall.totalTokens(
                                                                                (_model.responseAssistantCopy?.jsonBody ?? ''),
                                                                              )!,
                                                                              0.000150))),
                                                                        },
                                                                      ),
                                                                    });

                                                                var chatMessagesRecordReference2 =
                                                                    ChatMessagesRecord
                                                                        .collection
                                                                        .doc();
                                                                firestoreBatch.set(
                                                                    chatMessagesRecordReference2,
                                                                    createChatMessagesRecordData(
                                                                      user: widget
                                                                          .chatRef
                                                                          ?.userB,
                                                                      chat: widget
                                                                          .chatRef
                                                                          ?.reference,
                                                                      text: AssistantTestCall
                                                                          .responseAssistant(
                                                                        (_model.responseAssistantCopy?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      image: _model
                                                                          .uploadedFileUrl,
                                                                      assistant:
                                                                          true,
                                                                      useTokens:
                                                                          AssistantTestCall
                                                                              .totalTokens(
                                                                        (_model.responseAssistantCopy?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                    ));
                                                                _model.chatAssistantSendCopy =
                                                                    ChatMessagesRecord
                                                                        .getDocumentFromData(
                                                                            createChatMessagesRecordData(
                                                                              user: widget.chatRef?.userB,
                                                                              chat: widget.chatRef?.reference,
                                                                              text: AssistantTestCall.responseAssistant(
                                                                                (_model.responseAssistantCopy?.jsonBody ?? ''),
                                                                              ),
                                                                              timestamp: getCurrentTimestamp,
                                                                              image: _model.uploadedFileUrl,
                                                                              assistant: true,
                                                                              useTokens: AssistantTestCall.totalTokens(
                                                                                (_model.responseAssistantCopy?.jsonBody ?? ''),
                                                                              ),
                                                                            ),
                                                                            chatMessagesRecordReference2);
                                                                await actions
                                                                    .customPrint(
                                                                  '== Despues cuando ejecuta el asistente ==',
                                                                );
                                                                _model.assistantDelay =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.lastSeenBy =
                                                                    [];
                                                                safeSetState(
                                                                    () {});
                                                                _model.addToLastSeenBy(
                                                                    currentUserReference!);
                                                                safeSetState(
                                                                    () {});
                                                                await actions
                                                                    .customPrintString(
                                                                  _model
                                                                      .lastSeenBy
                                                                      .map((e) =>
                                                                          e.id)
                                                                      .toList(),
                                                                );

                                                                firestoreBatch.update(
                                                                    widget
                                                                        .chatRef!
                                                                        .reference,
                                                                    {
                                                                      ...createChatsRecordData(
                                                                        lastMessageTime:
                                                                            getCurrentTimestamp,
                                                                        lastMessageSentBy: widget
                                                                            .chatRef
                                                                            ?.userB,
                                                                        lastMessage:
                                                                            AssistantTestCall.responseAssistant(
                                                                          (_model.responseAssistantCopy?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        runAssistant: _model
                                                                            .chatDataButton
                                                                            ?.runAssistant,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'last_message_seen_by':
                                                                              _model.lastSeenBy,
                                                                        },
                                                                      ),
                                                                    });
                                                                _model.lastSeenBy =
                                                                    [];
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model.isDataUploading =
                                                                      false;
                                                                  _model.uploadedLocalFile =
                                                                      FFUploadedFile(
                                                                          bytes:
                                                                              Uint8List.fromList([]));
                                                                  _model.uploadedFileUrl =
                                                                      '';
                                                                });

                                                                _model.imagesUploaded =
                                                                    [];
                                                                _model.userMessage =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              safeSetState(() {
                                                                _model
                                                                    .textController1
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });

                                                              _model.imagesUploaded =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            if (_model
                                                                    .chatDataButton
                                                                    ?.runAssistant ==
                                                                true) {
                                                              firestoreBatch
                                                                  .update(
                                                                      widget
                                                                          .chatRef!
                                                                          .reference,
                                                                      createChatsRecordData(
                                                                        runAssistant:
                                                                            false,
                                                                      ));
                                                              safeSetState(() {
                                                                _model
                                                                    .textController1
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });

                                                              _model.imagesUploaded =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              safeSetState(() {
                                                                _model
                                                                    .textController1
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });

                                                              _model.imagesUploaded =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }
                                                        } else {
                                                          if (_model.formKey2
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey2
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          _model.dataDocCopy =
                                                              await queryUsersRecordOnce(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                              'uid',
                                                              isEqualTo: widget
                                                                  .chatRef
                                                                  ?.userB
                                                                  ?.id,
                                                            ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          await actions
                                                              .customPrint(
                                                            '== Lado del doctor ==',
                                                          );
                                                          // newChatMessage

                                                          var chatMessagesRecordReference3 =
                                                              ChatMessagesRecord
                                                                  .collection
                                                                  .doc();
                                                          firestoreBatch.set(
                                                              chatMessagesRecordReference3,
                                                              createChatMessagesRecordData(
                                                                user:
                                                                    currentUserReference,
                                                                chat: widget
                                                                    .chatRef
                                                                    ?.reference,
                                                                text: _model
                                                                    .textController1
                                                                    .text,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                image: _model
                                                                    .uploadedFileUrl,
                                                                assistant:
                                                                    false,
                                                                useTokens: 0,
                                                              ));
                                                          _model.newChatMessageDocCopy =
                                                              ChatMessagesRecord
                                                                  .getDocumentFromData(
                                                                      createChatMessagesRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        chat: widget
                                                                            .chatRef
                                                                            ?.reference,
                                                                        text: _model
                                                                            .textController1
                                                                            .text,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        image: _model
                                                                            .uploadedFileUrl,
                                                                        assistant:
                                                                            false,
                                                                        useTokens:
                                                                            0,
                                                                      ),
                                                                      chatMessagesRecordReference3);
                                                          // clearUsers
                                                          _model.lastSeenBy =
                                                              [];
                                                          // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                          //
                                                          // We will then set the value of the user reference list from this page state.
                                                          // addMyUserToList
                                                          _model.addToLastSeenBy(
                                                              currentUserReference!);
                                                          await actions
                                                              .customPrintString(
                                                            _model.lastSeenBy
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList(),
                                                          );
                                                          // updateChatDocument

                                                          firestoreBatch.update(
                                                              widget.chatRef!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'last_message_seen_by':
                                                                        FieldValue
                                                                            .delete(),
                                                                  },
                                                                ),
                                                              });
                                                          // updateChatDocument

                                                          firestoreBatch.update(
                                                              widget.chatRef!
                                                                  .reference,
                                                              {
                                                                ...createChatsRecordData(
                                                                  lastMessageTime:
                                                                      getCurrentTimestamp,
                                                                  lastMessageSentBy:
                                                                      currentUserReference,
                                                                  lastMessage:
                                                                      _model
                                                                          .textController1
                                                                          .text,
                                                                  runAssistant: _model
                                                                      .chatDataButton
                                                                      ?.runAssistant,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'last_message_seen_by':
                                                                        _model
                                                                            .lastSeenBy,
                                                                  },
                                                                ),
                                                              });
                                                          // clearUsers
                                                          _model.lastSeenBy =
                                                              [];
                                                          safeSetState(() {
                                                            _model
                                                                .textController1
                                                                ?.clear();
                                                          });
                                                          safeSetState(() {
                                                            _model.isDataUploading =
                                                                false;
                                                            _model.uploadedLocalFile =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                            _model.uploadedFileUrl =
                                                                '';
                                                          });

                                                          _model.imagesUploaded =
                                                              [];
                                                          safeSetState(() {});
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if ((valueOrDefault(currentUserDocument?.role, '') ==
                                    'Doctor') &&
                                (containerChatsRecord.runAssistant == true)
                            ? true
                            : ((valueOrDefault(currentUserDocument?.role, '') ==
                                    'Asistente') &&
                                (containerChatsRecord.runAssistant == true)))
                          AuthUserStreamWidget(
                            builder: (context) => Form(
                              key: _model.formKey1,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 60.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.add_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                textInputAction:
                                                    TextInputAction.send,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  hintText:
                                                      'El asistente esta activo...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.lato(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                                .error,
                                                        fontSize: 12.0,
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
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 16.0,
                                                              56.0, 16.0),
                                                ),
                                                style:
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
                                                maxLines: 12,
                                                minLines: 1,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  if (!isAndroid && !isiOS)
                                                    TextInputFormatter
                                                        .withFunction((oldValue,
                                                            newValue) {
                                                      return TextEditingValue(
                                                        selection:
                                                            newValue.selection,
                                                        text: newValue.text
                                                            .toCapitalization(
                                                                TextCapitalization
                                                                    .sentences),
                                                      );
                                                    }),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 6.0, 4.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons.send_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
