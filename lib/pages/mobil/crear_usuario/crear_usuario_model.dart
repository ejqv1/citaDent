import '../../../flutter/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CrearUsuarioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for apellido widget.
  TextEditingController? apellidoController;
  String? Function(BuildContext, String?)? apellidoControllerValidator;
  // State field(s) for celular widget.
  TextEditingController? celularController;
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for edad widget.
  TextEditingController? edadController;
  String? Function(BuildContext, String?)? edadControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordVerifique widget.
  TextEditingController? passwordVerifiqueController;
  late bool passwordVerifiqueVisibility;
  String? Function(BuildContext, String?)? passwordVerifiqueControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordVerifiqueVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nombreController?.dispose();
    apellidoController?.dispose();
    celularController?.dispose();
    edadController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    passwordVerifiqueController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
