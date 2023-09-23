import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String text;
  final double width;
  final double fontSize;
  final Color color;
  const FormHeading(
    this.text, {
    super.key,
    this.width = 260,
    this.fontSize = 26,
    this.color = UtilConstants.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomText(
        text,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontColor: color,
      ),
    );
  }
}
