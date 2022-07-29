import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:cgg/app/ui/pages/login/utils/send_login_form.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:cgg/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_meedu/meedu.dart';
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
      body: SafeArea(
       child: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
         child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()=> sendLoginForm(context),
                  child: const Text("Iniciar sesión"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => router.pushNamed(Routes.REGISTER
                  ), 
                  child: const Text("Registrar"),
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