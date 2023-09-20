import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/customicon_container.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/screens/auth_screens/forgotPassword/forgot_password.dart';
import 'package:bloomi_web/screens/auth_screens/signup/signup_form.dart';
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
      child: SingleChildScrollView(
        child: Container(
          width: UtilConstants.mobileFormWidth,
          height: 440,
          padding: const EdgeInsets.symmetric(
              horizontal: UtilConstants.formPaddingHorizontalMobile,
              vertical: UtilConstants.formPaddingVerticalMobile),
          decoration: BoxDecoration(
            color: UtilConstants.lightgreyColor,
            borderRadius:
                BorderRadius.circular(UtilConstants.formBoardRadiusMobile),
          ),
          child: Column(
            children: [
              const FormHeading(
                "Login Here",
                fontSize: UtilConstants.mobileHeadingTextFontSize,
              ),
              const SizedBox(
                  height: UtilConstants.spaceBetweenHeadingAndInputTablet),
              FormInputWeb(
                "Email",
                textEditingController:
                    Provider.of<LoginProvider>(context).email,
                fontSize: UtilConstants.mobileInputFontSize,
                height: UtilConstants.mobileinputHeight,
                width: UtilConstants.mobileInputWidth,
                lableFontSize: UtilConstants.mobileLableFontSize,
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputMobile),
              Consumer<LoginProvider>(
                builder: (context, value, child) {
                  return FormInputWeb(
                    "Password",
                    textEditingController: value.password,
                    obscure: value.isObscure ? true : false,
                    icon: InkWell(
                      onTap: () {
                        value.setIsObscure(false);
                      },
                      child: const Icon(
                        Icons.visibility_off,
                        size: 15,
                      ),
                    ),
                    fontSize: UtilConstants.mobileInputFontSize,
                    height: UtilConstants.mobileinputHeight,
                    width: UtilConstants.mobileInputWidth,
                    lableFontSize: UtilConstants.mobileLableFontSize,
                  );
                },
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputMobile),
              const CustomTextLinkWeb("Forgot password?",
                  width: UtilConstants.mobileInputWidth,
                  fontSize: UtilConstants.customLinkTextMobile,
                  route: ForgotPassword()),
              const SizedBox(
                  height: UtilConstants.spaceBetweenInputAndHeadingTablet),
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
                      fontSize: UtilConstants.mobileInputFontSize,
                      height: UtilConstants.mobileinputHeight,
                      width: UtilConstants.mobileInputWidth,
                    ),
                  );
                },
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputMobile),
              const CustomTextLinkWeb("Create new account?",
                  width: UtilConstants.mobileInputWidth,
                  fontSize: UtilConstants.customLinkTextMobile,
                  route: SignUp()),
              const SizedBox(height: 30),
              const CustomText(
                "Or login with social account",
                fontSize: UtilConstants.customLinkTextMobile,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconContainer(
                    imgPath: UtilConstants.googleImagePath,
                    width: 25,
                    height: 15,
                  ),
                  SizedBox(
                      width: UtilConstants.spaceBetweenInputAndHeadingMobile),
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
      ),
    );
  }
}
