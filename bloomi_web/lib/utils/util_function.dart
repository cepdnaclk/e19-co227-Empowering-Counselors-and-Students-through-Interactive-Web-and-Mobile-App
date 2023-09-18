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

  //---------------------time picker--------------------
  static selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2100, 12, 31),
    );

    return selectedDate!;
    // Do something with the selected date

    // You can also update the TextFormFiled controller with the selected date
    // controller.text = selectedDate.toString();
  }
}
