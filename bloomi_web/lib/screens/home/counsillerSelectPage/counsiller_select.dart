import 'package:bloomi_web/components/counselor_object.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/screens/home/home/navbar.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class CounselorSelect extends StatefulWidget {
  const CounselorSelect({super.key});

  @override
  State<CounselorSelect> createState() => _CounselorSelectState();
}

class _CounselorSelectState extends State<CounselorSelect> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryData.size.height * 0.03),
              child: Column(
                children: [
                  SizedBox(height: mediaQueryData.size.height * 0.12),
                  CustomText(
                    "Choose your Counselor",
                    fontSize: mediaQueryData.size.height * 0.03,
                    fontColor: UtilConstants.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.06),
                  InkWell(
                    onTap: () {
                      UtilFunction.navigateForward(context, const HomeNabBar());
                    },
                    child: CounselorObject(mediaQueryData: mediaQueryData),
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.038),
                  CounselorObject(mediaQueryData: mediaQueryData),
                  SizedBox(height: mediaQueryData.size.height * 0.038),
                  CounselorObject(mediaQueryData: mediaQueryData),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
