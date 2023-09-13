import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final MediaQueryData mediaQueryData;
  final double width;
  final bool isLoading;
  const CustomButton(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: mediaQueryData.size.height * 0.07,
      width: width,
      decoration: BoxDecoration(
          color: UtilConstants.primaryColor,
          borderRadius:
              BorderRadius.circular(mediaQueryData.size.height * 0.01)),
      child: (isLoading == true)
          ? const CircularProgressIndicator.adaptive()
          : CustomText(
              text,
              fontColor: UtilConstants.whiteColor,
              fontSize: mediaQueryData.size.height * 0.023,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
