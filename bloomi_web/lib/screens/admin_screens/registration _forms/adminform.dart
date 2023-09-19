import 'package:bloomi_web/components/admin_dropdown_menu.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adminform extends StatefulWidget {
  const Adminform({
    Key? key, // Use Key? instead of super.key
  }) : super(key: key);

  @override
  State<Adminform> createState() => _AdminformState();
}

class _AdminformState extends State<Adminform> {
  List<String> faculty = [
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 440,
            height: 600,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  const FormHeading(
                    "Add Admins",
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.04),
                  FormInputWeb(
                    "Name",
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .name,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Email",
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .email,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Password",
                    obscure: true,
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .password,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Phone Number",
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .phoneNumber,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(
                      width: 420,
                      child: AdminDropDownButtonWidget(
                          index: 1, listItem: faculty, text: "Faculty")),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Credentials",
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .credentials,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  Consumer<CounselorRegistrationProvider>(
                    builder: (context, value, child) {
                      return InkWell(
                        onTap: () {
                          value.signUpUser(
                              value.name.text,
                              value.email.text,
                              value.password.text,
                              value.phoneNumber.text,
                              value.faculty,
                              value.credentials.text,
                              context);
                        },
                        child: FormButtonWeb(
                          "Register",
                          isLoading: value.isLoading,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
