import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/plant_Info.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';


class PlantInfoModel extends FlutterFlowModel<PlantInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
