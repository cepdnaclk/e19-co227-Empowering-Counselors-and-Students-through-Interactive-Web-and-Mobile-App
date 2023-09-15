import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        color: UtilConstants.primaryColor,
        child: Center(
          child: CustomText(
            "© 2023 BLOOMi - University of Peradeniya\nAll rights reserved",
            fontColor: UtilConstants.whiteColor,
            fontSize: height * 0.2,
            fontWeight: FontWeight.w300,
          ),
        ));
  }
}
