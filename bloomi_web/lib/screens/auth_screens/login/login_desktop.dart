import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/google_auth_provider.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/screens/auth_screens/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/screens/auth_screens/signup/signup_form.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10),
              const Column(
                children: [
                  CustomImageColumn(),
                  SizedBox(
                    width: 420,
                    child: CustomText(
                        "BLOOMi helps you connect and share your feelings with your mentors",
                        fontColor: UtilConstants.blackColor,
                        fontSize: UtilConstants.loginPageFontSizeDesktop,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                width: UtilConstants.desktopFormWidth,
                height: 520,
                padding: const EdgeInsets.symmetric(
                    horizontal: UtilConstants.formPaddingHorizontalDesktop,
                    vertical: UtilConstants.formPaddingVerticalDesktop),
                decoration: BoxDecoration(
                  color: UtilConstants.lightgreyColor,
                  borderRadius: BorderRadius.circular(
                      UtilConstants.formBoardRadiusDesktop),
                ),
                child: Column(
                  children: [
                    const FormHeading(
                      "Login Here",
                    ),
                    const SizedBox(
                        height:
                            UtilConstants.spaceBetweenHeadingAndInputDesktop),
                    FormInputWeb(
                      "Email",
                      textEditingController:
                          Provider.of<LoginProvider>(context).email,
                    ),
                    const SizedBox(
                        height: UtilConstants.spaceBetweenInputDesktop),
                    FormInputWeb(
                      "Password",
                      textEditingController:
                          Provider.of<LoginProvider>(context).password,
                    ),
                    const SizedBox(
                        height: UtilConstants.spaceBetweenInputDesktop),
                    const CustomTextLinkWeb("Forgot password?",
                        route: ForgotPassword()),
                    const SizedBox(
                        height:
                            UtilConstants.spaceBetweenInputAndHeadingDesktop),
                    Consumer<LoginProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.signInUser(
                                value.email.text, value.password.text, context);
                          },
                          child: FormButtonWeb(
                            "Login",
                            isLoading: value.isLoading,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                        height: UtilConstants.spaceBetweenInputDesktop),
                    const CustomTextLinkWeb("Create new account?",
                        route: SignUp()),
                    const SizedBox(height: 30),
                    const CustomText(
                      "Or login with social account",
                      fontSize: UtilConstants.customLinkTextDesktop,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                        height: UtilConstants.spaceBetweenInputDesktop),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<GoogleAuthProviders>(context,
                                    listen: false)
                                .googleAuth();
                          },
                          child: const CustomIconContainer(
                            imgPath: UtilConstants.googleImagePath,
                          ),
                        ),
                        const SizedBox(
                            width: UtilConstants
                                .spaceBetweenInputAndHeadingDesktop),
                        const CustomIconContainer(
                          imgPath: UtilConstants.facebookImagePath,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: UtilConstants.spaceBetweenInputDesktop),
            ],
          ),
        ),
      ),
    );
  }
}
