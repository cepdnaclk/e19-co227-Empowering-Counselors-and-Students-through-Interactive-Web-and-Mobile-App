import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class BackgroundColorGradient extends StatelessWidget {
  const BackgroundColorGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            UtilConstants.primaryColor.withOpacity(0.001),
            // Replace with your desired gradient colors
            UtilConstants.whiteColor,
          ],
        ),
      ),
    );
  }
}
