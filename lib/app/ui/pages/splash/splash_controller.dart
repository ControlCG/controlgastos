import 'dart:ffi';

import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier{
  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;
  String? get routName => _routeName;

  SplashController(){
    _init();
  }

 void _init() async{
  final user = await _authRepository.user;
  _routeName = user != null?Routes.HOME:Routes.LOGIN;
  notify();
 }
}