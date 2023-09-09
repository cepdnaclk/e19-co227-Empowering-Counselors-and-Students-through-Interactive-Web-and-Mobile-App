import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaQueryData.size.height * 0.07,
        width: mediaQueryData.size.width,
        color: UtilConstants.primaryColor,
        child: Center(
          child: CustomText(
            "© 2023 BLOOMi\nAll rights reserved",
            fontColor: UtilConstants.whiteColor,
            fontSize: mediaQueryData.size.height * 0.015,
            fontWeight: FontWeight.w300,
          ),
        ));
  }
}
