import 'dart:async';

import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/domain/responses/reset_password_response.dart';
import 'package:cgg/app/domain/responses/sign_in_response.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  }): _auth = firebaseAuth, 
      _googleSignIn = googleSignIn{
    _init();
  }

  @override
  Future<User?> get user async{
    await _completer.future;
    return _user;
  }


 void _init() async{
 _auth.authStateChanges().listen(
        (User? user) {
          if(!_completer.isCompleted){
            _completer.complete();
          }
          _user = user;
        },
      );
  }
  
  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
  
  @override
  Future<SignInResponse> signInWithEmailAndPassword(String email, String password) async {
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      final user = userCredential.user!;
      return SignInResponse(null, user);
    }on FirebaseAuthException catch (e){
      print(e.code);
      return SignInResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }
  
  @override
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return ResetPasswordResponse.ok;
    }on FirebaseAuthException catch (e){
      return stringToResetPasswordRespone(e.code);
    }
  }
}