import 'package:bloomi/components/custom_image.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 500,
      decoration: BoxDecoration(
          color: UtilConstants.lightBrownColor,
          borderRadius: BorderRadius.circular(10)),
      child: const CustomImage(
        imgPath: UtilConstants.counsellingImagePath,
      ),
    );
  }
}
