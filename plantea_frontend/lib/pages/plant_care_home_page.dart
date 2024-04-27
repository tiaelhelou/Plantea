import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/plantcare_model.dart';
export '../models/plantcare_model.dart';

class PlantcareWidget extends StatefulWidget {
  const PlantcareWidget({super.key});
  
  

  @override
  State<PlantcareWidget> createState() => _PlantcareWidgetState();
}

class _PlantcareWidgetState extends State<PlantcareWidget> {
  late PlantcareModel _model;
final SearchController controller = SearchController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
   final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  
  @override
  void initState() {
        _foundUsers = _allUsers;
    super.initState();
    _model = createModel(context, () => PlantcareModel());

    _model.textController ??= TextEditingController(text: 'search');
    _model.textFieldFocusNode ??= FocusNode();
  }
 void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

  }
  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       final List<String> _results = [];
  
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
          child: Container(
            width: 394,
            height: 900,
            constraints: BoxConstraints(
              minWidth: 20,
              minHeight: 20,
              maxWidth: 2000,
              maxHeight: 2000,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded( //button
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: '',
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                ),
                ///search
                ///
                Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration:  InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search),
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
      
      filled: true,
      fillColor: FlutterFlowTheme.of(context).info,
      contentPadding: EdgeInsets.all(6),
    ),
    style: FlutterFlowTheme.of(context).labelMedium.override(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
        ),
            ),
            const SizedBox(
              height: 20,
            ),
            /*Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color:Colors.white),
                    ),
                    title: Text(_foundUsers[index]['name'], style:TextStyle(
                      color:Colors.white
                    )),
                    subtitle: Text(
                        '${_foundUsers[index]["age"].toString()} years old',style:TextStyle(
                        color:Colors.white
                    )),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),*/
          ],
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
                Expanded(
                  flex: 10,
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: Container(
                                  width: 296,
                                  height: 150,
                                  constraints: BoxConstraints(
                                    minWidth: 296,
                                    minHeight: 180,
                                    maxWidth: 296,
                                    maxHeight: 180,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 25),
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 50),
                                child: Container(
                                  width: 296,
                                  height: 150,
                                  constraints: BoxConstraints(
                                    minWidth: 296,
                                    minHeight: 180,
                                    maxWidth: 296,
                                    maxHeight: 180,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: AlignmentDirectional(0, 1),
                                      image: Image.network(
                                        'https://images.unsplash.com/photo-1431263154979-0982327fccbb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8RkxPV0VSfGVufDB8fHx8MTcxNDE1OTYxOHww&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 25),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 5,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        fillColor: Color(0xFFFAF49D),
                                        icon: Icon(
                                          Icons.add,
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 50),
                                child: Container(
                                  width: 296,
                                  height: 150,
                                  constraints: BoxConstraints(
                                    minWidth: 296,
                                    minHeight: 180,
                                    maxWidth: 296,
                                    maxHeight: 180,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: AlignmentDirectional(0, 1),
                                      image: Image.network(
                                        'https://images.unsplash.com/photo-1431263154979-0982327fccbb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8RkxPV0VSfGVufDB8fHx8MTcxNDE1OTYxOHww&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 25),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 5,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        fillColor: Color(0xFFFAF49D),
                                        icon: Icon(
                                          Icons.add,
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
                              ),
                            ],
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
      ),
    );
  }
}
