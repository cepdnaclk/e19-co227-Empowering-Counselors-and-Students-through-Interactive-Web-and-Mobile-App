import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class CustomTextLinkWeb extends StatelessWidget {
  final String text;
  final Widget route;
  final double width;
  final double fontSize;
  const CustomTextLinkWeb(
    this.text, {
    super.key,
    required this.route,
    this.width = 420,
    this.fontSize = UtilConstants.customLinkTextDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          UtilFunction.navigateForward(context, route);
        },
        child: CustomText(
          text,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
