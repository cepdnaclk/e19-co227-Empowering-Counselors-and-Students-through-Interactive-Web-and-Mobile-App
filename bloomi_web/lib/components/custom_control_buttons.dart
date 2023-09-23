import 'package:bloomi_web/screens/admin_screens/registration%20_forms/adminform.dart';
import 'package:flutter/material.dart';

class CustomControlButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color basiccolor;

  const CustomControlButton({
    super.key,
    required this.text,
    required this.color,
    required this.basiccolor,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
          onPressed: () => AdminForm.adminregistrationform(context),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return color; //<-- SEE HERE
                }
                return basiccolor; // Defer to the widget's default.
              },
            ),
          ),
          child: Text(
            text,
          )),
    );
  }
}
