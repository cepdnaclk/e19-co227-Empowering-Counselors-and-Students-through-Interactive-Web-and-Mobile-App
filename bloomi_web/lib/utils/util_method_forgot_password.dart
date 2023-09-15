import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class UtilMethodForgotPassword {
  static void customDialogBox(
    BuildContext context,
    String title,
    String desc,
  ) {
    double width = MediaQuery.of(context).size.width;
    AwesomeDialog(
      width: width * 0.35,
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        UtilFunction.navigateBackward(context, const Login());
      },
    ).show();
  }
}
