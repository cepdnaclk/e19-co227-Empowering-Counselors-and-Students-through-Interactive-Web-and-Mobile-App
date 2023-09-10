import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/screens/auth/signup/signup_form.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthController {
  //-----------------------To initialize user---------------------
  static Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //----------if user is not logged in, navigate to signup page----------
        Logger().i('User is currently signed out!');
        UtilFunction.navigateForward(context, const SignUp());
      } else {
        //----------if user is logged in, navigate to login page---------------
        Logger().i('User is signed in!');
        UtilFunction.navigateForward(context, const Login());
      }
    });
  }
}
