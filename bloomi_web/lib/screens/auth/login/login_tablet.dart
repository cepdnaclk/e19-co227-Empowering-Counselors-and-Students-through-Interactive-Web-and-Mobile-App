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

class LoginTablet extends StatelessWidget {
  const LoginTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 15),
                        Container(
                          width: 450,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          decoration: BoxDecoration(
                            color: UtilConstants.lightgreyColor,
                            borderRadius: BorderRadius.circular(
                                UtilConstants.boardRadiusForm),
                          ),
                          child: Column(
                            children: [
                              const FormHeading(
                                "Login Here",
                              ),
                              const SizedBox(height: 70),
                              FormInputWeb(
                                "Email",
                                textEditingController:
                                    Provider.of<LoginProvider>(context).email,
                              ),
                              const SizedBox(height: 10),
                              FormInputWeb(
                                "Password",
                                textEditingController:
                                    Provider.of<LoginProvider>(context)
                                        .password,
                              ),
                              const SizedBox(height: 40),
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
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              const CustomTextLinkWeb("forgot password?",
                                  route: ForgotPassword()),
                              const SizedBox(height: 40),
                              const CustomText(
                                "Or login with social account",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 15),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomIconContainer(
                                    imgPath: UtilConstants.googleImagePath,
                                  ),
                                  SizedBox(width: 100),
                                  CustomIconContainer(
                                    imgPath: UtilConstants.facebookImagePath,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
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
