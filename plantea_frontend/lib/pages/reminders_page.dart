// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/camera_screens/camera_page.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/plant_care_home_page.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';

import '../models/reminders_model.dart';
export '../models/reminders_model.dart';

const List<String> list = <String>['water', 'sunlight', 'Three', 'Four'];

class RemindersWidget extends StatefulWidget {
  const RemindersWidget({super.key});

  @override
  State<RemindersWidget> createState() => _RemindersWidgetState();
}

class _RemindersWidgetState extends State<RemindersWidget> {
  String? savetype;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late RemindersModel _model;
  String? _selectedtype1;
  String? _selectedtype2;
  String? _selectedtype3;

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemindersModel());
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
        body: Column(
          children: [
            Expanded(
              child: Container(
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
                    fit: BoxFit.contain,
                    alignment: AlignmentDirectional(0, -1),
                    image: Image.network(
                      'https://images.unsplash.com/photo-1495908333425-29a1e0918c5f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxncm93aW5nJTIwZmxvd2VyfGVufDB8fHx8MTcxNDQ1NjEyMXww&ixlib=rb-4.0.3&q=80&w=1080',
                    ).image,
                  ),
                ),
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: 389,
                  height: 550,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: Container(
                          width: 311,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0xFF8A9A5B),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFFF3F3F3), Color(0xFFF3F3F3)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, 1),
                              end: AlignmentDirectional(0, -1),
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Reminders',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Container(
                                width: 296,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBDC9A0),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 32,
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 0),
                                        child: DropdownButton<String>(
                                          value: _selectedtype1,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 30,
                                          elevation: 0,
                                          style: TextStyle(color: Colors.black),
                                          underline:
                                              SizedBox(), 
                                          onChanged: (String? newValue1) {
                                            setState(() {
                                              savetype = newValue1;
                                              _selectedtype1 = newValue1;
                                            });
                                          },

                                          items: <String>[
                                            'sunlight',
                                            'water',
                                            'repot'
                                          ] 
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 5, 10, 5),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 5,
                                        borderWidth: 1,
                                        buttonSize: 50,
                                        fillColor: Color(0xFF8A9A5B),
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 296,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBDC9A0),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 32,
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 0),
                                        child: DropdownButton<String>(
                                          value: _selectedtype2,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 30,
                                          elevation: 0,
                                          style: TextStyle(color: Colors.black),
                                          underline:
                                              SizedBox(), 
                                          onChanged: (String? newValue2) {
                                            setState(() {
                                              savetype = newValue2;
                                              _selectedtype2 = newValue2;
                                            });
                                          },

                                          items: <String>[
                                            'sunlight',
                                            'water',
                                            'repot'
                                          ] 
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 5, 10, 5),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 5,
                                        borderWidth: 1,
                                        buttonSize: 50,
                                        fillColor: Color(0xFF8A9A5B),
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 296,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBDC9A0),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 32,
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 0),
                                        child: DropdownButton<String>(
                                          value: _selectedtype3,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 30,
                                          elevation: 0,
                                          style: TextStyle(color: Colors.black),
                                          underline:
                                              SizedBox(), 
                                          onChanged: (String? newValue3) {
                                            setState(() {
                                              savetype = newValue3;
                                              _selectedtype3 = newValue3;
                                            });
                                          },

                                          items: <String>[
                                            'sunlight',
                                            'water',
                                            'repot'
                                          ]
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 5, 10, 5),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 5,
                                        borderWidth: 1,
                                        buttonSize: 50,
                                        fillColor: Color(0xFF8A9A5B),
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 10)),
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
        bottomNavigationBar: Container(
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
                    MaterialPageRoute(builder: (context) => PlantcareWidget()),
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
        ),
      ),
    );
  }
}
