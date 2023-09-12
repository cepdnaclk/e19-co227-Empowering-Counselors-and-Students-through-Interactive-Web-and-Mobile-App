import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomImageCart extends StatelessWidget {
  const CustomImageCart({
    super.key,
    required this.mediaQueryData,
    this.width = 300,
    this.imgpath = UtilConstants.talkImagePath,
  });

  final MediaQueryData mediaQueryData;
  final double width;
  final String imgpath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imgpath,
      ),
    );
  }
}
