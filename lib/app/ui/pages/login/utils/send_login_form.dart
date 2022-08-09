import 'package:cgg/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:cgg/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:flutter_meedu/ui.dart';

import '../login_page.dart' show loginProvider;
import 'package:flutter/material.dart';

Future<void> sendLoginForm(BuildContext context)async{
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if(isValidForm){
    ProgressDialog.show(context);
    final response = await controller.signInWithEmailAndPassword();
    router.pop();
    handleLoginResponse(context, response);
  }
}