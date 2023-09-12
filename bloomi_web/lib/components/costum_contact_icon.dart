import 'package:flutter/material.dart';

class CustomContactIcon extends StatelessWidget {
  const CustomContactIcon(
    this.text, {
    Key? key,
    required this.mediaQueryData,
    required this.icon,
    this.size = 50,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;
  final String text;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.blue; // Change to your desired initial color

    return MouseRegion(
      onEnter: (_) {
        // Change the icon color when hovering
        iconColor = Colors.green; // Replace with your desired hover color
      },
      onExit: (_) {
        // Restore the original icon color when not hovering
        iconColor = Colors.blue; // Replace with your original color
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: size),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black, // Replace with your text color
            ),
          ),
        ],
      ),
    );
  }
}
