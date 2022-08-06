import 'package:cgg/app/ui/pages/welcome/widgets/app_large_text.dart';
import 'package:cgg/app/ui/pages/welcome/widgets/app_text.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _nameState();
}

class _nameState extends State<WelcomePage> {
  List images = [
    "buy.png",
    "gastocal.png",
    "controlap.png",
  ];
   List text = [
    "Bienvenido",
    "Controla",
    "Mejora",
  ];
   List textc = [
    "Control de gastos.",
    "tus ingresos y egresos.",
    "tu rendimiento."
  ];
  List textz = [
    "CG te apoya otorgándote el recurso que necesitas para facilitar tu administración durante un periodo de hasta 30 días.",
    "Finanzas personales en modo fácil. Así podras definir brevemente la estabilidad de tu dinero en la app CG.Te ayudará a compartimentar tus gastos y a controlar tu dinero. ",
    "Saca el máximo rendimiento a tu presupuesto doméstico o personal. Durante la vida laboral de tu negocio."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage(
                "assets/images/"+images[index]
              ),
              alignment: Alignment.bottomCenter
            )
          ),
               child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: text[index]),
                    AppText(text: textc[index],size: 25,),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: AppText(
                        text:textz[index], 
                        color:Color.fromARGB(195, 187, 180, 180),
                        size: 14,
                        ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:Size(120, 40), 
                        primary: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Text("Iniciar >>"),
                      onPressed: () =>router.pushNamed(
                        Routes.LOGIN
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index==indexDots?Color.fromARGB(218, 73, 146, 241):Color.fromARGB(218, 175, 172, 170)
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}