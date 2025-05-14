import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat2_invite_users_widget.dart' show Chat2InviteUsersWidget;
import 'package:flutter/material.dart';

class Chat2InviteUsersModel extends FlutterFlowModel<Chat2InviteUsersWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in chat_2_InviteUsers widget.
  ChatsRecord? chat;
  // State field(s) for tf_searchChatUser widget.
  FocusNode? tfSearchChatUserFocusNode;
  TextEditingController? tfSearchChatUserTextController;
  String? Function(BuildContext, String?)?
      tfSearchChatUserTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.
  Map<UsersRecord, bool> checkboxListTileValueMap1 = {};
  List<UsersRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? updatedChatThread;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Button widget.
  ApiCallResponse? createThread;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatThread;
  // State field(s) for CheckboxListTile widget.
  Map<UsersRecord, bool> checkboxListTileValueMap2 = {};
  List<UsersRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? updatedChatThreadSearch;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Button widget.
  ApiCallResponse? createThreadSearch;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatThreadSearch;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? updatedChatThreadMain;
  // Stores action output result for [Backend Call - API (Create Thread ID)] action in Button widget.
  ApiCallResponse? createThreadMain;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatThreadMain;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfSearchChatUserFocusNode?.dispose();
    tfSearchChatUserTextController?.dispose();
  }
}
