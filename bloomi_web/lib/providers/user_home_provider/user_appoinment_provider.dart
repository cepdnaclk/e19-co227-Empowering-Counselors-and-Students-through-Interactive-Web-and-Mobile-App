import 'package:bloomi_web/controllers/admin_controller.dart';
import 'package:bloomi_web/models/admin/counselor_model.dart';
import 'package:flutter/material.dart';

class UserAppoinmentProvider extends ChangeNotifier {
  //-------------------to store the all user---------------------
  final List<AllUserModel> _allUserModel = [];

  List<AllUserModel> get allUserModel => _allUserModel;

  //-----------------------start fetching all user data---------------------
  Future<void> startFetchAllUserData() async {
    try {
      List<AllUserModel> allUserModel =
          await AdminController().fetchAllUserData();
      if (allUserModel.isNotEmpty) {
        _allUserModel.clear();
        _allUserModel.addAll(allUserModel);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
