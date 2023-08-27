import 'package:flutter/material.dart';

class UtilFunction {
  //---------------------Forward Navigation--------------------
  static void navigateForward(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  //---------------------Backward Navigation--------------------
  static void navigateBackward(BuildContext context, Widget widget) {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
