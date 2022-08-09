import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

import '../login_page.dart' show loginProvider;
import 'package:flutter/material.dart';

Future<void> sendLoginForm(BuildContext context)async{
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if(isValidForm){
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if(response.error != null){
      String errorMessage = "";

      switch(response.error){
        
        case SignInError.networkRequestFailed:
         errorMessage = "Solicitud de red fallida";
          break;
        case SignInError.userDisabled:
          errorMessage = "Usuario deshabilitado";
          break;
        case SignInError.userNotFound:
          errorMessage = "Usuario no encontrado";
          break;
        case SignInError.wrongPassword:
         errorMessage = "Contraseña incorrecta";
          break;
        case SignInError.tooManyRequests:
         errorMessage = "Demasiadas solicitudes";
          break;
        case SignInError.unknow:
        default:
         errorMessage = "Error desconocido";
          break;
      }

      Dialogs.alert(
        context,
        title: "Ups...",
        content: errorMessage,
      );
    }else{
      router.pushReplacementNamed(
        Routes.HOME,
      );
    }
  }
}