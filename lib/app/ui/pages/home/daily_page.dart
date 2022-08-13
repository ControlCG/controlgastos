import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _nameState();
}

class _nameState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.withOpacity(0.05),
      body: getBody(),
    );
  }
  getBody(){
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3
                )
              ]
            ) ,
            child: Padding(
              padding: const EdgeInsets.only(top: 60,bottom: 25,right: 20,left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Transacciones diarias",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                      IconButton(
                        onPressed:()async{
                        await Get.find<AuthenticationRepository>().signOut();
                        router.pushNamedAndRemoveUntil(Routes.LOGIN);
                        }, 
                        icon: const Icon(Icons.logout_outlined),color: Colors.blue,iconSize:33,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}