import 'package:bloomi_web/components/custom_text.dart';
import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String text;
  const FormHeading(
    this.text, {
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width * 0.32,
      child: CustomText(
        text,
        fontSize: mediaQueryData.size.height * 0.03,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
