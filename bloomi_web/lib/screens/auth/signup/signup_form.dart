import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryData.size.width * 0.1),
              child: Column(
                children: [
                  SizedBox(height: mediaQueryData.size.height * 0.1),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            UtilConstants.counsellingImagePath,
                            width: mediaQueryData.size.width * 0.3,
                            height: mediaQueryData.size.height * 0.5,
                          ),
                        ],
                      ),
                      SizedBox(width: mediaQueryData.size.width * 0.14),
                      Container(
                        padding:
                            EdgeInsets.all(mediaQueryData.size.width * 0.03),
                        margin: EdgeInsets.only(
                            top: mediaQueryData.size.height * 0.02),
                        decoration: BoxDecoration(
                          color: UtilConstants.lightgreyColor,
                          borderRadius: BorderRadius.circular(
                              mediaQueryData.size.height * 0.03),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: mediaQueryData.size.height * 0.08),
                            CustomTextFeild(
                              hintText: "Enter your name",
                              lable: "Name",
                              mediaQueryData: mediaQueryData,
                              keyboardType: TextInputType.text,
                              width: mediaQueryData.size.width * 0.3,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.02),
                            CustomTextFeild(
                              hintText: "Enter your email",
                              lable: "Email",
                              mediaQueryData: mediaQueryData,
                              keyboardType: TextInputType.emailAddress,
                              width: mediaQueryData.size.width * 0.3,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.02),
                            CustomTextFeild(
                              hintText: "Enter your password",
                              lable: "Password",
                              obscure: true,
                              mediaQueryData: mediaQueryData,
                              keyboardType: TextInputType.visiblePassword,
                              width: mediaQueryData.size.width * 0.3,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.02),
                            CustomTextFeild(
                              hintText: "Confirm your password",
                              lable: "Confirm Password",
                              obscure: true,
                              mediaQueryData: mediaQueryData,
                              keyboardType: TextInputType.visiblePassword,
                              width: mediaQueryData.size.width * 0.3,
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.10),
                            InkWell(
                              onTap: () {
                                UtilFunction.navigateForward(
                                    context, const Home());
                              },
                              child: CustomButton(
                                "Register",
                                mediaQueryData: mediaQueryData,
                                width: mediaQueryData.size.width * 0.3,
                              ),
                            ),
                            SizedBox(height: mediaQueryData.size.height * 0.02),
                            Container(
                              width: mediaQueryData.size.width * 0.3,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  UtilFunction.navigateForward(
                                      context, const Login());
                                },
                                child: CustomText(
                                  "Already have an account?",
                                  fontSize: mediaQueryData.size.height * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Footer(mediaQueryData: mediaQueryData),
          ],
        ),
      ),
    );
  }
}
