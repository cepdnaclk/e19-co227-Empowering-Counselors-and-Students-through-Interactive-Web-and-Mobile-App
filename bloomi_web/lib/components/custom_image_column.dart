import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomImageColumn extends StatelessWidget {
  const CustomImageColumn({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          UtilConstants.counsellingImagePath,
          width: mediaQueryData.size.width * 0.3,
          height: mediaQueryData.size.height * 0.5,
        ),
      ],
    );
  }
}
