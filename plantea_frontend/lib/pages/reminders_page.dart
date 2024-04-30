import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/pages/image_display.dart';
import 'package:plantea/pages/plant_care_home_page.dart';

import '../models/reminders_model.dart';
export '../models/reminders_model.dart';

const List<String> list = <String>['water', 'sunlight', 'Three', 'Four'];

class RemindersWidget extends StatefulWidget {
  const RemindersWidget({super.key});

  @override
  State<RemindersWidget> createState() => _RemindersWidgetState();
}

class _RemindersWidgetState extends State<RemindersWidget> {
  late RemindersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemindersModel());
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
              fit: BoxFit.contain,
              alignment: AlignmentDirectional(0, -1),
              image: Image.network(
                'https://images.unsplash.com/photo-1495908333425-29a1e0918c5f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxncm93aW5nJTIwZmxvd2VyfGVufDB8fHx8MTcxNDQ1NjEyMXww&ixlib=rb-4.0.3&q=80&w=1080',
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Container(
                    width: 311,
                    height: 250,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0xFF8A9A5B),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFFF3F3F3), Color(0xFF355E3B)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, 1),
                        end: AlignmentDirectional(0, -1),
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Reminders',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          width: 296,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Color(0xFFBDC9A0),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                // addd drop down of 3 types of reminder
                                /**
                                 * Padding(
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
                                 */
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 10, 5),
                                child: Text(
                                  ' ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 5, 10, 5),
                                child: FlutterFlowIconButton(
                                  borderRadius: 5,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor: Color(0xFF8A9A5B),
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 12,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 296,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Color(0xFFBDC9A0),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 10, 5),
                                child: Text(
                                  ' ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 5, 10, 5),
                                child: FlutterFlowIconButton(
                                  borderRadius: 5,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor: Color(0xFF8A9A5B),
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 12,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 296,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Color(0xFFBDC9A0),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 10, 5),
                                child: Text(
                                  ' ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 5, 10, 5),
                                child: FlutterFlowIconButton(
                                  borderRadius: 5,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor: Color(0xFF8A9A5B),
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 12,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 10)),
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
