import 'package:cgg/app/ui/global_controllers/sesion_controller.dart';
import 'package:cgg/app/ui/global_widgets/custom_button.dart';
import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:cgg/app/ui/pages/login/login_page.dart';
import 'package:cgg/app/ui/pages/register/controller/register_controller.dart';
import 'package:cgg/app/ui/pages/register/controller/register_state.dart';
import 'package:cgg/app/ui/pages/register/utils/send_register_form.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:cgg/app/utils/name_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
       child: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
         child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Boton back retorna a la panatalla de inicio
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color:Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10),

                  ),
                 child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: ()=>Navigator.pop(context,false)),
                ),
                // Texto de bienvenida 
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("¡Hola!Regístrate para comenzar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )),
                ),
                // Cajas de texto
                CustomInutField(
                      icon: Icon(Icons.person),
                      label: "Nombre:",
                      onChanged: controller.onNameChange,
                      validator: (text){
                        return isValidName(text!)?null:"El nombre es alfanúmerico";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInutField(
                      icon: Icon(Icons.person_add_alt_1),
                      label: "Apellido:",
                      onChanged: controller.onlastNameChange,
                       validator: (text){
                        return isValidName(text!)?null:"El apellido es alfanúmerico";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInutField(
                      icon: const Icon(Icons.email_outlined),
                      label: "Correo electrónico:",
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.onEmailChange,
                      validator: (text){
                        return isValidEmail(text!)?null:"Correo electrónico no existe";
                      },
                    ),
                     const SizedBox(height: 15),
                    CustomInutField(
                      icon: const Icon(Icons.password_outlined),
                      label: "Contraseña",
                      onChanged: controller.onPasswordChange,
                      isPassword: true,
                      validator: (text){
                        if(text!.trim().length>=6){
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
                      icon: const Icon(Icons.password_outlined),
                      label: "Verificación de contraseña",
                      onChanged: controller.onVPasswordChange,
                      isPassword: true,
                       validator: (text){
                        if(controller.state.password!=text){
                          return "Las contraseñas no son iguales";
                        }
                        if(text!.trim().length>=6){
                          return null;
                        }
                        return "Contraseña invalida";
                      },
                    );
                      },
                    ),
                    const SizedBox(height: 30),
                //Boton de inicio de sesión
                CustomizedButton(
                  buttonText: "Crear cuenta",
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: ()=> sendRegisterForm(context),
                ),
              ],
            ),
          ),
        ),
       )
      ),
    );
      },
    );
  }
}