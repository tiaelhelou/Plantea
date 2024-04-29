import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/add_plant_page.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plantcare_model.dart';
export '../models/plantcare_model.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

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
  const PlantcareWidget({super.key});

  @override
  State<PlantcareWidget> createState() => _PlantcareCopyWidgetState();
}

class _PlantcareCopyWidgetState extends State<PlantcareWidget> {
  late PlantcareModel _model;
  TextEditingController nameController = TextEditingController();
  
  

  final scaffoldKey = GlobalKey<ScaffoldState>();
    String ?selectedValue ;
final TextEditingController textEditingController = TextEditingController();
/// the list should be displayed in the listview and search bar


/// FECTH DATA FROM DB 
// Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse('http://your_backend_server_url/data'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
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
    List<Container> containerList = [];

containerList.add(Container(
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
));

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
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                    child: SizedBox(
  width: 80, // Add the desired width here
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
        MaterialPageRoute(builder: (context) => AddPlantWidget()),
      );
    },
  ),
),

                  ),
                ),
                Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
      items: list.map((item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      )).toList(),
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
                // Generated code for this Container Widget...
Container(
  width: 340,
  height: 644,
  decoration: BoxDecoration(
    color: FlutterFlowTheme.of(context).secondaryBackground,
  ),
  child: 
//FECTHED DATA WILL BE STORED IN A LIST 
// ListView.builder(
//         itemCount: _data.length,
//         itemBuilder: (context, index) {
//           final item = _data[index];
//           return ListTile(
//             title: Text(item['title']),
//             subtitle: Text(item['description']),
    //                 Padding( // list of container
    //   padding: const EdgeInsets.symmetric(vertical: 10), // Add vertical padding
    //   child: Container(
    //     width: 296,
    //     height: 150,
    //     constraints: BoxConstraints(
    //       minWidth: 296,
    //       minHeight: 180,
    //       maxWidth: 296,
    //       maxHeight: 180,
    //     ),
    //     decoration: BoxDecoration(
    //       color: FlutterFlowTheme.of(context).secondaryBackground,
    //       image: DecorationImage(
    //         fit: BoxFit.cover,
    //         alignment: AlignmentDirectional(0, 0),
    //         image: Image.network(
    //           'https://images.unsplash.com/photo-1495231916356-a86217efff12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zmxvd2VyfGVufDB8fHx8MTcxNDE0NjE1M3ww&ixlib=rb-4.0.3&q=80&w=400',
    //         ).image,
    //       ),
    //       borderRadius: BorderRadius.circular(23),
    //     ),
    //     child: Align(
    //       alignment: AlignmentDirectional(1, 1),
    //       child: Padding(
    //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
    //         child: FlutterFlowIconButton(
    //           borderRadius: 5,
    //           borderWidth: 1,
    //           buttonSize: 40,
    //           fillColor: Color(0xFFFAF49D),
    //           icon: Icon(
    //             Icons.add_rounded,
    //             color: Color(0xFF355E3B),
    //             size: 24,
    //           ),
    //           onPressed: () {
    //             print('IconButton pressed ...');
    //           },
    //         ),
    //       ),
    //     ),
    //   ),
    // );
//           );
//         },
//       ),
 ListView.builder(
  padding: EdgeInsets.zero,
  scrollDirection: Axis.vertical,
  itemCount: 4, // Define the number of items in your list
  itemBuilder: (context, index) {
    return Padding( // list of container
      padding: const EdgeInsets.symmetric(vertical: 10), // Add vertical padding
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
    );
  },
)


)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
