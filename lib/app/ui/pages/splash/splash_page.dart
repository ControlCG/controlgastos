import 'package:cgg/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';


final splashProvider = SimpleProvider(
  (_)=>SplashController(),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_,controller){
        final routName = controller.routName;
        if(routName!=null){
          router.pushReplacementNamed(routName);
        }
      }, 
      builder: (_, __){
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}