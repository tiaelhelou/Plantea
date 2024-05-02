import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/add_plant_page.dart';
import 'package:plantea/pages/welcome_page.dart';
import '../models/signup_model.dart';
export '../models/signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  }
}