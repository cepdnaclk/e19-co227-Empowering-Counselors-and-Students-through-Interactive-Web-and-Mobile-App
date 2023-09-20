import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          alignment: Alignment.topCenter,
          width: width,
          height: MediaQuery.of(context).size.width < 450 ? 100 : 300,
          child: Image.asset(UtilConstants.counsellingImagePath,
              fit: BoxFit.cover)),
      backgroundColor: UtilConstants.whiteColor,
    );
  }
}
