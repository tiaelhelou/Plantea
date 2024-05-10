import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/api.dart';
import 'package:plantea/camera_screens/camera_page.dart';
import 'package:plantea/pages/add_plant_page.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/plant_Info.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/pages/reminders_page.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plantcare_model.dart';
export '../models/plantcare_model.dart';

/**
 * the list should be displayed in the listview and search bar
 *  get from db 
 *  store container in list 
 *  let list diplay container from db then store selected container and display it only
 * 
 */

/**
 * when the user clicks the button the plant details (plant id, plantwill be transported to the next page  to add a reminder  to this specific plant
 */

class PlantcareWidget extends StatefulWidget {
  const PlantcareWidget({Key? key}) : super(key: key);

  @override
  State<PlantcareWidget> createState() => _PlantcareCopyWidgetState();
}

class _PlantcareCopyWidgetState extends State<PlantcareWidget> {
  late PlantcareModel _model;
  TextEditingController nameController = TextEditingController();
  List<int> plantID = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  List<String> list = [];
  List<String> newList = [];
  String tulip = 'tul.jpeg';
  String maple = 'map.jpeg';
  String image = '';

  void check(int? id) {
    print(id);
    if (id == 1) {
      image = tulip;
    } else if (id == 2) {
      image = maple;
    } else {
      image = 'def.jpg';
    }
  }

  void initializeNewList() {
    newList = list.sublist(1);
  }

  Future<void> extractPlantNames() async {
    List<String> plantNames = [];
    List<dynamic> userPlants = await Api.viewPlants(false);
    // Iterate over each JSON object in the list
    for (var plant in userPlants) {
      String plantName = plant[
          'plant_nickname']; // Assuming 'plant_nickname' is the key for the plant name
      if (plantName != null) {
        plantNames.add(plantName); // Add the plant name to the list
      }
    }
    list = ['DisplayAll'];
    list.addAll(plantNames);

    initializeNewList();
  }

  Future<int?> getPlantID(String nick__name) async {
    plantID = [];
    List<dynamic> userPlants = await Api.viewPlants(true);
    for (var plant in userPlants) {
      int? plantid = plant['plant_id'];
      if (plantid != null) {
        plantID.add(plantid);
      }
    }

    int index = newList.indexOf(nick__name);
    print(newList);
    print(plantID);
    return index != -1 ? plantID[index] : null;
  }

  Future<int?> getPlantIDp() async {
    plantID = [];
    List<dynamic> userPlants = await Api.viewPlants(true);
    for (var plant in userPlants) {
      int? plantid = plant['plant_id'];
      if (plantid != null) {
        plantID.add(plantid);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getPlantIDp();
    _model = createModel(context, () => PlantcareModel());

    _model.textController ??= TextEditingController(text: 'search');
    _model.textFieldFocusNode ??= FocusNode();
    extractPlantNames();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Container> containerList = [];

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                        child: SizedBox(
                          width: 80,
                          child: FlutterFlowIconButton(
                            borderRadius: 5,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFF8A9A5B),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPlantWidget()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: list
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              textEditingController.text = value ?? '';
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 54,
                            width: 296,
                          ),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for an item...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 20, 0, 30),
                        child: Text(
                          'MY PLANTS',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 644,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: selectedValue != null &&
                                selectedValue != 'DisplayAll'
                            ? 1
                            : newList.length,
                        itemBuilder: (context, index) {
                          if (selectedValue != null &&
                              selectedValue != 'DisplayAll') {
                            check(plantID[index]);
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  int? nicknameInfId =
                                      await getPlantID(selectedValue!);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlantInfoWidget(
                                            id: nicknameInfId!,
                                            nickname: selectedValue!)),
                                  );
                                },
                                child: Container(
                                  width: 296,
                                  height: 180,
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
                                      image: Image.asset(
                                        'assets/$image', // image of selected plant or default
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(25, 25, 50, 25),
                                        child: Text(
                                          newList[index] ?? '',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                230, 235, 233, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 25, 25),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.timer_sharp,
                                              color: Color.fromARGB(
                                                  255, 205, 206, 205),
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RemindersWidget(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            check(plantID[index]);
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  int? nicknameInfId =
                                      await getPlantID(newList[index]);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlantInfoWidget(
                                            id: nicknameInfId!,
                                            nickname: newList[index])),
                                  );
                                },
                                child: Container(
                                  width: 296,
                                  height: 180,
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
                                      image: Image.asset(
                                        'assets/$image', // image of selected plant or default
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(25, 25, 50, 25),
                                        child: Text(
                                          newList[index] ?? '',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                241, 253, 249, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 25, 25),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.timer_sharp,
                                              color: Color.fromARGB(
                                                  255, 248, 249, 248),
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RemindersWidget(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
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
