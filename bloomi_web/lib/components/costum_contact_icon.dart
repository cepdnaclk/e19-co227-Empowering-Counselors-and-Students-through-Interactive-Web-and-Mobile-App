import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomContactIcon extends StatelessWidget {
  const CustomContactIcon(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.icon,
    this.size = 0.05,
  });

  final MediaQueryData mediaQueryData;
  final String text;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: UtilConstants.primaryColor,
          size: mediaQueryData.size.width * size,
        ),
        CustomText(text,
            fontSize: mediaQueryData.size.width * 0.01,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w700,
            fontColor: UtilConstants.blackColor),
      ],
    );
  }
}
