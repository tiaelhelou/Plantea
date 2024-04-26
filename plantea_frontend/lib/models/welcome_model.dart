// TODO Implement this library.
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'package:flutter/material.dart';
import 'package:plantea/pages/welcome_page.dart';


class WelcomeModel extends FlutterFlowModel<WelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
