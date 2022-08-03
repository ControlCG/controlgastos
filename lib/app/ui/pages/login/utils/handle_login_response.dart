import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';


void handleLoginResponse(BuildContext context,SignInResponse response){

    if(response.error!=null){
      String errorMessage = "";

      if(response.error == SignInError.cancelled){
        switch(response.error){

      case SignInError.networkRequestFailed:
        errorMessage = "Red fallida";
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
        errorMessage = "Demasidas solicitudes";
        break;
      case SignInError.invalidCredential:
        errorMessage = "Credencial invalida";
        break;

      case SignInError.accountExistsWithDifferentCredential:
      errorMessage = response.providerId??"Método de autenticación no válido";
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
      }
    }else{
      router.pushReplacementNamed(
        Routes.HOME,
      );
    }
}