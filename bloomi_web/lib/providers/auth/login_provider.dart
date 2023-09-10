import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  //------------------GETTERS--------------------
  TextEditingController get password => _password;
  TextEditingController get email => _email;

  //------------------SETTERS--------------------
  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  //------------------Function--------------------
  Future<void> signInUser(String email, String password,
      MediaQueryData mediaQueryData, BuildContext context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        AuthController.signInUser(email, password);
      } else {
        UtilMethod.customDialogBox(
            mediaQueryData, context, "Error", "Please fill all the fields");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
