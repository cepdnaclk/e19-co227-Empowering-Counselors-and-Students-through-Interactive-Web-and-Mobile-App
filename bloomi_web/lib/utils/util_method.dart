import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class UtilMethod {
  static customDialogBox(BuildContext context, String title, String desc) {
    final double width = MediaQuery.of(context).size.width;
    AwesomeDialog(
      width: (width > 420) ? 400 : 300,
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
