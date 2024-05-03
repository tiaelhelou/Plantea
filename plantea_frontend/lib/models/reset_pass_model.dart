// TODO Implement this library.
// TODO Implement this library.
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:plantea/pages/reset_pass_page.dart';

class ResetPassModel extends FlutterFlowModel<ResetPassWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for oldPass widget.
  FocusNode? oldPassFocusNode;
  TextEditingController? oldPassTextController;
  String? Function(BuildContext, String?)? oldPassTextControllerValidator;
  // State field(s) for newpassword widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  late bool newpasswordVisibility;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newpasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oldPassFocusNode?.dispose();
    oldPassTextController?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();
  }
}
