import 'package:cgg/app/ui/pages/login/login_page.dart';
import 'package:cgg/app/ui/pages/splash/splash_page.dart';
import 'routes.dart';
import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;

Map<String, Widget Function(BuildContext)> get appRoutes =>{
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.LOGIN:(_) => const LoginPage(),
    Routes.HOME:(_) => Container(),
};