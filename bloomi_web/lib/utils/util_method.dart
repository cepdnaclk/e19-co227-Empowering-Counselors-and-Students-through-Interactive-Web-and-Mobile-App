import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class UtilMethod {
  static void customDialogBox(MediaQueryData mediaQueryData,
      BuildContext context, String title, String desc) {
    AwesomeDialog(
      width: mediaQueryData.size.width * 0.35,
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
