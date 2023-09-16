import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpDesktop extends StatefulWidget {
  const SignUpDesktop({
    super.key,
  });

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
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
            padding: EdgeInsets.symmetric(vertical: height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 10),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageColumn(),
                    SizedBox(
                      width: 420,
                      child: CustomText(
                          "BLOOMi helps you connect and share your feelings with your mentors",
                          fontColor: UtilConstants.blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Container(
                  height: 630,
                  width: 460,
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: UtilConstants.lightgreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const FormHeading(
                        "SignUp Here",
                      ),
                      const SizedBox(height: 30),
                      FormInputWeb(
                        "Name",
                        textEditingController:
                            Provider.of<SignupProvider>(context).name,
                      ),
                      const SizedBox(height: 10),
                      FormInputWeb(
                        "Email",
                        textEditingController:
                            Provider.of<SignupProvider>(context).email,
                      ),
                      const SizedBox(height: 10),
                      FormInputWeb(
                        "Password",
                        textEditingController:
                            Provider.of<SignupProvider>(context).password,
                        obscure: true,
                      ),
                      const SizedBox(height: 10),
                      FormInputWeb(
                        "Phone Number",
                        textEditingController:
                            Provider.of<SignupProvider>(context).phoneNumber,
                      ),
                      const SizedBox(height: 10),
                      FormInputWeb(
                        "Faculty",
                        textEditingController:
                            Provider.of<SignupProvider>(context).faculty,
                      ),
                      const SizedBox(height: 10),
                      FormInputWeb("Department",
                          textEditingController:
                              Provider.of<SignupProvider>(context).department),
                      const SizedBox(height: 10),
                      FormInputWeb(
                        "Level of Study",
                        textEditingController:
                            Provider.of<SignupProvider>(context).year,
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
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 6),
                      const CustomTextLinkWeb("Already have an account?",
                          route: Login())
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
