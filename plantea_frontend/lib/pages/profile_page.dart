import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/image_display.dart';
import 'package:plantea/pages/plant_care_home_page.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/settings_page.dart';

import '../models/profile_model.dart';
export '../models/profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  bool isCheckedIn = false;
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
          ),
          alignment: AlignmentDirectional(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, -1),
                      child: FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            if (isCheckedIn == false) {
                              isCheckedIn = !isCheckedIn;
                            }
                            // Toggle the isCheckedIn state
                          });
                          print(isCheckedIn ? 'CHECKED IN' : 'CHECKIN');
                        },
                        text: isCheckedIn
                            ? 'CHECKED IN'
                            : 'CHECKIN', // Change text based on isCheckedIn state
                        options: FFButtonOptions(
                          width: 110,
                          height: 34,
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF8A9A5B),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
                      child: FlutterFlowIconButton(
                        borderRadius: 20,
                        borderWidth: 0,
                        icon: Icon(
                          Icons.settings_suggest,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 50,
                        ),
                        onPressed: () {
                          print('settings pressed ...');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsWidget()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Icon(
                    Icons.tag_faces_sharp,
                    color: Color(0xFF355E3B),
                    size: 160,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Container(
                          width: 109,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFFBCB88A),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Text(
                            '',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'POINTS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PlantInfoWidget()),
                            // );
                          },
                          text: 'REDEEM',
                          options: FFButtonOptions(
                            width: 109,
                            height: 40,
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
                    ),
                  ],
                ),
              ),
              Expanded(
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
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1518709779341-56cf4535e94b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxST1NFU3xlbnwwfHx8fDE3MTQzODg2NTJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1585337913966-114ba3cf1f80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8Zmxvd2VyfGVufDB8fHx8MTcxNDM4MDY4OHww&ixlib=rb-4.0.3&q=80&w=1080',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Generated code for this Container Widget...
              Container(
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
                          MaterialPageRoute(
                              builder: (context) => DonateWidget()),
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
                          MaterialPageRoute(
                              builder: (context) => ProfileWidget()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
