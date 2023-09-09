import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomNavBarWidget extends StatelessWidget {
  final String text;
  final bool isHovering;
  const CustomNavBarWidget(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.isHovering,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return CustomText(text,
        fontSize: mediaQueryData.size.width * 0.014,
        fontWeight: FontWeight.w300,
        fontColor: isHovering
            ? UtilConstants.lightRedColor
            : UtilConstants.primaryColor);
  }
}
