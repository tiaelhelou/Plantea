// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/pages/plant_Info.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/pages/settings_page.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/edit_profile_model.dart';
export '../models/edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

    @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());
  }

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
        body: Container(
          width: 1583,
          height: 1373,
          constraints: BoxConstraints(
            minWidth: 20,
            minHeight: 20,
            maxWidth: 2000,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFE5FFE7),
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: AlignmentDirectional(0, -1),
              image: Image.network(
                '',
              ).image,
            ),
          ),
          alignment: AlignmentDirectional(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, -1),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Back Button pressed ...');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsWidget()),
                            );
                          },
                          text: '',
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          options: FFButtonOptions(
                            width: 78,
                            height: 34,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: Color(0xFF8A9A5B),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 13,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                  child: Icon(
                    Icons.tag_faces_sharp,
                    color: Color(0xFF355E3B),
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Edit Photo',
                  options: FFButtonOptions(
                    width: 119,
                    height: 34,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF8A9A5B),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 13,
                          letterSpacing: 0,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}