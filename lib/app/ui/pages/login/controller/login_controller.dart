import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:cgg/app/ui/global_controllers/sesion_controller.dart';
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier{
  final SessionController _sessionController;

  String _email = '',_password = '';
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  final GlobalKey<FormState>  formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChange(String text){
    _email = text;
  }

  void onPasswordChange(String text){
    _password = text;
  }

  Future<SignInResponse> signInWithEmailAndPassword() async{
    final response = await _authenticationRepository.signInWithEmailAndPassword(
      _email, 
      _password,
    );

    if(response.error==null){
      _sessionController.setUser(response.user!);
    }

    return response;
  }

  Future<SignInResponse> signInWithGoogle() async{
   final response = await _authenticationRepository.signInWithGoogle();
   if(response.error == null){
    _sessionController.setUser(response.user!);
   }
   return response;
  }
}