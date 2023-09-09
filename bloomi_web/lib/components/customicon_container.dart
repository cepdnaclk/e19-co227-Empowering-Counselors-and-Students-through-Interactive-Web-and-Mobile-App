import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {
  final String imgPath;
  final MediaQueryData mediaQueryData;
  const CustomIconContainer({
    super.key,
    required this.imgPath,
    required this.mediaQueryData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          (mediaQueryData.size.height + mediaQueryData.size.width) * 0.007),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              (mediaQueryData.size.height + mediaQueryData.size.width) * 0.01),
          color: UtilConstants.whiteColor),
      child: Image.asset(
        imgPath,
        width: mediaQueryData.size.width * 0.03,
        height: mediaQueryData.size.height * 0.03,
      ),
    );
  }
}
