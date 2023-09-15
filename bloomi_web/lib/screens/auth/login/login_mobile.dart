import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/screens/auth/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Container(
                          width: 300,
                          height: 380,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          decoration: BoxDecoration(
                            color: UtilConstants.lightgreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const FormHeading(
                                "Login Here",
                                fontSize: 25,
                              ),
                              const SizedBox(height: 50),
                              FormInputWeb(
                                "Email",
                                textEditingController:
                                    Provider.of<LoginProvider>(context).email,
                                fontSize: 12,
                                height: 45,
                                width: 280,
                                lableFontSize: 12,
                              ),
                              const SizedBox(height: 6),
                              FormInputWeb(
                                "Password",
                                textEditingController:
                                    Provider.of<LoginProvider>(context)
                                        .password,
                                fontSize: 12,
                                height: 45,
                                width: 280,
                                lableFontSize: 12,
                              ),
                              const SizedBox(height: 25),
                              Consumer<LoginProvider>(
                                builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () {
                                      value.signInUser(value.email.text,
                                          value.password.text, context);
                                    },
                                    child: FormButtonWeb(
                                      "Login",
                                      isLoading: value.isLoading,
                                      width: 280,
                                      height: 45,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 6),
                              const CustomTextLinkWeb("forgot password?",
                                  width: 280,
                                  fontSize: 10,
                                  route: ForgotPassword()),
                              const SizedBox(height: 10),
                              const CustomText(
                                "Or login with social account",
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 15),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomIconContainer(
                                    imgPath: UtilConstants.googleImagePath,
                                    width: 25,
                                    height: 15,
                                  ),
                                  SizedBox(width: 60),
                                  CustomIconContainer(
                                    imgPath: UtilConstants.facebookImagePath,
                                    width: 25,
                                    height: 15,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
