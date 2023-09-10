import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_text_link_mobile.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_mobile.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_mobile.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/screens/home/home/home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class SignUpMobile extends StatelessWidget {
  SignUpMobile({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _conformFassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

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
                                  mediaQueryData.size.width *
                                      UtilConstants.formPadding),
                              margin: EdgeInsets.only(
                                  top: mediaQueryData.size.height * 0.01),
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(
                                    mediaQueryData.size.height * 0.03),
                              ),
                              child: Column(
                                children: [
                                  FormHeading("SignUp Here",
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.06),
                                  FormInputMobile("Name",
                                      textEditingController: _name,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Email",
                                      textEditingController: _email,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Password",
                                      textEditingController: _password,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Conform Password",
                                      textEditingController: _conformFassword,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.07),
                                  FormButtonMobile("Register",
                                      mediaQueryData: mediaQueryData,
                                      widget: const Home()),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  CustomTextLinkMobile(
                                      "Already have an account?",
                                      mediaQueryData: mediaQueryData,
                                      widget: const Login())
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
