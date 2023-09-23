import 'package:bloomi_web/screens/admin_screens/registration%20_forms/counselorform.dart';
import 'package:flutter/material.dart';

class CustomControlButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color basiccolor;
  // final VoidCallback function;

  const CustomControlButton({
    super.key,
    required this.text,
    required this.color,
    required this.basiccolor,
    // required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
          onPressed: () {
            CounselorForm.counselorregistrationform(context);
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
