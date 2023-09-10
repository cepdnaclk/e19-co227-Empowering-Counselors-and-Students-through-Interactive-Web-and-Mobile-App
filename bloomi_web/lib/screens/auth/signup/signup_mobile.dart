import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const BackgroundColorGradient(),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryData.size.width * 0.06),
                          child: Column(children: [
                            SizedBox(height: mediaQueryData.size.height * 0.15),
                            Container(
                              padding: EdgeInsets.all(
                                  mediaQueryData.size.width * 0.04),
                              margin: EdgeInsets.only(
                                  top: mediaQueryData.size.height * 0.01),
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(
                                    mediaQueryData.size.height * 0.03),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: mediaQueryData.size.width * 0.3,
                                    child: CustomText(
                                      "SignUp Here",
                                      fontSize:
                                          mediaQueryData.size.height * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.05),
                                  CustomTextFeild(
                                    hintText: "Enter your name",
                                    lable: "Name",
                                    mediaQueryData: mediaQueryData,
                                    keyboardType: TextInputType.text,
                                    width: (mediaQueryData.size.width < 500)
                                        ? mediaQueryData.size.width
                                        : 400,
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  CustomTextFeild(
                                    hintText: "Enter your email",
                                    lable: "Email",
                                    mediaQueryData: mediaQueryData,
                                    keyboardType: TextInputType.emailAddress,
                                    width: (mediaQueryData.size.width < 500)
                                        ? mediaQueryData.size.width
                                        : 400,
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  CustomTextFeild(
                                    hintText: "Enter your password",
                                    lable: "Password",
                                    obscure: true,
                                    mediaQueryData: mediaQueryData,
                                    keyboardType: TextInputType.visiblePassword,
                                    width: (mediaQueryData.size.width < 500)
                                        ? mediaQueryData.size.width
                                        : 400,
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  CustomTextFeild(
                                    hintText: "Confirm your password",
                                    lable: "Confirm Password",
                                    obscure: true,
                                    mediaQueryData: mediaQueryData,
                                    keyboardType: TextInputType.visiblePassword,
                                    width: (mediaQueryData.size.width < 500)
                                        ? mediaQueryData.size.width
                                        : 400,
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.07),
                                  InkWell(
                                    onTap: () {
                                      UtilFunction.navigateForward(
                                          context, const Home());
                                    },
                                    child: CustomButton(
                                      "Register",
                                      mediaQueryData: mediaQueryData,
                                      width: (mediaQueryData.size.width < 500)
                                          ? mediaQueryData.size.width
                                          : 400,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  Container(
                                    width: (mediaQueryData.size.width < 500)
                                        ? mediaQueryData.size.width
                                        : 400,
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        UtilFunction.navigateForward(
                                            context, const Login());
                                      },
                                      child: CustomText(
                                        "Already have an account?",
                                        fontSize:
                                            mediaQueryData.size.height * 0.02,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.1,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Footer(mediaQueryData: mediaQueryData),
        ],
      ),
    );
  }
}
