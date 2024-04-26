import 'package:flutter/material.dart';

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/plant_care_home_page.dart';

import '../models/log_model.dart';
export '../models/log_model.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  State<LogWidget> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  late LogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogModel());

    _model.emailAdressTextController ??= TextEditingController();
    _model.emailAdressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
          alignment: AlignmentDirectional(0, 1),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 10,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(45, 100, 45, 16),
                        child: TextFormField(
                          controller: _model.emailAdressTextController,
                          focusNode: _model.emailAdressFocusNode,
                          autofocus: true,
                          autofillHints: [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailAdressTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(45, 50, 45, 100),
                        child: TextFormField(
                         // controller: _model.textController2,
                          //focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          autofillHints: [AutofillHints.password],
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent2,
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                  ),
                          keyboardType: TextInputType.visiblePassword,
                         // validator: _model.textController2Validator
                          //    .asValidator(context),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 130),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PlantCareWidget()),
                              ); 
                            },
                            text: 'Log In',
                            options: FFButtonOptions(
                              width: 296,
                              height: 54,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                      ),
                    ],
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
