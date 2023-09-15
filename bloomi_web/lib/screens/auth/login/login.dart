import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/auth/login/login_desktop.dart';
import 'package:bloomi_web/screens/auth/login/login_mobile.dart';
import 'package:bloomi_web/screens/auth/login/login_tablet.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const ResponsiveLayout(
          mobileBody: LoginMobile(),
          tabletBody: LoginTablet(),
          desktopBody: LoginDesktop()),
      bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
