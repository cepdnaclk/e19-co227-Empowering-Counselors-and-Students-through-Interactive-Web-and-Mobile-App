import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double width;
  final double height;
  final String imgPath;
  const CustomImage({
    super.key,
    this.width = 327,
    this.height = 235,
    this.imgPath = UtilConstants.primaryImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      width: width,
      height: height,
    );
  }
}
