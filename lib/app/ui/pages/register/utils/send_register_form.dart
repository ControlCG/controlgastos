import 'package:cgg/app/domain/inputs/sign_up.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

import '../register_page.dart' show registerProvider;
import 'package:flutter/material.dart';

Future<void> sendRegisterForm(BuildContext context) async{
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if(isValidForm){
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
   
    if(response.error != null){
      late String content;
      switch(response.error){
        
        case SignUpError.emailAlreadyInUse:
            content = "email already in use";
          break;
        case SignUpError.weakPassword:
            content = "weak Password";
          break;
        case SignUpError.unknow:
        default: 
             content = "unknow error";
          break;
      }
      Dialogs.alert(
        context,
        title: "ERROR",
        content: content,
        );
    }else{
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
  }else{
    Dialogs.alert(
      context,
      title: "ERROR",
      content: "Invalid fields"
    );
  }
}