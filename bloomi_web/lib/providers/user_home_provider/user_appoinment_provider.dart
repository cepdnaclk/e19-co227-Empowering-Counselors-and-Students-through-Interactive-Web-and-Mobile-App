import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/admin/counselor_model.dart';
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

      _allUserModel = await AdminController().fetchAllUserData();

      for (var e in _allUserModel) {
        if (e.userType == "Counselor") {
          _allCounselorModel.add(e);
        }
      }

      setIsLoading(true);
      notifyListeners();
    } catch (e) {
      setIsLoading(true);
      Logger().e(e);
    }
  }
}
