// ignore_for_file: use_build_context_synchronously
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
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
        //----------if user is not logged in, navigate to login page----------
        Logger().i('User is currently signed out!');
        UtilFunction.navigateForward(context, const Login());
      } else {
        //----------if user is logged in, fetch user data and navigate to home page----------
        try {
          UserModel? userModel = await startFetchUserData(user.uid);

          CounsellorModel? counsellorModel =
              await Provider.of<CounsellorRegistrationProvider>(context,
                      listen: false)
                  .startFetchCounsellorData(user.uid);

          AdminModel? adminModel = await Provider.of<AdminRegistrationProvider>(
                  context,
                  listen: false)
              .startFetchAdminData(user.uid);

          if (userModel != null) {
            //----------to start fetching user additional data----------
            await startFetchUserAdditionalData(user.uid);
            UtilFunction.navigateForward(context, const Home());

            //----------if user is counsellor, navigate to counsellor home page----------
          } else if (counsellorModel != null) {
            //----------to start fetching user additional data----------
            await Provider.of<CounsellorRegistrationProvider>(context,
                    listen: false)
                .startFetchCounsellorAdditionalData(user.uid);
            UtilFunction.navigateForward(context, const CounselorHome());

            //----------if user is admin, navigate to admin home page----------
          } else if (adminModel != null) {
            await startFetchUserAdditionalData(user.uid);
            UtilFunction.navigateForward(context, const Adminpanel());
          }
        } catch (e) {
          Logger().e(e);
        }
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

  //-----------------------To fetch additional data---------------------

  ChatModel? _chatModel;

  ChatModel? get chatModel => _chatModel;
  Future<ChatModel?> startFetchUserAdditionalData(String uid) async {
    try {
      ChatModel? chatModel =
          await AuthController().fetchUserAdditionalData(uid);
      if (chatModel != null) {
        _chatModel = chatModel;
        notifyListeners();
        Logger().e(chatModel.lastSeen);
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
