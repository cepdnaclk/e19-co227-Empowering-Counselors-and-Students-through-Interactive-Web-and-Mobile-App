import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignupProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _conformFassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  //-----------------Getters-----------------
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get conformFassword => _conformFassword;
  TextEditingController get email => _email;

  //-----------------Setters-----------------
  void setName(String name) {
    _name.text = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  void setConformPassword(String conformPassword) {
    _conformFassword.text = conformPassword;
    notifyListeners();
  }

  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  //----------------------Functions---------------------
  Future<void> signUpUser(String email, String password,
      MediaQueryData mediaQueryData, BuildContext context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        AuthController.signUpUser(email, password);
      } else {
        UtilMethod.customDialogBox(
            mediaQueryData, context, "Error", "Please fill all the fields");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
