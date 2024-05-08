// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/api.dart';
import 'package:plantea/camera_screens/camera_page.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/plant_Info.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/pages/settings_page.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';
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
          body: Column(
            children: [
              Expanded(
                child: Container(
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
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
                                          builder: (context) =>
                                              const SettingsWidget()),
                                    );
                                  },
                                  text: '',
                                  icon: FaIcon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30,
                                  ),
                                  options: FFButtonOptions(
                                    width: 78,
                                    height: 34,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 5, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
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
                            print('edit pressed ...');
                          },
                          text: 'Edit Photo',
                          options: FFButtonOptions(
                            width: 119,
                            height: 34,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
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
                      Form(
                        key: _formKey,
                        child: Expanded(
                          flex: 10,
                          child: Container(
                            width: 389,
                            height: 574,
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                              maxWidth: 2000,
                              maxHeight: 2000,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                /// add name email and button
                                ///
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 245, 10),
                                  child: Text(
                                    'NAME',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      45, 0, 45, 16),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFA8ABAC),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 245, 10),
                                  child: Text(
                                    'EMAIL',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      45, 0, 45, 16),
                                  child: TextFormField(
                                    controller: emailController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFA8ABAC),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 50),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_formKey.currentState != null &&
                                          _formKey.currentState!.validate()) {
                                        bool response = await Api.editProfile(
                                            nameController.text,
                                            emailController.text);

                                        if (response) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileWidget()),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text('Incorrect')),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Please fill input')),
                                        );
                                      }
                                    },
                                    text: 'Save Changes',
                                    options: FFButtonOptions(
                                      width: 296,
                                      height: 54,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Color(0xFF355E3B),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            width: 500,
            height: 89,
            decoration: BoxDecoration(
              color: Color(0xFF355E3B),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.library_books_outlined,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantLibraryWidget()),
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: FaIcon(
                    FontAwesomeIcons.viadeo,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantcareWidget()),
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35,
                  ),
                  onPressed: () {
                    print('camera pressed ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navigator(
                          pages: [
                            MaterialPage(
                              child: ChangeNotifierProvider(
                                create: (context) => IdentificationProvider(),
                                builder: (context, child) {
                                  return camera();
                                },
                              ),
                            ),
                          ],
                          onPopPage: (route, result) => route.didPop(result),
                        ),
                      ),
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: FaIcon(
                    FontAwesomeIcons.donate,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonateWidget()),
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.person,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileWidget()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
