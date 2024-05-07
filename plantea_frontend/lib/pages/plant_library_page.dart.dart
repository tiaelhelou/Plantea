import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/api.dart';
import 'package:plantea/pages/add_plant_page.dart';
import 'package:plantea/pages/plant_Info.dart';
import 'package:plantea/pages/reminders_page.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plantLibrary_model.dart';
export '../models/plantLibrary_model.dart';

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
class PlantLibraryWidget extends StatefulWidget {
  const PlantLibraryWidget({super.key});

  @override
  State<PlantLibraryWidget> createState() => _PlantLibraryCopyWidgetState();
}

class _PlantLibraryCopyWidgetState extends State<PlantLibraryWidget> {
  late PlantLibraryModel _model;
  TextEditingController nameController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  List<String> list = [];
  List<String> newList = [];
  List<int> idlist = [];

  void initializeNewList() {
    newList = list.sublist(1);
  }

  Future<void> extractPlantNames() async {
    List<String> plantNames = [];
    List<int> plantid = [];
    List<dynamic> userPlants = await Api.viewPlant();
    // Iterate over each JSON object in the list
    for (var plant in userPlants) {
      String plantName = plant[
          'plant_name']; // Assuming 'plant_nickname' is the key for the plant name
      if (plantName != null) {
        plantNames.add(plantName); // Add the plant name to the list
      }
      int plantID = plant['plant_id'];
      if (plantID != null) {
        plantid.add(plantID);
      }
    }

    idlist.addAll(plantid);
    list = ['DisplayAll'];
    list.addAll(plantNames);

    initializeNewList();
  }

  int? getPlantinfoID(String name) {
    int index = newList.indexOf(name);
    if (index != null) {
      return index != -1 ? idlist[index] : null;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    extractPlantNames();
    _model = createModel(context, () => PlantLibraryModel());

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
    List<Container> containerList = [];

    // containerList.add(Container(
    //   width: 296,
    //   height: 150,
    //   constraints: BoxConstraints(
    //     minWidth: 296,
    //     minHeight: 180,
    //     maxWidth: 296,
    //     maxHeight: 180,
    //   ),
    //   decoration: BoxDecoration(
    //     color: FlutterFlowTheme.of(context).secondaryBackground,
    //     image: DecorationImage(
    //       fit: BoxFit.cover,
    //       alignment: AlignmentDirectional(0, 0),
    //       image: Image.network(
    //         'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
    //       ).image,
    //     ),
    //     borderRadius: BorderRadius.circular(23),
    //   ),
    // ));

// Add more containers to the list as needed

// To use the list of containers, you can display them in a ListView or any other widget that accepts a list of widgets.
//create a container for every item in user plant to be displayed

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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade700), // Dark grey border
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
                        value: selectedValue, //// selected container
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
                            return item.value.toString().contains(searchValue);
                          },
                        ),
                        // This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                // Generated code for this Container Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Plants',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                        width: 400,
                        height: 644,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                          ),
                          itemCount: selectedValue != null &&
                                  selectedValue != 'DisplayAll'
                              ? 1
                              : newList
                                  .length, // Conditionally set the itemCount
                          itemBuilder: (context, index) {
                            // Retrieve the item from yourList

                            /////////////add cond if selected value null or not

                            if (selectedValue != null &&
                                selectedValue != 'DisplayAll') {
                              // Display only one container
                              var item =
                                  selectedValue; // Use the selected value

                              return GestureDetector(
                                  onTap: () {
                                    print(' 1 IconButton pressed ...');
                                    // var plantInfoId =
                                    //     getPlantID(); // add to shred prefs or send through page

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlantInfoWidget(
                                              getPlantinfoID(item!), null)),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 10, 59, 27),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: AlignmentDirectional(0, 0),
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ));
                            } else {
                              // Return a container with a button inside
                              var item = newList[index];

                              return GestureDetector(
                                  onTap: () {
                                    print('IconButton pressed ...');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlantInfoWidget(
                                              idlist[index], null)),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 18, 75, 29),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: AlignmentDirectional(0, 0),
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ));
                            }
                          },
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
