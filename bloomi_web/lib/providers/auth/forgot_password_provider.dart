import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();

  //-----------------------To get email---------------------
  TextEditingController get email => _email;

  //-----------------------To set email---------------------
  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  //-----------------------To send email---------------------
  Future<void> sendEmail(
      BuildContext context, String email, MediaQueryData mediaQueryData) async {
    try {
      if (email.isNotEmpty) {
        AuthController.resetPassword(email, context);
      } else {
        UtilMethod.customDialogBox(
            mediaQueryData, context, "Error", "Please enter email");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
