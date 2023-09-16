import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/forgot_password_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  const ForgotPasswordDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 140),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 20),
                    const CustomImageColumn(
                      width: 380,
                      height: 380,
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: UtilConstants.lightgreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(children: [
                            const FormHeading(
                              "Reset Password",
                            ),
                            const SizedBox(height: 40),
                            const SizedBox(
                              width: 420,
                              child: CustomText(
                                "Please, enter your email address. You will receive a link to create a new password via email.",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontColor: UtilConstants.blackColor,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 10),
                            FormInputWeb(
                              "Email",
                              textEditingController:
                                  Provider.of<ForgotPasswordProvider>(context)
                                      .email,
                            ),
                            const SizedBox(height: 40),
                            Consumer<ForgotPasswordProvider>(
                              builder: (context, value, child) {
                                return InkWell(
                                  onTap: () {
                                    try {
                                      value.sendEmail(
                                          context, value.email.text);
                                    } catch (e) {
                                      Logger().e(e);
                                    }
                                  },
                                  child: FormButtonWeb(
                                    "Send",
                                    isLoading: value.isLoading,
                                  ),
                                );
                              },
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
