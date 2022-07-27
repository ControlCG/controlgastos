import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => router.pushNamed(Routes.REGISTER
              ), 
              child: const Text("Registrar"),
            )
          ],
        ),
      )
      ),
    );
  }
}