import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:plantea/pages/reset_pass_page.dart';

class ResetPassModel extends FlutterFlowModel<ResetPassWidget> {

  final unfocusNode = FocusNode();

  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

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
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();
  }
}
