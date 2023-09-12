import 'package:bloomi_web/screens/Admin/adminui.dart';
import 'package:bloomi_web/screens/auth/signup/signup_form.dart';
import 'package:bloomi_web/screens/home/Appointment/dashboard.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
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
        if (user.uid == "3MMoGgwJLVUjpTkJ7f4Zd8FqqyJ2") {
          UtilFunction.navigateForward(context, const Adminpanel());
        } else if (user.uid == "Tm3SJ2JpSORKzZrFiumARyE4l7f1") {
          UtilFunction.navigateForward(context, const Dashboard());
        } else {
          UtilFunction.navigateForward(context, const Home());
        }
      }
    });
  }

  //-----------------------To SignUp user---------------------
  static Future<void> signUpUser(String email, String password) async {
    try {
      //create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To SignUp user---------------------
  static Future<void> signOutUser() async {
    try {
      //sign out user
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
    } catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To SignIn user---------------------
  static Future<void> signInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
    }
  }

  //-----------------------To Reset Password---------------------
  static Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Logger().e(e);
    }
  }
}
