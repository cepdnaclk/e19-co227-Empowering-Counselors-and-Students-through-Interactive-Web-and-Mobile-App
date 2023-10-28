// ignore_for_file: use_build_context_synchronously
import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/controllers/counsellor_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/calender_provider.dart';
import 'package:bloomi_web/screens/admin_screens/home/adminui.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/screens/counsellor_screens/home/home_counsellor.dart';
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
            await Provider.of<AppointmentProvider>(context, listen: false)
                .fetchAllAppointments(user.uid);
            UtilFunction.navigateForward(context, Home());

            try {
              await Provider.of<CalendarProvider>(context, listen: false)
                  .getDataSource(context);
            } catch (e) {
              Logger().e(e);
            }

            //----------if user is counsellor, navigate to counsellor home page----------
          } else if (counsellorModel != null) {
            //----------to start fetching user additional data----------
            await Provider.of<CounsellorRegistrationProvider>(context,
                    listen: false)
                .startFetchCounsellorAdditionalData(user.uid);
            await Provider.of<AppointmentProvider>(context, listen: false)
                .fetchAllAppointments(user.uid);

            try {
              await Provider.of<CalendarProvider>(context, listen: false)
                  .getDataSource(context);
            } catch (e) {
              Logger().e(e);
            }
            UtilFunction.navigateForward(context, HomeCounsellor());

            //----------if user is admin, navigate to admin home page----------
          } else if (adminModel != null) {
            await startFetchUserAdditionalData(user.uid);
            await startFetchAdmins();
            await startFetchUsers();
            await startFetchCounsellors();
            await setPercentages();
            await startFetchCount();
            await startAllChatModelData();
            UtilFunction.navigateForward(context, AdminPanel());
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

  //-----------------------to fetch all admins-----------------------
  List<AdminModel>? allAdmin;

  List<AdminModel>? get admin => allAdmin;

  Future<List<AdminModel>?> startFetchAdmins() async {
    try {
      allAdmin = await AdminController().fetchAllAdminData();
      if (allAdmin!.isNotEmpty) {
        notifyListeners();
        return allAdmin;
      } else {
        Logger().i("Admin data not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------to fetch all counsellor-----------------------
  List<CounsellorModel>? allCounsellor;

  List<CounsellorModel>? get counsellors => allCounsellor;

  Future<List<CounsellorModel>?> startFetchCounsellors() async {
    try {
      allCounsellor = await CounsellorController().fetchAllCounsellorData();
      if (allCounsellor!.isNotEmpty) {
        notifyListeners();
        return allCounsellor;
      } else {
        Logger().i("Admin data not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------to fetch all users-----------------------
  List<UserModel>? userModelAll;

  List<UserModel>? get userAll => userModelAll;

  Future<List<UserModel>?> startFetchUsers() async {
    try {
      userModelAll = await AuthController().fetchAllUserData();
      if (allAdmin!.isNotEmpty) {
        notifyListeners();
        return userModelAll;
      } else {
        Logger().i("Admin data not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------------------to fetch count users-----------------------
  List<CountModel>? countModel = [];

  List<CountModel>? get count => countModel;

  List<int> countList = [0, 0, 0, 0, 0, 0, 0];

  Future<List<CountModel>?> startFetchCount() async {
    try {
      countModel!.clear();
      countModel = await AuthController().fetchAllCount();
      if (allAdmin!.isNotEmpty) {
        notifyListeners();

        for (var e in countModel!) {
          if ((e.month == DateTime.now().month) &&
              (e.date == DateTime.now().day)) {
            countList[6] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 1))) {
            countList[5] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 2))) {
            countList[4] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 3))) {
            countList[3] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 4))) {
            countList[2] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 5))) {
            countList[1] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.date == (DateTime.now().day - 6))) {
            countList[0] += 1;
          }
        }
        Logger().e(countList);
        return countModel;
      } else {
        Logger().i("Admin data not found");
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

  //-----------------------To fetch all additional data---------------------

  List<ChatModel>? allChatModel = [];

  List<ChatModel>? get allChatModels => allChatModel;

  List<int> userCount = [0, 0, 0, 0, 0, 0, 0];
  List<int> counsellorCount = [0, 0, 0, 0, 0, 0, 0];
  List<int> adminCount = [0, 0, 0, 0, 0, 0, 0];
  Future<ChatModel?> startAllChatModelData() async {
    try {
      allChatModel!.clear();
      allChatModel = await AuthController().fetchUserAdditionalAllData();
      if (allChatModel!.isNotEmpty) {
        for (var e in allChatModel!) {
          if ((e.month == DateTime.now().month) &&
              (e.day == DateTime.now().day)) {
            userCount[6] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 1))) {
            userCount[5] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 2))) {
            userCount[4] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 3))) {
            userCount[3] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 4))) {
            userCount[2] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 5))) {
            userCount[1] += 1;
          } else if ((e.month == DateTime.now().month) &&
              (e.day == (DateTime.now().day - 6))) {
            userCount[0] += 1;
          }
        }

        allChatModel!.clear();
        allChatModel =
            await CounsellorController().fetchCounsellorAdditionalAllData();
        if (allChatModel!.isNotEmpty) {
          for (var e in allChatModel!) {
            if ((e.month == DateTime.now().month) &&
                (e.day == DateTime.now().day)) {
              counsellorCount[6] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 1))) {
              counsellorCount[5] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 2))) {
              counsellorCount[4] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 3))) {
              counsellorCount[3] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 4))) {
              counsellorCount[2] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 5))) {
              counsellorCount[1] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 6))) {
              counsellorCount[0] += 1;
            }
          }
        }

        allChatModel!.clear();
        allChatModel = await AdminController().fetchAdminAdditionalAllData();
        if (allChatModel!.isNotEmpty) {
          for (var e in allChatModel!) {
            if ((e.month == DateTime.now().month) &&
                (e.day == DateTime.now().day)) {
              adminCount[6] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 1))) {
              adminCount[5] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 2))) {
              adminCount[4] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 3))) {
              adminCount[3] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 4))) {
              adminCount[2] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 5))) {
              adminCount[1] += 1;
            } else if ((e.month == DateTime.now().month) &&
                (e.day == (DateTime.now().day - 6))) {
              adminCount[0] += 1;
            }
          }
        }

        notifyListeners();
        Logger().e(userCount);
        Logger().e(counsellorCount);
        Logger().e(adminCount);
      } else {
        Logger().i("User not found");
        return null;
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
    return null;
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

  //-----------------------set count---------------------
  List<double> percentages = [];

  Future<void> setPercentages() async {
    try {
      if (userAll!.isNotEmpty && counsellors!.isNotEmpty && admin!.isNotEmpty) {
        double userPer = (userAll!.length /
                (userAll!.length + counsellors!.length + admin!.length)) *
            100;
        double counsellorPer = (counsellors!.length /
                (userAll!.length + counsellors!.length + admin!.length)) *
            100;
        double adminPer = (admin!.length /
                (userAll!.length + counsellors!.length + admin!.length)) *
            100;

        percentages.add(userPer);
        percentages.add(counsellorPer);
        percentages.add(adminPer);
        notifyListeners();
        Logger().e(percentages);
      }

      Logger().e(percentages);
    } catch (e) {
      Logger().e(e);
    }
  }
}
