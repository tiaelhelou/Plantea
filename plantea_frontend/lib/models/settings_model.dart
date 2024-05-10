// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../pages/settings_page.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {

  final unfocusNode = FocusNode();

  bool? switchValue;

  FocusNode? emailAdressFocusNode;
  TextEditingController? emailAdressTextController;
  String? Function(BuildContext, String?)? emailAdressTextControllerValidator;

  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAdressFocusNode?.dispose();
    emailAdressTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
