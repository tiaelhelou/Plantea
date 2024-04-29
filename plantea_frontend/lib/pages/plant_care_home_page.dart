import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../pages/plant_care_home_page.dart';
import '../pages/welcome_page.dart';

import '../models/plantcare_model.dart';
export '../models/plantcare_model.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
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
                Padding( //////drop down  in flutter
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
                          searchController: textEditingController,
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
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },
                        
                      ),
                      
                    ),
                      /*DropdownMenu<String>(
                        
                       // initialSelection: list.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),*/
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
  /*ListView.builder(
        itemCount: 10, // Number of containers you want to display
        itemBuilder: (context, index) {
          return Container(
            height: 100, // Height of each container
            margin: EdgeInsets.all(8), // Margin around each container
            decoration: BoxDecoration(
              color: Colors.blue, // Color of the container
              borderRadius: BorderRadius.circular(10), // Border radius of the container
            ),
            child: Center(
              child: Text(
                'Container ${index + 1}', // Text inside the container
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20, // Text size
                ),
              ),
            ),
          );
        },
      ),*/ListView.builder(
  padding: EdgeInsets.zero,
  scrollDirection: Axis.vertical,
  itemCount: 4, // Define the number of items in your list
  itemBuilder: (context, index) {
    return Padding(
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
