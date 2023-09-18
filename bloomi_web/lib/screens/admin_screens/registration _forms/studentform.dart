import 'package:bloomi_web/components/admin_dropdown_menu.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/utils/department_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Studentform extends StatefulWidget {
  const Studentform({
    Key? key, // Use Key? instead of super.key
  }) : super(key: key);

  @override
  State<Studentform> createState() => _CounselorformState();
}

class _CounselorformState extends State<Studentform> {
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

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 440,
            height: 670,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: [
                  const FormHeading(
                    "Update Student Details",
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.04),
                  FormInputWeb(
                    "Name",
                    textEditingController:
                        Provider.of<SignupProvider>(context).name,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Email",
                    textEditingController:
                        Provider.of<SignupProvider>(context).email,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Password",
                    textEditingController:
                        Provider.of<SignupProvider>(context).email,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  FormInputWeb(
                    "Phone Number",
                    textEditingController:
                        Provider.of<SignupProvider>(context).phoneNumber,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(
                    width: 420,
                    child: AdminDropDownButtonWidget(
                        index: 1, listItem: faculty, text: "Faculty"),
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(
                    width: 420,
                    child: AdminDropDownButtonWidget(
                        index: 2,
                        listItem: DepartmentList.facultyOfEngineering,
                        text: "Department"),
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  SizedBox(
                    width: 420,
                    child: AdminDropDownButtonWidget(
                      listItem: year,
                      text: "Year",
                      index: 3,
                    ),
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.03),
                  Consumer<SignupProvider>(
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
