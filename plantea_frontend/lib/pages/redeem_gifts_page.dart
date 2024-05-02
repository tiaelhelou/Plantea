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
        ),
      ),
    );
  }
}
