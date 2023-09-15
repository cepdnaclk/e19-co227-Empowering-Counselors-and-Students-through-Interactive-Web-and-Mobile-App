import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpMobile extends StatefulWidget {
  const SignUpMobile({
    super.key,
  });

  @override
  State<SignUpMobile> createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<SignUpMobile> {
  List<String> listItems = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
  ];

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 550,
                  width: 300,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: UtilConstants.lightgreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const FormHeading(
                        "SignUp Here",
                        fontSize: 25,
                      ),
                      const SizedBox(height: 30),
                      FormInputWeb(
                        "Name",
                        textEditingController:
                            Provider.of<SignupProvider>(context).name,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Email",
                        textEditingController:
                            Provider.of<SignupProvider>(context).email,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Password",
                        textEditingController:
                            Provider.of<SignupProvider>(context).password,
                        obscure: true,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Phone Number",
                        textEditingController:
                            Provider.of<SignupProvider>(context).phoneNumber,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Faculty",
                        textEditingController:
                            Provider.of<SignupProvider>(context).faculty,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Department",
                        textEditingController:
                            Provider.of<SignupProvider>(context).department,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 6),
                      FormInputWeb(
                        "Level of Study",
                        textEditingController:
                            Provider.of<SignupProvider>(context).year,
                        fontSize: 12,
                        height: 45,
                        width: 280,
                        lableFontSize: 12,
                      ),
                      const SizedBox(height: 25),
                      Consumer<SignupProvider>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              Provider.of<SignupProvider>(context,
                                      listen: false)
                                  .signUpUser(
                                      value.email.text,
                                      value.password.text,
                                      value.name.text,
                                      value.phoneNumber.text,
                                      value.department.text,
                                      value.faculty.text,
                                      value.year.text,
                                      context);
                            },
                            child: FormButtonWeb(
                              "Register",
                              isLoading: value.isLoading,
                              width: 280,
                              height: 45,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 6),
                      const CustomTextLinkWeb("Already have an account?",
                          width: 280, fontSize: 9, route: Login())
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
