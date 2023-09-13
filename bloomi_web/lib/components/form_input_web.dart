import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:flutter/material.dart';

class FormInputWeb extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  const FormInputWeb(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.textEditingController,
    this.obscure = false,
  });

  final MediaQueryData mediaQueryData;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      textEditingController: textEditingController,
      lable: text,
      mediaQueryData: mediaQueryData,
      keyboardType: TextInputType.text,
      width: mediaQueryData.size.width * 0.3,
      obscure: obscure,
    );
  }
}
