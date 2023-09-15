import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {
  final String imgPath;
  final double width;
  final double height;
  const CustomIconContainer({
    super.key,
    required this.imgPath,
    this.width = 40,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UtilConstants.boardRadiusForm),
          color: UtilConstants.whiteColor),
      child: Image.asset(
        imgPath,
        width: width,
        height: height,
      ),
    );
  }
}
