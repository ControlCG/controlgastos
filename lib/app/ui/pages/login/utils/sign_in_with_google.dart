

import 'package:cgg/app/ui/pages/login/login_page.dart';
import 'package:cgg/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:flutter/material.dart';
import '../../../global_widgets/dialogs/progress_dialog.dart';

void signInWithGoogle(BuildContext context) async{
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithGoogle();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}