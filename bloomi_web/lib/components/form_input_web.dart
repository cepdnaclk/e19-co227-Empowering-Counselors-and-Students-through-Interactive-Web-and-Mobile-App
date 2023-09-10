import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:flutter/material.dart';

class FormInputWeb extends StatelessWidget {
  final String text;
  const FormInputWeb(
    this.text, {
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      lable: text,
      mediaQueryData: mediaQueryData,
      keyboardType: TextInputType.text,
      width: mediaQueryData.size.width * 0.3,
    );
  }
}
