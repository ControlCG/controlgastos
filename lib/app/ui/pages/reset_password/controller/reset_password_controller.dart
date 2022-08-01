

import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/domain/responses/reset_password_response.dart';
import 'package:flutter_meedu/meedu.dart';

class ResetPasswordController extends SimpleNotifier{
  String _email = '';
  String get email => _email;

  final _authenticationRepository = Get.find<AuthenticationRepository>();

  void onEmailChange(String text){
    _email = text;
  }

  Future<ResetPasswordResponse> submit(){
    return _authenticationRepository.sendResetPasswordLink(email);
  }
}