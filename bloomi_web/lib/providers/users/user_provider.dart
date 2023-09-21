// ignore_for_file: use_build_context_synchronously

import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/admin_screens/home/adminui.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/screens/counsellor_screens/home/navbar.dart';
import 'package:bloomi_web/screens/home_screens/user_dashboard/home.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;
  //-----------------------To initialize user---------------------
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //----------if user is not logged in, navigate to signup page----------
        Logger().i('User is currently signed out!');
        UtilFunction.navigateForward(context, const Login());
      } else {
        //----------if user is logged in, navigate to login page---------------

        await startFetchUserData(user.uid).then((value) {
          try {
            Provider.of<UserAppoinmentProvider>(context, listen: false)
                .startFetchAllUserData();
          } catch (e) {
            Logger().e(e);
          }

          if (value!.userType == "Counselor") {
            Logger().e(value.userType);
            startFetchUserAdditionalData(user.uid).then((value) =>
                UtilFunction.navigateForward(context, const CounselorHome()));
          } else if (value.userType == "Admin") {
            UtilFunction.navigateForward(context, const Adminpanel());
          } else {
            startFetchUserAdditionalData(user.uid).then(
                (value) => UtilFunction.navigateForward(context, const Home()));
          }
        });
      }
    });
  }

  //-----------------------To fetch user data---------------------
  Future<UserModel?> startFetchUserData(String uid) async {
    try {
      UserModel? userModel = await AuthController().fetchUserData(uid);
      if (userModel != null) {
        _userModel = userModel;

        notifyListeners();
        return userModel;
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------To fetch user data---------------------

  ChatModel? _chatModel;

  ChatModel? get chatModel => _chatModel;
  Future<ChatModel?> startFetchUserAdditionalData(String uid) async {
    try {
      ChatModel? chatModel =
          await AuthController().fetchUserAdditionalData(uid);
      if (chatModel != null) {
        _chatModel = chatModel;
        notifyListeners();

        return chatModel;
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------To update current user online states---------------------
  void updateUserOnlineState(bool val) {
    Logger().e(val);
    try {
      AuthController().updateOnlineState(userModel!.uid, val);
    } catch (e) {
      Logger().e(e);
    }
  }
}
