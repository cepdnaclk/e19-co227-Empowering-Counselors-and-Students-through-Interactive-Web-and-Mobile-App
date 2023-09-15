import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/auth/signup/signup_desktop.dart';
import 'package:bloomi_web/screens/auth/signup/signup_mobile.dart';
import 'package:bloomi_web/screens/auth/signup/signup_tablet.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const ResponsiveLayout(
          mobileBody: SignUpMobile(),
          tabletBody: SignUpTablet(),
          desktopBody: SignUpDesktop()),
      bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
