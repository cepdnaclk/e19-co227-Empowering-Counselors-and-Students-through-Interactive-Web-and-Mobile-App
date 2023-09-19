import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool _isObscure = true;
  //------------------GETTERS--------------------
  TextEditingController get password => _password;
  TextEditingController get email => _email;
  bool get isObscure => _isObscure;

  //------------------SETTERS--------------------
  void setEmail(String email) {
    _email.text = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password.text = password;
    notifyListeners();
  }

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setIsObscure(bool isObscure) {
    if (isObscure == false) {
      _isObscure = !_isObscure;
      notifyListeners();
    } else {
      _isObscure = _isObscure;
      notifyListeners();
    }
  }

  //------------------Function--------------------
  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        setIsLoading(true);
        await AuthController.signInUser(email, password, context);
        setIsLoading(false);
      } else {
        UtilMethod.customDialogBox(
            context, "Error", "Please fill all the fields");
        setIsLoading(false);
      }
    } catch (e) {
      Logger().e(e);
      setIsLoading(false);
    }
  }
}
