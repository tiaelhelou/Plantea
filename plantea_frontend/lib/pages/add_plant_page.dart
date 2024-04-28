import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:plantea/pages/plant_care_home_page.dart';

import '../models/add_plant_model.dart';
export '../models/add_plant_model.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four']; // list of plants
class AddPlantWidget extends StatefulWidget {
  const AddPlantWidget({super.key});
  

  @override
  State<AddPlantWidget> createState() => _AddPlantWidgetState();
}

class _AddPlantWidgetState extends State<AddPlantWidget> {

  
  late AddPlantModel _model;
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
 // String dropdownValue = list.first;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPlantModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }
  
  String ?selectedValue ;
final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  bool isDropdownValueSelected() {
  return selectedValue != null;
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
            child: 
            Form(
              key: _formKey,
                    
            child: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
              
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: 
                      EdgeInsetsDirectional.fromSTEB(0, 0, 200, 10),
                      child:Text(
                        'PLANT NAME',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 50, 0),
                              child: TextFormField(
                                controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFA8ABAC),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),


                                    ),
                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },

                                
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0xFF355E3B),
                              borderRadius: 5,
                              borderWidth: 1,
                              buttonSize: 47,
                              icon: Icon(
                                Icons.camera_alt,
                                color: Color(0xFF8A9A5B),
                                size: 24,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 225, 10),
                    child: Text(
                      'SPECIES',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                      child: FFButtonWidget(
                                  onPressed: () { /// check if both field are filled and adds  default image if non selected
                                  if (_formKey.currentState != null && _formKey.currentState!.validate()&&  isDropdownValueSelected()==true) {
                                                              // Navigate the user to the Home page
                                       Navigator.push(
                                        context,
                                         MaterialPageRoute(builder: (context) => const PlantcareWidget()),
                                        );
                                  } else {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                         const SnackBar(content: Text('Please Fill All Input')),
                                         );
                                  }
                                  
                                },
                                  text: 'ADD',
                                  options: FFButtonOptions(
                                    width: 296,
                                    height: 54,
                                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: Color(0xFF355E3B),
                                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
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
                  ],
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }
}
