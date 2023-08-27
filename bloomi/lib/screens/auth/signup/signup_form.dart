import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                const SizedBox(height: 72),
                const CustomText(
                  "SignUp",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset(
                  UtilConstants.counsellingImagePath,
                  width: 300,
                  height: 150,
                ),
                const SizedBox(height: 30),
                const CustomTextFeild()
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Enter your full name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
