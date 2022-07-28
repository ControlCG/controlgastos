import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:cgg/app/ui/pages/register/controller/register_controller.dart';
import 'package:cgg/app/ui/pages/register/controller/register_state.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:cgg/app/utils/name_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  //Diseño de la pantalla registro
  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_,controller){
        return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Container(
          width:double.infinity,
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: Column(
            children: [
              CustomInutField(
                label: "Nombre:",
                onChanged: controller.onNameChange,
                validator: (text){
                  if(text == null) return null;

                  return isValidName(text)?null:"El nombre es alfanúmerico";
                },
              ),
              const SizedBox(height: 15),
              CustomInutField(
                label: "Apellido:",
                onChanged: controller.onlastNameChange,
                 validator: (text){
                  if(text == null) return null;

                  return isValidName(text)?null:"El apellido es alfanúmerico";
                },
              ),
              const SizedBox(height: 15),
              CustomInutField(
                label: "Correo electrónico:",
                inputType: TextInputType.emailAddress,
                onChanged: controller.onEmailChange,
                validator: (text){
                  if(text == null) return null;
                  return isValidEmail(text)?null:"Correo electrónico no existe";
                },
              ),
               const SizedBox(height: 15),
              CustomInutField(
                label: "Password",
                onChanged: controller.onPasswordChange,
                isPassword: true,
                validator: (text){
                  if(text == null) return null;
                  if(text.trim().length>=6){
                    return null;
                  }
                  return "Contraseña invalida";
                },
              ),
              const SizedBox(height: 15),
              Consumer(
                builder: (_, watch, __){
                  (registerProvider.select(
                    (_) => _.password,
                    )
                  );
                  return CustomInutField(
                label: "Verification Password",
                onChanged: controller.onVPasswordChange,
                isPassword: true,
                 validator: (text){
                  if(text == null) return null;
                  if(controller.state.password!=text){
                    return "Las contraseñas no son iguales";
                  }
                  if(text.trim().length>=6){
                    return null;
                  }
                  return "Contraseña invalida";
                },
              );
                }
              )
            ],
          ),
        ),
      ),
    );
      },
    );
  }
}