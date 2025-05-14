import '/chat/chat_delete_dialog/chat_delete_dialog_widget.dart';
import '/chat/chat_user_list_small/chat_user_list_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_overlay_widget.dart' show ChatDetailsOverlayWidget;
import 'package:flutter/material.dart';

class ChatDetailsOverlayModel
    extends FlutterFlowModel<ChatDetailsOverlayWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for chat_user_ListSmall dynamic component.
  late FlutterFlowDynamicModels<ChatUserListSmallModel> chatUserListSmallModels;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for chat_Delete_Dialog component.
  late ChatDeleteDialogModel chatDeleteDialogModel;

  @override
  void initState(BuildContext context) {
    chatUserListSmallModels =
        FlutterFlowDynamicModels(() => ChatUserListSmallModel());
    chatDeleteDialogModel = createModel(context, () => ChatDeleteDialogModel());
  }

  @override
  void dispose() {
    chatUserListSmallModels.dispose();
    chatDeleteDialogModel.dispose();
  }
}
