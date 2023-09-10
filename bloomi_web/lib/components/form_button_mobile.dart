import 'package:bloomi_web/components/custom_button.dart';
import 'package:flutter/material.dart';

class FormButtonMobile extends StatelessWidget {
  final String text;

  const FormButtonMobile(
    this.text, {
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      mediaQueryData: mediaQueryData,
      width:
          (mediaQueryData.size.width < 500) ? mediaQueryData.size.width : 400,
    );
  }
}
