// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/api.dart';
import 'package:plantea/camera_screens/camera_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/plant_care_home_page.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';

import '../models/redeem_model.dart';
export '../models/redeem_model.dart';

String result = '';

class RedeemWidget extends StatefulWidget {
  const RedeemWidget({Key? key}) : super(key: key);

  @override
  State<RedeemWidget> createState() => _RedeemWidgetState();
}

class _RedeemWidgetState extends State<RedeemWidget> {
  late RedeemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;

  List<String> list = [];
  List<String> pointList = [];

  Future<void> extractRewards() async {
    List<String> names = [];
    List<String> points = [];
    List<dynamic> rewards = await Api.displayRewards();
    
    for (var reward in rewards) {
      String rewardName = reward[
          'gift_name']; 
      if (rewardName != null) {
        names.add(rewardName);
      }
      String gift_point = reward['gift_points'].toString();
      if (gift_point != null) {
        points.add(gift_point);
      }
    }
    pointList.addAll(points);
    list.addAll(names);
  }

  Future<String> totalPoints() async {
    String total = await Api.displayTotalPoint();
    if (total == null)
      return '0';
    else {
      return total;
    }
  }

  void _reloadPage() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    extractRewards();
    fetchStringFromFuture();

    super.initState();
    _model = createModel(context, () => RedeemModel());
  }

  Future<void> fetchStringFromFuture() async {
    String futureResult = await totalPoints();
    setState(() {
      result = futureResult;
    });
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
        body: Column(
          children: [
            Expanded(
              child: Container(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileWidget()),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 50, 0, 50),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        result,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10)),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: SingleChildScrollView(
                        child: Container(
                            width: 427,
                            height: 658,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView.builder(
                              itemCount: list
                                  .length, 
                              itemBuilder: (context, index) {
                                var item = list[index];

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
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${list[index]}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            10), 
                                                    child: Text(
                                                      pointList[index],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 20,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.card_giftcard_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 35,
                                          ),
                                          onPressed: () async {
                                            bool response =
                                                await Api.redeemReward(
                                                    list.elementAt(index));
                                            if (response) {
                                              print('gift deleted  ...');
                                              list.removeAt(index);
                                              _reloadPage();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text('Incorrect')),
                                              );
                                            }
                                          },
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
