import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key, // Fixed the syntax error here
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to transparent
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 5, // Spread radius of the shadow
            blurRadius: 10, // Blur radius of the shadow
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: Center(
        child: CustomText(
          "© 2023 BLOOMi - University of Peradeniya\nAll rights reserved",
          fontColor: UtilConstants.blackColor,
          fontSize: height * 0.2,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
