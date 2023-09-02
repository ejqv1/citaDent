import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/webs/nav_bar_web/nav_bar_web_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CitasTerminadasModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navBarWeb component.
  late NavBarWebModel navBarWebModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarWebModel = createModel(context, () => NavBarWebModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
