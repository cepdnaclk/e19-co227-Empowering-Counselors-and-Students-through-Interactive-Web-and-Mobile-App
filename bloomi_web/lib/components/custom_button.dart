import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final double width;
  final bool isLoading;
  final double height;
  final double fontSize;
  final VoidCallback onPressed;
  const CustomButton(
    this.text, {
    super.key,
    required this.width,
    this.isLoading = false,
    required this.height,
    this.fontSize = 20,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: UtilConstants.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: (isLoading == true)
          ? const CircularProgressIndicator.adaptive()
          : CustomText(
              text,
              fontColor: UtilConstants.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
