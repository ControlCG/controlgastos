



import 'package:cgg/app/domain/responses/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpResponse{
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);


}

parseStringToSignUpError(String text){
  switch(text){
    case "too-many-requests":
     return SignUpError.tooManyRequests;
    case "email-already-in-use":
     return SignUpError.emailAlreadyInUse;
    case "weak-password":
     return SignUpError.weakPassword;
    case "newtwork-request-failed":
      return SignInError.networkRequestFailed; 
    default:
     return SignUpError.unknow;
  }
}

enum SignUpError{
  emailAlreadyInUse,
  weakPassword,
  networkRequestFailed,
  tooManyRequests,
  unknow
}