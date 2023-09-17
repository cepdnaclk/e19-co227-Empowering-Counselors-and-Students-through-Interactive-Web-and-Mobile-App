import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editTablet extends StatefulWidget {
  const editTablet({
    super.key,
  });

  @override
  State<editTablet> createState() => _editTabletState();
}

class _editTabletState extends State<editTablet> {
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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Container(
                height: 580,
                width: 420,
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: UtilConstants.lightgreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
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
                            Provider.of<SignupProvider>(context, listen: false)
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
    );
  }
}
