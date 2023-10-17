import 'package:bloomi_web/controllers/appoinment_controller.dart';
import 'package:bloomi_web/utils/util_method_forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CounsellorAppointmentProvider extends ChangeNotifier {
  TextEditingController _note = TextEditingController();

  TextEditingController get note => _note;

  set note(TextEditingController note) {
    _note = note;
    notifyListeners();
  }

  //------------------------ CHANGE APPOINTMENT ------------------------

  Future<void> changeAppointment(String uid, BuildContext context) async {
    try {
      AppointmentController().updateNoteState(uid, note.text);
      notifyListeners();
      _note.clear();
      UtilMethodForgotPassword.customDialogBox(
          context, "Success", "Approdved Successfully");
    } catch (e) {
      Logger().e(e);
    }
  }
}
