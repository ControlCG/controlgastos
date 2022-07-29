import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:cgg/app/ui/pages/register/controller/register_controller.dart';
import 'package:cgg/app/ui/pages/register/controller/register_state.dart';
import 'package:cgg/app/ui/pages/register/utils/send_register_form.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:cgg/app/utils/name_validator.dart';
import 'package:flutter/cupertino.dart';
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
          height: double.infinity,
          color: Colors.transparent,
          child:Form(
            key: controller.formKey,
            //Diseño de cajas de texto
            child: ListView(
              padding:const EdgeInsets.all(15),
              children: [
                const SizedBox(height: 30.0,),
                const Text("Registro de Usuarios",textAlign: TextAlign.center,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0,
                  )),
                const SizedBox(height: 10.0,),
                Image.asset("assets/images/crecimiento.png",
                height: 110.0,
                width:110.0
                ),
                const SizedBox(height: 10.0,),
                const Text(
                  "Control de gastos",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    fontSize: 25.0
                  ),
                ),
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
                CupertinoButton(
                  child:const Text("Registrar"),
                  color: Colors.blue, 
                  borderRadius: BorderRadius.circular(30.0),
                  onPressed:() =>sendRegisterForm(context),
               ),
              ],
              ),
         ),
        ),
      ),
    );
      },
    );
  }
}