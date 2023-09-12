import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/login/login_mobile.dart';
import 'package:bloomi_web/screens/auth/login/login_web.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: (mediaQueryData.size.width > 900)
          ? LoginWeb(mediaQueryData: mediaQueryData)
          : LoginMobile(mediaQueryData: mediaQueryData),
      bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
    );
  }
}
