import 'package:bloomi_web/screens/admin_screens/registration%20_forms/adminform.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';

class CustomControlButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color basiccolor;

  final int index;

  const CustomControlButton({
    super.key,
    required this.text,
    required this.color,
    required this.basiccolor,
    required this.index,
    // required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
          onPressed: () {
            if (index == 1) {
              AdminForm.adminregistrationform(context, "Update Admin");
            } else {
              UtilMethod.customDialogBox(
                  context, "Warning", "Do you want to delete this user?");
            }
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return color;
                }
                return basiccolor;
              },
            ),
          ),
          child: Text(
            text,
          )),
    );
  }
}
