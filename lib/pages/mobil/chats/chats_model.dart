import '/backend/backend.dart';
import '../../../flutter/flutter_flow_util.dart';
import '/pages/mobil/nav_bar/nav_bar_widget.dart';
import 'package:flutter/material.dart';

class ChatsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? nuevoChat;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
