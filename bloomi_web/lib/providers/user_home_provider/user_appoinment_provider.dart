import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/all_user_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserAppoinmentProvider extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();
  DateTime get getDateTime => _dateTime;

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
    Logger().i(_dateTime);
  }

  //-------------------to store the all user---------------------
  List<AllUserModel> _allUserModel = [];
  List<AllUserModel> get allUserModel => _allUserModel;

  //-----------------------start fetching all counselor data---------------------
  final List<AllUserModel> _allCounselorModel = [];
  List<AllUserModel> get allCounselorModel => _allCounselorModel;

  //-----------------------start fetching all counselor data---------------------
  final List<String> _allCounselorNameModel = [];
  List<String> get allCounselorNameModel => _allCounselorNameModel;

  //------------------to store the all user data without admin and counselors---------------------
  final List<AllUserModel> _allStudentModel = [];
  List<AllUserModel> get allStudentModel => _allStudentModel;

  //-------------------to store the all admin---------------------
  final List<AllUserModel> _allAdminModel = [];
  List<AllUserModel> get allAdminModel => _allAdminModel;

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //-----------------------start fetching all user data---------------------
  Future<void> startFetchAllUserData() async {
    try {
      setIsLoading(true);
      _allUserModel.clear();
      _allCounselorModel.clear();
      _allStudentModel.clear();
      _allAdminModel.clear();

      Logger().i(_allUserModel.length);

      _allUserModel = await AdminController().fetchAllUserData();

      for (var e in _allUserModel) {
        if (e.userType == "Counselor") {
          _allCounselorModel.add(e);
          _allCounselorNameModel.add(e.name);
        } else if (e.userType == "User") {
          _allStudentModel.add(e);
        } else {
          _allAdminModel.add(e);
        }
      }

      Logger().i("Hiiiiiiiiiiiiiiiiiii");
      Logger().i(_allUserModel.length);
      Logger().i(_allCounselorModel.length);
      Logger().i(_allStudentModel.length);
      Logger().i(_allAdminModel.length);
      setIsLoading(true);
      notifyListeners();
    } catch (e) {
      setIsLoading(true);
      Logger().e(e);
    }
  }
}
