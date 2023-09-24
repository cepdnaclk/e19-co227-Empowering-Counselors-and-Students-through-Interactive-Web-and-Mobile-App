import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AllUserProvider extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();
  DateTime get getDateTime => _dateTime;

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
    Logger().i(_dateTime);
  }

  //-------------------to store the all user---------------------
  final List<UserModel> _allUserModel = [];
  List<UserModel> get allUserModel => _allUserModel;

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

      Logger().i(_allUserModel.length);

      List<UserModel> allUserModel = await AuthController().fetchAllUserData();

      for (var e in allUserModel) {
        _allUserModel.add(e);
      }

      setIsLoading(true);
      notifyListeners();
    } catch (e) {
      setIsLoading(true);
      Logger().e(e);
    }
  }
}
