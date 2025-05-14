import '/flutter_flow/flutter_flow_util.dart';
import 'test2_widget.dart' show Test2Widget;
import 'package:flutter/material.dart';

class Test2Model extends FlutterFlowModel<Test2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchCIE10] action in TextField widget.
  List<String>? list;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
