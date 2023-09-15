import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:flutter/material.dart';

class FormInputWeb extends StatelessWidget {
  final String text;
  final double height;
  final double fontSize;
  final double lableFontSize;
  final TextEditingController textEditingController;
  const FormInputWeb(
    this.text, {
    super.key,
    required this.textEditingController,
    this.obscure = false,
    this.width = 420,
    this.height = 50,
    this.fontSize = 14,
    this.lableFontSize = 18,
  });

  final bool obscure;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      textEditingController: textEditingController,
      lable: text,
      width: width,
      obscure: obscure,
      height: height,
      fontSize: fontSize,
      lableFontSize: lableFontSize,
    );
  }
}
