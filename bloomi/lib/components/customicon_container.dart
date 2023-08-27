import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {
  final String imgPath;
  const CustomIconContainer({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: UtilConstants.lightgreyColor),
      child: Image.asset(imgPath),
    );
  }
}
