import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counselorform extends StatefulWidget {
  const Counselorform({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  State<Counselorform> createState() => _CounselorformState();
}

class _CounselorformState extends State<Counselorform> {
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Column(
            children: [
              SizedBox(height: mediaQueryData.size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        EdgeInsets.only(top: mediaQueryData.size.height * 0.02),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        FormHeading("Register Counselors",
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.04),
                        FormInputWeb("Name",
                            textEditingController:
                                Provider.of<SignupProvider>(context).name,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        FormInputWeb("Email",
                            textEditingController:
                                Provider.of<SignupProvider>(context).email,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        FormInputWeb("Phone Number",
                            textEditingController:
                                Provider.of<SignupProvider>(context)
                                    .phoneNumber,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        CustomDropdownMenu(
                          "Faculty",
                          listItem: listItems,
                          textEditingController:
                              Provider.of<SignupProvider>(context).faculty,
                        ),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        FormInputWeb("Credentials",
                            textEditingController:
                                Provider.of<SignupProvider>(context)
                                    .phoneNumber,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        FormInputWeb("User Name",
                            textEditingController:
                                Provider.of<SignupProvider>(context)
                                    .phoneNumber,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        FormInputWeb("Password",
                            textEditingController:
                                Provider.of<SignupProvider>(context)
                                    .phoneNumber,
                            mediaQueryData: mediaQueryData),
                        SizedBox(height: mediaQueryData.size.height * 0.01),
                        Consumer<SignupProvider>(
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {},
                              child: FormButtonWeb(
                                "Register",
                                isLoading: false,
                                mediaQueryData: mediaQueryData,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: mediaQueryData.size.height * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQueryData.size.height * 0.1,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      elevation: 100,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
