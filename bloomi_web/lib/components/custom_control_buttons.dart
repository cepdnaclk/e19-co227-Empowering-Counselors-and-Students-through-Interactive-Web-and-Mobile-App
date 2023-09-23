import 'package:flutter/material.dart';

class CustomControlButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color basiccolor;

  final VoidCallback onPressed;

  const CustomControlButton({
    super.key,
    required this.text,
    required this.color,
    required this.basiccolor,
    required this.onPressed,
    // required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
          onPressed: onPressed,
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
