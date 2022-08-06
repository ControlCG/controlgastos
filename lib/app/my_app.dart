

import 'package:cgg/app/ui/routes/app_routes.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WELCOME,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}