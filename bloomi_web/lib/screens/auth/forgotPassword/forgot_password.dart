import 'package:bloomi_web/screens/auth/forgotPassword/forgotpass_mobile.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgotpass_web.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: (mediaQueryData.size.width > 900)
          ? ForgotPasswordWeb(mediaQueryData: mediaQueryData)
          : ForgotPasswordMobile(mediaQueryData: mediaQueryData),
    );
  }
}
