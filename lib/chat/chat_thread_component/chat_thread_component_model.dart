import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/chat_thread_update/chat_thread_update_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_thread_component_widget.dart' show ChatThreadComponentWidget;
import 'package:flutter/material.dart';

class ChatThreadComponentModel
    extends FlutterFlowModel<ChatThreadComponentWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> lastSeenBy = [];
  void addToLastSeenBy(DocumentReference item) => lastSeenBy.add(item);
  void removeFromLastSeenBy(DocumentReference item) => lastSeenBy.remove(item);
  void removeAtIndexFromLastSeenBy(int index) => lastSeenBy.removeAt(index);
  void insertAtIndexInLastSeenBy(int index, DocumentReference item) =>
      lastSeenBy.insert(index, item);
  void updateLastSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastSeenBy[index] = updateFn(lastSeenBy[index]);

  List<String> imagesUploaded = [];
  void addToImagesUploaded(String item) => imagesUploaded.add(item);
  void removeFromImagesUploaded(String item) => imagesUploaded.remove(item);
  void removeAtIndexFromImagesUploaded(int index) =>
      imagesUploaded.removeAt(index);
  void insertAtIndexInImagesUploaded(int index, String item) =>
      imagesUploaded.insert(index, item);
  void updateImagesUploadedAtIndex(int index, Function(String) updateFn) =>
      imagesUploaded[index] = updateFn(imagesUploaded[index]);

  String? userMessage;

  bool assistantDelay = false;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  List<ChatMessagesRecord>? listViewPreviousSnapshot;
  // Models for chat_threadUpdate dynamic component.
  late FlutterFlowDynamicModels<ChatThreadUpdateModel> chatThreadUpdateModels;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  ChatsRecord? chatData;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? newChatMessageAssistant;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  UsersRecord? queryDoctorAi;
  // Stores action output result for [Backend Call - API (Assistant Test)] action in TextField widget.
  ApiCallResponse? responseAssistant;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? chatAssistantSend;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  UsersRecord? dataDoc;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? newChatMessageDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatsRecord? chatDataButton;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChatMessageAssistantCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UsersRecord? doctorQueryCredits;
  // Stores action output result for [Backend Call - API (Assistant Test)] action in IconButton widget.
  ApiCallResponse? responseAssistantCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? chatAssistantSendCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UsersRecord? dataDocCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChatMessageDocCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    chatThreadUpdateModels =
        FlutterFlowDynamicModels(() => ChatThreadUpdateModel());
  }

  @override
  void dispose() {
    chatThreadUpdateModels.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
