import 'package:bloomi_web/components/background_color_gradient.dart';
import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_heading.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth/login/login.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWeb extends StatefulWidget {
  const SignUpWeb({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  State<SignUpWeb> createState() => _SignUpWebState();
}

class _SignUpWebState extends State<SignUpWeb> {
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
      child: Stack(
        children: [
          const BackgroundColorGradient(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.mediaQueryData.size.width * 0.1),
                    child: Column(
                      children: [
                        SizedBox(
                            height: widget.mediaQueryData.size.height * 0.02),
                        Row(
                          children: [
                            CustomImageColumn(
                                mediaQueryData: widget.mediaQueryData),
                            SizedBox(
                                width: widget.mediaQueryData.size.width * 0.12),
                            Container(
                              padding: EdgeInsets.all(
                                  widget.mediaQueryData.size.width * 0.03),
                              margin: EdgeInsets.only(
                                  top:
                                      widget.mediaQueryData.size.height * 0.02),
                              decoration: BoxDecoration(
                                color: UtilConstants.lightgreyColor,
                                borderRadius: BorderRadius.circular(
                                    widget.mediaQueryData.size.height * 0.03),
                              ),
                              child: Column(
                                children: [
                                  FormHeading("SignUp Here",
                                      mediaQueryData: widget.mediaQueryData),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.04),
                                  FormInputWeb("Name",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .name,
                                      mediaQueryData: widget.mediaQueryData),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  FormInputWeb("Email",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .email,
                                      mediaQueryData: widget.mediaQueryData),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  FormInputWeb(
                                    "Password",
                                    textEditingController:
                                        Provider.of<SignupProvider>(context)
                                            .password,
                                    mediaQueryData: widget.mediaQueryData,
                                    obscure: true,
                                  ),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  FormInputWeb("Phone Number",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .phoneNumber,
                                      mediaQueryData: widget.mediaQueryData),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  CustomDropdownMenu(
                                    "Faculty",
                                    listItem: listItems,
                                    textEditingController:
                                        Provider.of<SignupProvider>(context)
                                            .faculty,
                                  ),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  FormInputWeb("Department",
                                      textEditingController:
                                          Provider.of<SignupProvider>(context)
                                              .department,
                                      mediaQueryData: widget.mediaQueryData),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.01),
                                  CustomDropdownMenu(
                                    "Level of Study",
                                    listItem: year,
                                    textEditingController:
                                        Provider.of<SignupProvider>(context)
                                            .year,
                                  ),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.06),
                                  Consumer<SignupProvider>(
                                    builder: (context, value, child) {
                                      return InkWell(
                                        onTap: () {
                                          Provider.of<SignupProvider>(context,
                                                  listen: false)
                                              .signUpUser(
                                                  value.email.text,
                                                  value.password.text,
                                                  widget.mediaQueryData,
                                                  context);
                                        },
                                        child: FormButtonWeb(
                                          "Register",
                                          isLoading: value.isLoading,
                                          mediaQueryData: widget.mediaQueryData,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          widget.mediaQueryData.size.height *
                                              0.02),
                                  CustomTextLinkWeb("Already have an account?",
                                      mediaQueryData: widget.mediaQueryData,
                                      route: const Login())
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: widget.mediaQueryData.size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
