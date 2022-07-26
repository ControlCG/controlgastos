
import 'package:cgg/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:cgg/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:cgg/app/domain/inputs/sign_up.dart';
import 'package:cgg/app/domain/repositories/authentication_repository.dart';
import 'package:cgg/app/domain/repositories/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';


void injectDependencies(){
  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),  
    ),
  );
  Get.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
}