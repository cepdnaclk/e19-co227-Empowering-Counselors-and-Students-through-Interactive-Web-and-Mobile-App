import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class FormButtonMobile extends StatelessWidget {
  final String text;
  final Widget widget;
  const FormButtonMobile(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.widget,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UtilFunction.navigateForward(context, widget);
      },
      child: CustomButton(
        text,
        mediaQueryData: mediaQueryData,
        width:
            (mediaQueryData.size.width < 500) ? mediaQueryData.size.width : 400,
      ),
    );
  }
}
