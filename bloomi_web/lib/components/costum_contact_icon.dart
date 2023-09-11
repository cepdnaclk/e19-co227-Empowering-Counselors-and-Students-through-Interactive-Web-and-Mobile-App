import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomContactIcon extends StatefulWidget {
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
  _CustomContactIconState createState() => _CustomContactIconState();
}

class _CustomContactIconState extends State<CustomContactIcon> {
  Color iconColor = UtilConstants.primaryColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          // Change the icon color when hovering
          iconColor = Colors.green; // Replace with your desired hover color
        });
      },
      onExit: (_) {
        setState(() {
          // Restore the original icon color when not hovering
          iconColor =
              UtilConstants.primaryColor; // Replace with your original color
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: iconColor, size: widget.size),
          CustomText(widget.text,
              fontSize: 15,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w700,
              fontColor: UtilConstants.blackColor),
        ],
      ),
    );
  }
}
