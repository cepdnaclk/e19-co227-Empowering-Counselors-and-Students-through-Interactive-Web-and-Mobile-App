import 'package:flutter/material.dart';

class UtilConstants {
  //--------------------App Colors--------------------
  static const Color primaryColor = Color(0xff20A8D6);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static Color pinkColor = Colors.pink.shade400;
  static Color greenColor = Colors.green.shade300;
  static Color lightRedColor = Colors.red.shade300;
  static Color lightBrownColor = Colors.brown.shade100;
  static Color lightgreyColor = Colors.grey.shade300;

  //--------------------Gradient Shader--------------------
  static Shader get gradientShader => LinearGradient(
          colors: [primaryColor, pinkColor, greenColor, lightRedColor])
      .createShader(const Rect.fromLTWH(20.0, 200.0, 200.0, 20.0));

  //--------------------Image path--------------------

  static const String primaryImagePath = "assets/images/logo.png";
  static const String counsellingImagePath = "assets/images/counselling.png";
  static const String googleImagePath = "assets/images/google.png";
  static const String facebookImagePath = "assets/images/facebook.png";
  static const String profImagePath = "assets/images/prof.webp";

  //-----------------------Padding----------------------

  static const double formPadding = 0.04;
}
