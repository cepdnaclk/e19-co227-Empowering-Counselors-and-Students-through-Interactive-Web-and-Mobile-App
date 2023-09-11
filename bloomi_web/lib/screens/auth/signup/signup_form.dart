import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/signup/signup_mobile.dart';
import 'package:bloomi_web/screens/auth/signup/signup_web.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: (mediaQueryData.size.width > 900)
          ? SignUpWeb(mediaQueryData: mediaQueryData)
          : SignUpMobile(mediaQueryData: mediaQueryData),
      bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
    );
  }
}
