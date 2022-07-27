

import 'package:cgg/app/ui/global_widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  //Diseño de la pantalla registro
  @override
  Widget build(BuildContext context) {
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
                label: "Name",
                onChanged: (text){
                },
              ),
              const SizedBox(height: 15),
              CustomInutField(
                label: "Last Name",
                onChanged: (text){
                },
              ),
              const SizedBox(height: 15),
              CustomInutField(
                label: "E-mail",
                inputType: TextInputType.emailAddress,
                onChanged: (text){},
                validator: (text){
                  if(text == null) return null;
                  if(text.contains("@")){
                    return null;
                  }
                  return "Correo invalido";
                },
              ),
               const SizedBox(height: 15),
              CustomInutField(
                label: "Password",
                onChanged: (text){},
                isPassword: true,
              ),
               const SizedBox(height: 15),
              CustomInutField(
                label: "Verification Password",
                onChanged: (text){},
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}