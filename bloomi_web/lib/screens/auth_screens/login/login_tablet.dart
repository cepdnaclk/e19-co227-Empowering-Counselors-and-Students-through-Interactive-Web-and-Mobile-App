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

class LoginTablet extends StatelessWidget {
  const LoginTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: UtilConstants.tabletFormWidth,
          height: 520,
          padding: const EdgeInsets.symmetric(
              horizontal: UtilConstants.formPaddingHorizontalTablet,
              vertical: UtilConstants.formPaddingVerticalTablet),
          decoration: BoxDecoration(
            color: UtilConstants.lightgreyColor,
            borderRadius:
                BorderRadius.circular(UtilConstants.formBoardRadiusTablet),
          ),
          child: Column(
            children: [
              const FormHeading(
                "Login Here",
              ),
              const SizedBox(
                  height: UtilConstants.spaceBetweenHeadingAndInputTablet),
              FormInputWeb(
                "Email",
                textEditingController:
                    Provider.of<LoginProvider>(context).email,
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputTablet),
              FormInputWeb(
                "Password",
                textEditingController:
                    Provider.of<LoginProvider>(context).password,
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputTablet),
              const CustomTextLinkWeb("Forgot password?",
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
                    ),
                  );
                },
              ),
              const SizedBox(height: UtilConstants.spaceBetweenInputTablet),
              const CustomTextLinkWeb("Create new account?", route: SignUp()),
              const SizedBox(height: 30),
              const CustomText(
                "Or login with social account",
                fontSize: UtilConstants.customLinkTextTablet,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: UtilConstants.customLinkTextTablet),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconContainer(
                    imgPath: UtilConstants.googleImagePath,
                  ),
                  SizedBox(
                      width: UtilConstants.spaceBetweenInputAndHeadingTablet),
                  CustomIconContainer(
                    imgPath: UtilConstants.facebookImagePath,
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
