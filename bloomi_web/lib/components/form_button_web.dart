import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class FormButtonWeb extends StatelessWidget {
  final String text;
  final Widget route;
  const FormButtonWeb(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.route,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UtilFunction.navigateForward(context, route);
      },
      child: CustomButton(
        text,
        mediaQueryData: mediaQueryData,
        width: mediaQueryData.size.width * 0.3,
      ),
    );
  }
}
