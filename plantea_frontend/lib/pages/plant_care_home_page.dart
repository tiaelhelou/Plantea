import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plantcare_model.dart';
export '../models/plantcare_model.dart';

class PlantcareWidget extends StatefulWidget {
  const PlantcareWidget({super.key});

  @override
  State<PlantcareWidget> createState() => _PlantcareCopyWidgetState();
}

class _PlantcareCopyWidgetState extends State<PlantcareWidget> {
  late PlantcareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantcareModel());

    _model.textController ??= TextEditingController(text: 'search');
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: 420,
          height: 842,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '',
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF8A9A5B),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 16),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    autofillHints: [AutofillHints.email],
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFA8ABAC),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF355E3B),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).info,
                      contentPadding: EdgeInsets.all(6),
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 50),
                    child: Text(
                      'MY PLANTS',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 296,
                      height: 150,
                      constraints: BoxConstraints(
                        minWidth: 296,
                        minHeight: 180,
                        maxWidth: 296,
                        maxHeight: 180,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional(0, 0),
                          image: Image.network(
                            'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                          child: FlutterFlowIconButton(
                            borderRadius: 5,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFFFAF49D),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Color(0xFF355E3B),
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 296,
                      height: 150,
                      constraints: BoxConstraints(
                        minWidth: 296,
                        minHeight: 180,
                        maxWidth: 296,
                        maxHeight: 180,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional(0, 0),
                          image: Image.network(
                            'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                          child: FlutterFlowIconButton(
                            borderRadius: 5,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFFFAF49D),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Color(0xFF355E3B),
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 296,
                      height: 150,
                      constraints: BoxConstraints(
                        minWidth: 296,
                        minHeight: 180,
                        maxWidth: 296,
                        maxHeight: 180,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional(0, 0),
                          image: Image.network(
                            'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                          child: FlutterFlowIconButton(
                            borderRadius: 5,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFFFAF49D),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Color(0xFF355E3B),
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 296,
                      height: 150,
                      constraints: BoxConstraints(
                        minWidth: 296,
                        minHeight: 180,
                        maxWidth: 296,
                        maxHeight: 180,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional(0, 0),
                          image: Image.network(
                            'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                          child: FlutterFlowIconButton(
                            borderRadius: 5,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFFFAF49D),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Color(0xFF355E3B),
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
