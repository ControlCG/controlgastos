import 'package:cgg/app/ui/global_widgets/custom_button.dart';
import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:cgg/app/ui/pages/login/utils/send_login_form.dart';
import 'package:cgg/app/ui/pages/register/register_page.dart';
import 'package:cgg/app/ui/pages/register/utils/send_register_form.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'controller/login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
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
                    onPressed: (){},),
                ),
                // Texto de bienvenida 
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("¡Bienvenido!\n¡Me alegra verte de nuevo!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )),
                ),
                // Cajas de texto
                CustomInutField(
                  label: "Correo electrónico:",
                  icon: const Icon(Icons.email_outlined),
                  onChanged: controller.onEmailChange,
                  inputType: TextInputType.emailAddress,
                  validator: (text){
                    if(isValidEmail(text!)){
                      return null;
                    }
                    return "Correo no valido";
                  },
                ),
                const SizedBox(height: 20),
                CustomInutField(
                  label: "Contraseña:",
                  icon: const Icon(Icons.password_outlined),
                  onChanged: controller.onPasswordChange,
                  isPassword: true,
                  validator: (text){
                    if(text!.trim().length>=6){
                      return null;
                    }
                    return "Contraseña no valida";
                  },
                  ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                          onPressed:() =>router.pushNamed(Routes.RESET_PASSWORD),
                          child: const Text("Restablecer contraseña?",
                          style: TextStyle(
                            color: Color.fromARGB(211, 189, 185, 185),
                            fontSize: 15,
                          ),),
                        ),
                  ),
                ),
                //Boton de inicio de sesión
                CustomizedButton(
                  buttonText: "Iniciar sesión",
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: ()=> sendLoginForm(context),
                ),
                // Inicio de sesión con Google
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height*0.15,
                        color: Colors.grey,
                    ),
                    const Text("O inicia sesión con"),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height*0.15,
                        color: Colors.grey,
                    ),
                  ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon:const Icon(
                        FontAwesomeIcons.google,
                        color:Colors.blue,
                      ),
                      onPressed: (){},
                    ),
                  )
                ]),
                const SizedBox(height:140),
                Padding(
                  padding: const EdgeInsets.fromLTRB(58,8,8,8.0),
                  child: Row(
                    
                    children: [
                      const Text("No tienes una cuenta?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 46, 46),
                        fontSize: 15,
                      ),),
                      TextButton(
                        onPressed: ()=>router.pushNamed(
                          Routes.REGISTER
                        ),
                        child: const Text("   Crea una",
                        style:  TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                        ),
                      )
                    ],
                  ),
                )
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