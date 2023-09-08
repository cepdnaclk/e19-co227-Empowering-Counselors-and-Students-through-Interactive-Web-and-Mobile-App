import 'package:bloomi/screens/auth/signup/sign_des_web.dart';
import 'package:bloomi/screens/auth/signup/signup_description_mbile.dart';
import 'package:flutter/material.dart';

class SignUpDescription extends StatefulWidget {
  const SignUpDescription({super.key});

  @override
  State<SignUpDescription> createState() => _SignUpDescriptionState();
}

class _SignUpDescriptionState extends State<SignUpDescription> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isMobileLayout =
        mediaQueryData.size.width <= 500 && mediaQueryData.size.height <= 1000;

    return Scaffold(
      body: SafeArea(
        child: isMobileLayout
            ? SignUpDiscriptionMobile(mediaQueryData: mediaQueryData)
            : SignupDiscriptionWeb(mediaQueryData: mediaQueryData),
      ),
    );
  }
}
