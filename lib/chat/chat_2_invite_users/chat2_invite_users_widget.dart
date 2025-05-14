import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/chat_empty_state_simple/chat_empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'chat2_invite_users_model.dart';
export 'chat2_invite_users_model.dart';

class Chat2InviteUsersWidget extends StatefulWidget {
  const Chat2InviteUsersWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  static String routeName = 'chat_2_InviteUsers';
  static String routePath = '/chat2InviteUsers';

  @override
  State<Chat2InviteUsersWidget> createState() => _Chat2InviteUsersWidgetState();
}

class _Chat2InviteUsersWidgetState extends State<Chat2InviteUsersWidget> {
  late Chat2InviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2InviteUsersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chat =
          await ChatsRecord.getDocumentOnce(widget.chatRef!.reference);
      if (widget.chatRef != null) {
        // addChatUsers_ToList
        _model.friendsList =
            _model.chat!.users.toList().cast<DocumentReference>();
        safeSetState(() {});
      } else {
        // addUser_ToList
        _model.addToFriendsList(currentUserReference!);
        safeSetState(() {});
      }
    });

    _model.tfSearchChatUserTextController ??= TextEditingController();
    _model.tfSearchChatUserFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondaryText),
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite Friends',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.quicksand(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Select users from below to start a chat.',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.lato(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord
                        .where(
                          'clinica',
                          isEqualTo: currentUserDocument?.clinica,
                        )
                        .where(
                          'role',
                          isNotEqualTo: 'Paciente',
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
                      constraints: BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Invitar usuarios',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.quicksand(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'Selecciona un usuario para invitar al chat',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 16.0, 4.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 44.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 15.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.tfSearchChatUserTextController,
                                  focusNode: _model.tfSearchChatUserFocusNode,
                                  onFieldSubmitted: (_) async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                        containerUsersRecordList
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record, [
                                                record.email,
                                                record.displayName,
                                                record.nombre,
                                                record.apellidoPaterno,
                                                record.apellidoMaterno
                                              ]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model
                                              .tfSearchChatUserTextController
                                              .text)
                                          .map((r) => r.object)
                                          .toList();
                                      ;
                                    });
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Buscar usuario...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.lato(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.lato(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model
                                      .tfSearchChatUserTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          'Usuarios',
                                          style: FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        ((valueOrDefault<int>(
                                                  _model.friendsList.length,
                                                  0,
                                                ) -
                                                1))
                                            .toString(),
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
                                          2.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Seleccionados',
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
                                  ],
                                ),
                              ),
                              if (_model.tfSearchChatUserTextController.text ==
                                      '')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listaChatUsers =
                                            containerUsersRecordList
                                                .map((e) => e)
                                                .toList()
                                                .where(
                                                    (e) => e.role != 'Doctor')
                                                .toList();
                                        if (listaChatUsers.isEmpty) {
                                          return ChatEmptyStateSimpleWidget(
                                            icon: Icon(
                                              Icons.groups_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 90.0,
                                            ),
                                            title: 'No Friends',
                                            body:
                                                'No users exist to create a chat with.',
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            160.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: listaChatUsers.length,
                                          itemBuilder:
                                              (context, listaChatUsersIndex) {
                                            final listaChatUsersItem =
                                                listaChatUsers[
                                                    listaChatUsersIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 8.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 70.0,
                                                decoration: BoxDecoration(
                                                  color: _model.friendsList
                                                          .contains(
                                                              listaChatUsersItem
                                                                  .reference)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent1
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: _model.friendsList
                                                            .contains(
                                                                listaChatUsersItem
                                                                    .reference)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 44.0,
                                                        height: 44.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listaChatUsersItem
                                                                    .photoUrl,
                                                                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                              ),
                                                              width: 44.0,
                                                              height: 44.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  listaChatUsersItem
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listaChatUsersItem
                                                                      .email,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listaChatUsersItem
                                                                      .role,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Expanded(
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                      .checkboxListTileValueMap1[
                                                                  listaChatUsersItem] ??= _model
                                                                      .friendsList
                                                                      .contains(
                                                                          listaChatUsersItem
                                                                              .reference) ==
                                                                  true,
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxListTileValueMap1[
                                                                            listaChatUsersItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  // addUser
                                                                  _model.addToFriendsList(
                                                                      listaChatUsersItem
                                                                          .reference);
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  // removeUsser
                                                                  _model.removeFromFriendsList(
                                                                      listaChatUsersItem
                                                                          .reference);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              title: Text(
                                                                listaChatUsersItem
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .lato(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          2.0,
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                listaChatUsersItem
                                                                    .email,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .lato(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
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
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  Colors.white,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .trailing,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.friendsList.contains(
                                                                listaChatUsersItem
                                                                    .reference) ==
                                                            true) {
                                                          // addUser
                                                          _model.removeFromFriendsList(
                                                              listaChatUsersItem
                                                                  .reference);
                                                          safeSetState(() {});
                                                        } else {
                                                          // addUser
                                                          _model.addToFriendsList(
                                                              listaChatUsersItem
                                                                  .reference);
                                                          safeSetState(() {});
                                                        }

                                                        if (_model.friendsList
                                                                .length >=
                                                            2) {
                                                          if (widget.chatRef !=
                                                              null) {
                                                            // updateChat

                                                            await widget
                                                                .chatRef!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': _model
                                                                      .friendsList,
                                                                },
                                                              ),
                                                            });
                                                            // updateChat
                                                            _model.updatedChatThread =
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
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamed(
                                                              Chat2DetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'chatRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .chatRef,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'chatRef':
                                                                    widget
                                                                        .chatRef,
                                                              },
                                                            );
                                                          } else {
                                                            _model.createThread =
                                                                await CreateThreadIDCall
                                                                    .call();

                                                            if ((_model
                                                                    .createThread
                                                                    ?.succeeded ??
                                                                true)) {
                                                              // newChat

                                                              var chatsRecordReference =
                                                                  ChatsRecord
                                                                      .collection
                                                                      .doc();
                                                              await chatsRecordReference
                                                                  .set({
                                                                ...createChatsRecordData(
                                                                  userA:
                                                                      currentUserReference,
                                                                  userB: _model
                                                                      .friendsList
                                                                      .elementAtOrNull(
                                                                          1),
                                                                  lastMessage:
                                                                      '',
                                                                  lastMessageTime:
                                                                      getCurrentTimestamp,
                                                                  lastMessageSentBy:
                                                                      currentUserReference,
                                                                  groupChatId: random_data
                                                                      .randomInteger(
                                                                          1000000,
                                                                          9999999),
                                                                  clinica:
                                                                      currentUserDocument
                                                                          ?.clinica,
                                                                  runAssistant:
                                                                      false,
                                                                  threadId:
                                                                      CreateThreadIDCall
                                                                          .threadId(
                                                                    (_model.createThread
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  doctor: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.role,
                                                                              '') ==
                                                                          'Doctor'
                                                                      ? currentUserReference
                                                                      : _model
                                                                          .friendsList
                                                                          .elementAtOrNull(
                                                                              1),
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': _model
                                                                        .friendsList,
                                                                  },
                                                                ),
                                                              });
                                                              _model.newChatThread =
                                                                  ChatsRecord
                                                                      .getDocumentFromData({
                                                                ...createChatsRecordData(
                                                                  userA:
                                                                      currentUserReference,
                                                                  userB: _model
                                                                      .friendsList
                                                                      .elementAtOrNull(
                                                                          1),
                                                                  lastMessage:
                                                                      '',
                                                                  lastMessageTime:
                                                                      getCurrentTimestamp,
                                                                  lastMessageSentBy:
                                                                      currentUserReference,
                                                                  groupChatId: random_data
                                                                      .randomInteger(
                                                                          1000000,
                                                                          9999999),
                                                                  clinica:
                                                                      currentUserDocument
                                                                          ?.clinica,
                                                                  runAssistant:
                                                                      false,
                                                                  threadId:
                                                                      CreateThreadIDCall
                                                                          .threadId(
                                                                    (_model.createThread
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  doctor: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.role,
                                                                              '') ==
                                                                          'Doctor'
                                                                      ? currentUserReference
                                                                      : _model
                                                                          .friendsList
                                                                          .elementAtOrNull(
                                                                              1),
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': _model
                                                                        .friendsList,
                                                                  },
                                                                ),
                                                              }, chatsRecordReference);
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context.pushNamed(
                                                                Chat2DetailsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'chatRef':
                                                                      serializeParam(
                                                                    _model
                                                                        .newChatThread,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'chatRef': _model
                                                                      .newChatThread,
                                                                },
                                                              );
                                                            }
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Debes seleccionar al menos otro usuario para iniciar un chat.',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .lato(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                            ),
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: _model.friendsList
                                                              .contains(
                                                                  listaChatUsersItem
                                                                      .reference)
                                                          ? 'Eliminar'
                                                          : 'Agregar',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (_model.tfSearchChatUserTextController.text !=
                                      '')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listSearchChat = _model
                                            .simpleSearchResults
                                            .map((e) => e)
                                            .toList();
                                        if (listSearchChat.isEmpty) {
                                          return ChatEmptyStateSimpleWidget(
                                            icon: Icon(
                                              Icons.groups_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 90.0,
                                            ),
                                            title: 'No Friends',
                                            body:
                                                'No users exist to create a chat with.',
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            160.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listSearchChat.length,
                                          itemBuilder:
                                              (context, listSearchChatIndex) {
                                            final listSearchChatItem =
                                                listSearchChat[
                                                    listSearchChatIndex];
                                            return Visibility(
                                              visible: listSearchChatItem
                                                      .reference !=
                                                  currentUserReference,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 8.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 70.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.friendsList
                                                            .contains(
                                                                listSearchChatItem
                                                                    .reference)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: _model.friendsList
                                                              .contains(
                                                                  listSearchChatItem
                                                                      .reference)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listSearchChatItem
                                                                      .photoUrl,
                                                                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                ),
                                                                width: 44.0,
                                                                height: 44.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
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
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    listSearchChatItem
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
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
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    listSearchChatItem
                                                                        .email,
                                                                    style: FlutterFlowTheme.of(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Expanded(
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: Theme(
                                                              data: ThemeData(
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              child:
                                                                  CheckboxListTile(
                                                                value: _model
                                                                        .checkboxListTileValueMap2[
                                                                    listSearchChatItem] ??= _model
                                                                        .friendsList
                                                                        .contains(
                                                                            listSearchChatItem.reference) ==
                                                                    true,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkboxListTileValueMap2[
                                                                              listSearchChatItem] =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    // addUser
                                                                    _model.addToFriendsList(
                                                                        listSearchChatItem
                                                                            .reference);
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    // removeUsser
                                                                    _model.removeFromFriendsList(
                                                                        listSearchChatItem
                                                                            .reference);
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                                title: Text(
                                                                  listSearchChatItem
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            2.0,
                                                                      ),
                                                                ),
                                                                subtitle: Text(
                                                                  listSearchChatItem
                                                                      .email,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                dense: false,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.friendsList
                                                                  .contains(
                                                                      listSearchChatItem
                                                                          .reference) ==
                                                              true) {
                                                            // addUser
                                                            _model.removeFromFriendsList(
                                                                listSearchChatItem
                                                                    .reference);
                                                            safeSetState(() {});
                                                          } else {
                                                            // addUser
                                                            _model.addToFriendsList(
                                                                listSearchChatItem
                                                                    .reference);
                                                            safeSetState(() {});
                                                          }

                                                          if (_model.friendsList
                                                                  .length >=
                                                              2) {
                                                            if (widget
                                                                    .chatRef !=
                                                                null) {
                                                              // updateChat

                                                              await widget
                                                                  .chatRef!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': _model
                                                                        .friendsList,
                                                                  },
                                                                ),
                                                              });
                                                              // updateChat
                                                              _model.updatedChatThreadSearch =
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
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context.pushNamed(
                                                                Chat2DetailsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'chatRef':
                                                                      serializeParam(
                                                                    widget
                                                                        .chatRef,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'chatRef':
                                                                      widget
                                                                          .chatRef,
                                                                },
                                                              );
                                                            } else {
                                                              _model.createThreadSearch =
                                                                  await CreateThreadIDCall
                                                                      .call();

                                                              if ((_model
                                                                      .createThreadSearch
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                // newChat

                                                                var chatsRecordReference =
                                                                    ChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await chatsRecordReference
                                                                    .set({
                                                                  ...createChatsRecordData(
                                                                    userA:
                                                                        currentUserReference,
                                                                    userB: _model
                                                                        .friendsList
                                                                        .elementAtOrNull(
                                                                            1),
                                                                    lastMessage:
                                                                        '',
                                                                    lastMessageTime:
                                                                        getCurrentTimestamp,
                                                                    lastMessageSentBy:
                                                                        currentUserReference,
                                                                    groupChatId:
                                                                        random_data.randomInteger(
                                                                            1000000,
                                                                            9999999),
                                                                    clinica:
                                                                        currentUserDocument
                                                                            ?.clinica,
                                                                    runAssistant:
                                                                        false,
                                                                    threadId:
                                                                        CreateThreadIDCall
                                                                            .threadId(
                                                                      (_model.createThreadSearch
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    doctor: valueOrDefault(currentUserDocument?.role, '') ==
                                                                            'Doctor'
                                                                        ? currentUserReference
                                                                        : _model
                                                                            .friendsList
                                                                            .elementAtOrNull(1),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users':
                                                                          _model
                                                                              .friendsList,
                                                                    },
                                                                  ),
                                                                });
                                                                _model.newChatThreadSearch =
                                                                    ChatsRecord
                                                                        .getDocumentFromData({
                                                                  ...createChatsRecordData(
                                                                    userA:
                                                                        currentUserReference,
                                                                    userB: _model
                                                                        .friendsList
                                                                        .elementAtOrNull(
                                                                            1),
                                                                    lastMessage:
                                                                        '',
                                                                    lastMessageTime:
                                                                        getCurrentTimestamp,
                                                                    lastMessageSentBy:
                                                                        currentUserReference,
                                                                    groupChatId:
                                                                        random_data.randomInteger(
                                                                            1000000,
                                                                            9999999),
                                                                    clinica:
                                                                        currentUserDocument
                                                                            ?.clinica,
                                                                    runAssistant:
                                                                        false,
                                                                    threadId:
                                                                        CreateThreadIDCall
                                                                            .threadId(
                                                                      (_model.createThreadSearch
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    doctor: valueOrDefault(currentUserDocument?.role, '') ==
                                                                            'Doctor'
                                                                        ? currentUserReference
                                                                        : _model
                                                                            .friendsList
                                                                            .elementAtOrNull(1),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users':
                                                                          _model
                                                                              .friendsList,
                                                                    },
                                                                  ),
                                                                }, chatsRecordReference);
                                                                if (Navigator.of(
                                                                        context)
                                                                    .canPop()) {
                                                                  context.pop();
                                                                }
                                                                context
                                                                    .pushNamed(
                                                                  Chat2DetailsWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'chatRef':
                                                                        serializeParam(
                                                                      _model
                                                                          .newChatThreadSearch,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'chatRef':
                                                                        _model
                                                                            .newChatThreadSearch,
                                                                  },
                                                                );
                                                              }
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Debes seleccionar al menos otro usuario para iniciar un chat.',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .lato(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        3000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: _model.friendsList
                                                                .contains(
                                                                    listSearchChatItem
                                                                        .reference)
                                                            ? 'Eliminar'
                                                            : 'Agregar',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .lato(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).accent4,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.friendsList.length >= 2) {
                                        if (widget.chatRef != null) {
                                          // updateChat

                                          await widget.chatRef!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'users': _model.friendsList,
                                              },
                                            ),
                                          });
                                          // updateChat
                                          _model.updatedChatThreadMain =
                                              await queryChatsRecordOnce(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord.where(
                                              'group_chat_id',
                                              isEqualTo:
                                                  widget.chatRef?.groupChatId,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            Chat2DetailsWidget.routeName,
                                            queryParameters: {
                                              'chatRef': serializeParam(
                                                widget.chatRef,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatRef': widget.chatRef,
                                            },
                                          );
                                        } else {
                                          _model.createThreadMain =
                                              await CreateThreadIDCall.call();

                                          if ((_model.createThreadMain
                                                  ?.succeeded ??
                                              true)) {
                                            // newChat

                                            var chatsRecordReference =
                                                ChatsRecord.collection.doc();
                                            await chatsRecordReference.set({
                                              ...createChatsRecordData(
                                                userA: currentUserReference,
                                                userB: _model.friendsList
                                                    .elementAtOrNull(1),
                                                lastMessage: '',
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    currentUserReference,
                                                groupChatId:
                                                    random_data.randomInteger(
                                                        1000000, 9999999),
                                                clinica: currentUserDocument
                                                    ?.clinica,
                                                runAssistant: false,
                                                threadId:
                                                    CreateThreadIDCall.threadId(
                                                  (_model.createThreadMain
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                doctor: valueOrDefault(
                                                            currentUserDocument
                                                                ?.role,
                                                            '') ==
                                                        'Doctor'
                                                    ? currentUserReference
                                                    : _model.friendsList
                                                        .elementAtOrNull(1),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'users': _model.friendsList,
                                                },
                                              ),
                                            });
                                            _model.newChatThreadMain =
                                                ChatsRecord
                                                    .getDocumentFromData({
                                              ...createChatsRecordData(
                                                userA: currentUserReference,
                                                userB: _model.friendsList
                                                    .elementAtOrNull(1),
                                                lastMessage: '',
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    currentUserReference,
                                                groupChatId:
                                                    random_data.randomInteger(
                                                        1000000, 9999999),
                                                clinica: currentUserDocument
                                                    ?.clinica,
                                                runAssistant: false,
                                                threadId:
                                                    CreateThreadIDCall.threadId(
                                                  (_model.createThreadMain
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                doctor: valueOrDefault(
                                                            currentUserDocument
                                                                ?.role,
                                                            '') ==
                                                        'Doctor'
                                                    ? currentUserReference
                                                    : _model.friendsList
                                                        .elementAtOrNull(1),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'users': _model.friendsList,
                                                },
                                              ),
                                            }, chatsRecordReference);
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              Chat2DetailsWidget.routeName,
                                              queryParameters: {
                                                'chatRef': serializeParam(
                                                  _model.newChatThreadMain,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatRef':
                                                    _model.newChatThreadMain,
                                              },
                                            );
                                          }
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Debes seleccionar al menos otro usuario para iniciar un chat.',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
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
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: widget.chatRef != null
                                        ? 'Agregar o eliminar del chat'
                                        : 'Enviar invitaciones',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.lato(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
