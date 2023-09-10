import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class CustomTextLinkMobile extends StatelessWidget {
  final String text;
  final Widget widget;
  const CustomTextLinkMobile(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.widget,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          (mediaQueryData.size.width < 500) ? mediaQueryData.size.width : 400,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          UtilFunction.navigateForward(context, widget);
        },
        child: CustomText(
          text,
          fontSize: mediaQueryData.size.height * 0.02,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
