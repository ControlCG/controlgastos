import 'dart:ffi';

import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/ui/global_controllers/sesion_controller.dart';
import 'package:cgg/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier{
  final SessionController _sessionController;
  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;
  String? get routName => _routeName;

  SplashController(this._sessionController){
    _init();
    
  }

 void _init() async{
  final user = await _authRepository.user;
  if(user!=null){
    _routeName=Routes.HOME;
    _sessionController.setUser(user);
  }else{
    _routeName = Routes.LOGIN;
  }
  _routeName = user != null?Routes.HOME:Routes.LOGIN;
  notify();
 }
}