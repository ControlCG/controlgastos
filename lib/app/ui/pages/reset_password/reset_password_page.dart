import 'package:cgg/app/domain/responses/reset_password_response.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:cgg/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_input_field.dart';
import 'controller/reset_password_controller.dart';

final resetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ProviderListener<ResetPasswordController>(
    provider: resetPasswordProvider,
    builder: (_,controller)=>Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        child: GestureDetector(
          onTap: ()=>Focus.of(context).unfocus(),
          child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          color: Colors.transparent,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomInutField(
                label: "Correo electrónico:",
                onChanged:controller.onEmailChange,
                icon: const Icon(Icons.email_outlined),
                inputType: TextInputType.emailAddress, 
              ),
                 //Boton de inicio de sesión
                CustomizedButton(
                  buttonText: "Envíar",
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: ()=> _submit(context),
                ),
            ],
           ),
          ),
        )
      ),
    ),
  );
  }

void _submit(BuildContext context) async{
    final controller = resetPasswordProvider.read;
    if(isValidEmail(controller.email)){
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if(response == ResetPasswordResponse.ok){
        Dialogs.alert(
          context,
          title: "¡Excelente!",
          content: "Correo enviado",
        );
      }else{
        String errorMessage = "";
        switch(response){

          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = "Error en la solicitud de red";
            break;
          case ResetPasswordResponse.userDisabled:
            errorMessage = "Usuario deshabilitado";
            break;
          case ResetPasswordResponse.userNotFound:
            errorMessage = "Usuario no encontrado";
            break;
          case ResetPasswordResponse.tooManyRequests:
            errorMessage = "Demasiadas solicitudes";
            break;
          case ResetPasswordResponse.unknow:
            default:
            errorMessage = "Error desconocido";
            break;
        }
        Dialogs.alert(
          context,
          title: "Error",
          content: errorMessage,
        );
      }
  }else{
    Dialogs.alert(context,content: "Correo invalido");
    }
  }
}