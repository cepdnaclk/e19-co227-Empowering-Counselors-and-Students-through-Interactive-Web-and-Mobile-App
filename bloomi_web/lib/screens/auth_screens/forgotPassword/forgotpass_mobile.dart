import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/forgot_password_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Container(
              width: 300,
              height: 360,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: UtilConstants.lightgreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                const FormHeading(
                  "Reset Password",
                  fontSize: 25,
                ),
                const SizedBox(height: 50),
                const SizedBox(
                  width: 280,
                  child: CustomText(
                    "Please, enter your email address. You will receive a link to create a new password via email.",
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontColor: UtilConstants.blackColor,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 10),
                FormInputWeb(
                  "Email",
                  textEditingController:
                      Provider.of<ForgotPasswordProvider>(context).email,
                  fontSize: 12,
                  height: 45,
                  width: 280,
                  lableFontSize: 12,
                ),
                const SizedBox(height: 40),
                Consumer<ForgotPasswordProvider>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        try {
                          value.sendEmail(context, value.email.text);
                        } catch (e) {
                          Logger().e(e);
                        }
                      },
                      child: FormButtonWeb(
                        "Send",
                        isLoading: value.isLoading,
                        width: 280,
                        height: 45,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ]),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
