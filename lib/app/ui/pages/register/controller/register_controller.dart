import 'package:cgg/app/ui/pages/register/controller/register_state.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState>{
  RegisterController():super(RegisterState.initialState);


  submit(){
    
  }

  void onNameChange(String text){
    state = state.copyWith(name: text);
  }
  void onlastNameChange(String text){
    state = state.copyWith(lastname: text);
  }
  void onEmailChange(String text){
    state = state.copyWith(email: text);
  }
  void onPasswordChange(String text){
    state = state.copyWith(password: text);
  }
  void onVPasswordChange(String text){
    state = state.copyWith(vPassword: text);
  }
}