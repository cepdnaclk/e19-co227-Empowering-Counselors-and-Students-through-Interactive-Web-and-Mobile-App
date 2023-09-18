import 'package:bloomi_web/components/admin_dropdown_menu.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/counselorregister_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counselorform extends StatefulWidget {
  const Counselorform({
    Key? key, // Use Key? instead of super.key
  }) : super(key: key);

  @override
  State<Counselorform> createState() => _CounselorformState();
}

class _CounselorformState extends State<Counselorform> {
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
            height: 580,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  const FormHeading(
                    "Update Counselor Details",
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
                    "Phone Number",
                    textEditingController:
                        Provider.of<CounselorRegistrationProvider>(context)
                            .phoneNumber,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(
                      width: 420,
                      child: AdminDropDownButtonWidget(
                          listItem: faculty, text: "Faculty")),
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
                          // Add your update logic here
                        },
                        child: const FormButtonWeb(
                          "Update",
                          isLoading: false,
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
