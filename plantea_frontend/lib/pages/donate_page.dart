import 'package:flutter/material.dart';

class DonateWidget extends StatefulWidget {
  const DonateWidget({super.key});

  @override
  State<DonateWidget> createState() => _DonateWidgetState();
}

class _DonateWidgetState extends State<DonateWidget> {

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonateModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();
  }
  
   @override
  Widget build(BuildContext context) {
  }
}