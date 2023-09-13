import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/auth/user_model.dart';
import 'package:bloomi_web/screens/Admin/adminui.dart';
import 'package:bloomi_web/screens/Counsellor/navbar.dart';
import 'package:bloomi_web/screens/auth/signup/signup_form.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  //-----------------------To initialize user---------------------
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //----------if user is not logged in, navigate to signup page----------
        Logger().i('User is currently signed out!');
        UtilFunction.navigateForward(context, const SignUp());
      } else {
        //----------if user is logged in, navigate to login page---------------
        Logger().i('User is signed in!');

        if (user.uid == "3MMoGgwJLVUjpTkJ7f4Zd8FqqyJ2") {
          await startFetchUserData(user.uid).then((value) {
            UtilFunction.navigateForward(context, const Adminpanel());
          });
        } else if (user.uid == "Tm3SJ2JpSORKzZrFiumARyE4l7f1") {
          await startFetchUserData(user.uid).then((value) {
            UtilFunction.navigateForward(context, const CounselorHome());
          });
        } else {
          await startFetchUserData(user.uid).then((value) {
            UtilFunction.navigateForward(context, const Home());
          });
        }
      }
    });
  }

  //-----------------------To fetch user data---------------------
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  //-----------------------To fetch user data---------------------
  Future<void> startFetchUserData(String uid) async {
    try {
      AuthController().fetchUserData(uid).then((value) {
        if (value != null) {
          _userModel = value;
          notifyListeners();
        } else {
          Logger().i("User not found");
        }
      });
    } catch (e) {
      Logger().e(e);
    }
  }
}
