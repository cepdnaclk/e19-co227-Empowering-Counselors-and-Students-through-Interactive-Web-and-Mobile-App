import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 500,
      decoration: BoxDecoration(
          color: UtilConstants.primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: const CustomText(
        "Get Started",
        fontColor: UtilConstants.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
