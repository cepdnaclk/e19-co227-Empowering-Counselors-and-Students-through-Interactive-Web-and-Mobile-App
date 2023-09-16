import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class FormButtonWeb extends StatelessWidget {
  final String text;
  final bool isLoading;
  final double width;
  final double height;
  final double fontSize;

  const FormButtonWeb(
    this.text, {
    super.key,
    required this.isLoading,
    this.width = 420,
    this.height = UtilConstants.formInputFeildHeightDesktop,
    this.fontSize = UtilConstants.buttonTextSizeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      height: height,
      isLoading: isLoading,
      width: width,
      fontSize: fontSize,
    );
  }
}
