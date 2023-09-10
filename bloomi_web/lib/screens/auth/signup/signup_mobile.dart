import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_text_link_mobile.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/components/form_button_mobile.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_mobile.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .name,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Email",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .email,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Password",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .password,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.02),
                                  FormInputMobile("Conform Password",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .conformFassword,
                                      mediaQueryData: mediaQueryData),
                                  SizedBox(
                                      height:
                                          mediaQueryData.size.height * 0.07),
                                  Consumer<SignupProvider>(
                                    builder: (context, value, child) {
                                      return InkWell(
                                        onTap: () {
                                          value.signUpUser(
                                              value.email.text,
                                              value.password.text,
                                              mediaQueryData,
                                              context);
                                        },
                                        child: FormButtonMobile(
                                          "Register",
                                          mediaQueryData: mediaQueryData,
                                        ),
                                      );
                                    },
                                  ),
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
