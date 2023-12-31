// ignore_for_file: use_build_context_synchronously

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

  bool _isLoading = false;

  //-----------------Getters-----------------
  bool get isLoading => _isLoading;

  //-----------------Setters-----------------
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //-----------------------To send email---------------------
  Future<void> sendEmail(BuildContext context, String email) async {
    try {
      if (email.isNotEmpty) {
        setIsLoading(true);
        await AuthController.resetPassword(email, context);

        setIsLoading(false);
      } else {
        Logger().e("Please enter email");
        UtilMethod.customDialogBox(
          context,
          "Error",
          "Please enter email",
          onCancelPressed: () {},
          onOkPressed: () {},
        );
        setIsLoading(false);
      }
    } catch (e) {
      setIsLoading(false);
    }
  }
}
