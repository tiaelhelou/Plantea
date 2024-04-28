import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/plant_care_home_page.dart';

import '../models/add_plant_model.dart';
export '../models/add_plant_model.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four']; // list of plants
class AddPlantWidget extends StatefulWidget {
  const AddPlantWidget({super.key});
  

  @override
  State<AddPlantWidget> createState() => _AddPlantWidgetState();
}

class _AddPlantWidgetState extends State<AddPlantWidget> {
  late AddPlantModel _model;
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  String dropdownValue = list.first;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPlantModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }
  String? selectedValue;
final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent2,
        body: Container(
          width: 1445,
          height: 1373,
          constraints: BoxConstraints(
            minWidth: 20,
            minHeight: 20,
            maxWidth: 2000,
            maxHeight: 2000,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/background.jpg',
              ).image,
            ),
          ),
     