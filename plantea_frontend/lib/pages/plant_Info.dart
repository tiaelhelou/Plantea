import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plant_info_model.dart';
export '../models/plant_info_model.dart';

class PlantInfoWidget extends StatefulWidget {
  const PlantInfoWidget(int? id, String? nickname, {super.key});

  @override
  State<PlantInfoWidget> createState() => _PlantInfoWidgetState();
}

class _PlantInfoWidgetState extends State<PlantInfoWidget> {
  late PlantInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myplant = false;
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
                'assets/background.jpg', // image of selected plant or default
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Images',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      // containe images for specified plant which will be extracted from db
                      width: 413,
                      height: 130,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(8),
                              //   child: Image.network(
                              //     'https://picsum.photos/seed/942/600',
                              //     width: 193,
                              //     height: 1,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/942/600',
                                  width: 193,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/555/600',
                                  width: 193,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ].divide(SizedBox(width: 10)),
                          ),
                        ),
                      ),
                    ),

                    //plant informtion displayed. extracted from db ad replaced in container instead of  "Input here from db"
                    //replace hardcoded for main text
                    Text(
                      'Description',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 340,
                          height: 81,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0xFF9FBCAA),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Text(
                            'Input here from db',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                        Text(
                          'Details',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 340,
                            height: 81,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F3F3),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0xFF9FBCAA),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Text(
                              'Input here from db',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ),
                        if (myplant != false)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 340,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xFF9FBCAA),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Text(
                                'HEALTH: Good',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    Text(
                      'Characteristics',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: 340,
                        height: 81,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0xFF9FBCAA),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Text(
                          'Input here from db',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ),
                    // Text(
                    //   'Description',
                    //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //         fontFamily: 'Montserrat',
                    //         fontSize: 16,
                    //         letterSpacing: 0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    // ),
                    // Align(
                    //   alignment: AlignmentDirectional(0, 0),
                    //   child: Container(
                    //     width: 340,
                    //     height: 81,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xFFF3F3F3),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           blurRadius: 4,
                    //           color: Color(0xFF9FBCAA),
                    //           offset: Offset(
                    //             0,
                    //             2,
                    //           ),
                    //         )
                    //       ],
                    //       borderRadius: BorderRadius.circular(23),
                    //     ),
                    //     child: Text(
                    //       'Input here from db',
                    //       style:
                    //           FlutterFlowTheme.of(context).bodyMedium.override(
                    //                 fontFamily: 'Montserrat',
                    //                 letterSpacing: 0,
                    //               ),
                    //     ),
                    //   ),
                    // ),
                  ].divide(SizedBox(height: 10)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
