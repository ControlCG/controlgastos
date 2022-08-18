import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/ui/pages/home/daily_page.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _nameState();
}

class _nameState extends State<CreatePage> {
  List categories = [
    "assets/images/addu.png",
    "assets/images/addm.png",
  ];
  List textoc = [
    "Crear usuario",
    "Añadir sueldo",
  ];
  
  int activeCategory = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBody(),
    );
  }
getBody(){
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3
            )],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60,right:20,left: 20,bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Añadir actividad",style: TextStyle(
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
            ),
          ),
        ),
        const SizedBox(height: 30,),
         const Padding(
           padding: EdgeInsets.only(left: 20,right: 20),
           child: Text(
            "¿Qué desea realizar?",
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 145, 143, 143),
        ),),
         ),
         const SizedBox(height: 20,),
         //Boton de añadir nuevo usuario
         Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child:Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                InkWell(
                onTap: ()=>
                router.pushNamed(Routes.CREATEU
                ),
                  child: SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset("assets/images/addu.png", width: 70.0,),
                              const SizedBox(height: 25.0),
                              const Text("Crear usuario",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              )),
                              
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              InkWell(
                onTap: (){},
                child: SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset("assets/images/addm.png", width: 70.0,),
                              const SizedBox(height: 25.0),
                              const Text("Asignar sueldo",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              )),
                              
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
              )
              ],
            )
          ),
         ),
      ],
    ),
  );
}
  setTabs(index){
    setState(() {
      activeCategory = index;
    });
  }
}
