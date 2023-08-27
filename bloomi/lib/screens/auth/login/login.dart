import 'package:bloomi/components/custom_button.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/components/custom_textfeild.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      UtilFunction.navigateBackward(
                          context, const SignUpDescription());
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                const SizedBox(height: 72),
                const CustomText(
                  "Login",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset(
                  UtilConstants.counsellingImagePath,
                  width: 300,
                  height: 150,
                ),
                const SizedBox(height: 30),
                const CustomTextFeild(
                  lable: "Enter your email",
                ),
                const SizedBox(height: 20),
                const CustomTextFeild(
                  lable: "Enter password",
                  obscure: true,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 86),
                const CustomButton("Login")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
