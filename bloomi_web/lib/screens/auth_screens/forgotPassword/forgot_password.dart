import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/auth_screens/forgotPassword/forgot_password_tablet.dart';
import 'package:bloomi_web/screens/auth_screens/forgotPassword/forgotpass_desktop.dart';
import 'package:bloomi_web/screens/auth_screens/forgotPassword/forgotpass_mobile.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const ResponsiveLayout(
          mobileBody: ForgotPasswordMobile(),
          tabletBody: ForgotPasswordTablet(),
          desktopBody: ForgotPasswordDesktop()),
      bottomNavigationBar: Footer(width: width, height: 55),
    );
  }
}
