import 'package:flutter/material.dart';

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/add_plant_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/redeem_model.dart';
export '../models/redeem_model.dart';

const List<String> list = <String>[
  'DisplayAll',
  'One',
  'Two',
  'Three',
  'Four',
  'One1',
  'Two2',
  'Three3',
  'One11',
  'Two22',
  'Three33',
  'Four44'
];

class RedeemWidget extends StatefulWidget {
  const RedeemWidget({Key? key}) : super(key: key);

  @override
  State<RedeemWidget> createState() => _RedeemWidgetState();
}

class _RedeemWidgetState extends State<RedeemWidget> {
  late RedeemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedeemModel());
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
          child: Wrap(
            spacing: 0,
            runSpacing: 0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('back pressed ...');
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
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 0,
                    runSpacing: 0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                          child: Container(
                            width: 109,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFFBCB88A),
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  ' ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Points',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ].divide(SizedBox(width: 10)),
              ),
              Padding(
                //// list of redeeeem
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  child: Container(
                      width: 427,
                      height: 658,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView.builder(
                        itemCount:
                            list.length, // Conditionally set the itemCount
                        itemBuilder: (context, index) {
                          // Retrieve the item from yourList

                          /////////////add cond if selected value null or not

                          // Return a container with a button inside
                          var item = list[index];
                          print(item);
                          print("object");

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Container(
                                  width: 300,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFBCB88A),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                             
                            ].divide(SizedBox(width: 0)),
                          );
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
