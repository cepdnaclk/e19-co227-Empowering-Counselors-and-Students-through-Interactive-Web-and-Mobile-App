import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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

  //---------------------time picker--------------------
  static selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2100, 12, 31),
    );

    return selectedDate!;
  }

  //---------------------time ago function--------------------
  static String getTimeAgo(String date) {
    return timeago.format(DateTime.parse(date), allowFromNow: true);
  }
}
