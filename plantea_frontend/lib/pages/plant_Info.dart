import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/api.dart';
import 'package:plantea/camera_screens/camera_page.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plant_info_model.dart';
export '../models/plant_info_model.dart';

class PlantInfoWidget extends StatefulWidget {
  final int? id;
  final String? nickname;

  const PlantInfoWidget({
    Key? key,
    required this.id,
    required this.nickname,
  }) : super(key: key);

  @override
  State<PlantInfoWidget> createState() => _PlantInfoWidgetState();
}

class _PlantInfoWidgetState extends State<PlantInfoWidget> {
  late PlantInfoModel _model;
  String tulip = 'tul';
  String maple = 'map';
  String image = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String description = '';
  String details = '';
  String characteristics = '';
  String category = '';
  String? displayName = '';
  bool myplant = false;
  bool check() {
    if (widget.id == 1) {
      image = tulip;
    } else {
      image = maple;
    }
    if (widget.nickname != null) {
      myplant = true;
      // Use widget.nickname to access the nickname passed to the widget
      print('Nickname: ${widget.nickname}');
      return myplant;
    }
    return false;
  }

  Future<void> getInfo() async {
    List data = await Api.displayPlantInfo(widget.id);

    List plantNames =
        data.map((plantDetails) => plantDetails["plant_name"]).toList();
    print(plantNames);
    List plantdesc =
        data.map((plantDetails) => plantDetails["plant_description"]).toList();
    print(plantdesc);

    List plantchara = data
        .map((plantDetails) => plantDetails["plant_characteristics"])
        .toList();
    print(plantchara);
    List plantdet =
        data.map((plantDetails) => plantDetails["plant_details"]).toList();
    print(plantdet);
    List plantcat =
        data.map((plantDetails) => plantDetails["plant_category"]).toList();
    print(plantcat);

    //my plant

    characteristics = plantchara[0].toString();
    details = plantdet[0].toString();
    category = plantcat[0].toString();
    description = plantdesc[0].toString();
    name = plantNames[0].toString();
    if (check()) {
      displayName = widget.nickname;
    }
  }

  @override
  void initState() {
    getInfo();
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
                          Center(
                            child: Text(
                              displayName!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Text(
                            'Images',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/$image.jpeg', // Replace 'assets/image1.jpg' with your asset image path
                                          width: 193,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      // Add more images as needed using the same pattern
                                    ],
                                  ),
                                )),
                          ),

                          //plant informtion displayed. extracted from db ad replaced in container instead of  "Input here from db"
                          //replace hardcoded for main text
                          Text(
                            'Description',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                                  description, ////////////////////////////////////////dsc
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                    "$details        Category:   $category", //////////////////////////////////////////det
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                                characteristics,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10)),
                      ),
                    ),
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
