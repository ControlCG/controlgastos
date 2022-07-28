import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("HOME PAGE"),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Sign out"), 
              onPressed:()async{
               await Get.find<AuthenticationRepository>().signOut();
               router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}