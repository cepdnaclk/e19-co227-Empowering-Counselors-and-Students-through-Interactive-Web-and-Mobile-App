import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomImageColumn extends StatelessWidget {
  const CustomImageColumn({
    super.key,
    this.width = 380,
    this.height = 380,
  });

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          UtilConstants.counsellingImagePath,
          width: width,
          height: height,
        ),
      ],
    );
  }
}
