import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../routes/routes.dart';

void handleLoginResponse(BuildContext context,SignInResponse response){
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
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = response.providerId?? "Método de autenticación no válido";
          break; 
        case SignInError.invalidCredential:
          errorMessage =  "Error de credencial";
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