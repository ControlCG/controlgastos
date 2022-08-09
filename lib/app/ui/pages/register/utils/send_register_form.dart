import 'package:cgg/app/domain/inputs/sign_up.dart';
import 'package:cgg/app/domain/responses/sign_up_response.dart';
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
            content = "Correo ya en uso";
          break;
        case SignUpError.weakPassword:
            content = "Contraseña débil";
          break;

        case SignUpError.networkRequestFailed:
            content = "Error en la solicitud de red";
          break;
        case SignUpError.tooManyRequests:
            content = "Demasiadas solicitudes";
          break;
        case SignUpError.unknow:
        default: 
             content = "Error desconocido";
          break;
      }
      Dialogs.alert(
        context,
        title: "Ups...",
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
      title: "Ups..",
      content: "Campos invalidos"
    );
  }
}