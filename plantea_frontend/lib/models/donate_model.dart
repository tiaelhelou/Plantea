import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../pages/donate_page.dart';

class DonateModel extends FlutterFlowModel<DonateWidget> {
  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();
  }

  @override
  void initState(BuildContext context) {}

}
