import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class CustomTextLinkWeb extends StatelessWidget {
  final String text;
  final Widget route;
  const CustomTextLinkWeb(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.route,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryData.size.width * 0.3,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          UtilFunction.navigateForward(context, route);
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
