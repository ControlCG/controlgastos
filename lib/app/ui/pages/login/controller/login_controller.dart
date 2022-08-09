import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier{
  String _email = '',_password = '';
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  final GlobalKey<FormState>  formKey = GlobalKey();

  void onEmailChange(String text){
    _email = text;
  }

  void onPasswordChange(String text){
    _password = text;
  }

  Future<SignInResponse> submit(){
    return _authenticationRepository.signInWithEmailAndPassword(
      _email, 
      _password,
    );
  }
}