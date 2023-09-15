import 'package:bloomi_web/components/custom_text.dart';
import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String text;
  final double width;
  final double fontSize;
  const FormHeading(
    this.text, {
    super.key,
    this.width = 260,
    this.fontSize = 26,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomText(
        text,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
