import 'package:bloomi/components/counselor_object.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/screens/home/home/navbar.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class CounselorSelect extends StatefulWidget {
  const CounselorSelect({super.key});

  @override
  State<CounselorSelect> createState() => _CounselorSelectState();
}

class _CounselorSelectState extends State<CounselorSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const CustomText(
                    "Choose your Counselor",
                    fontSize: 24,
                    fontColor: UtilConstants.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      UtilFunction.navigateForward(context, const HomeNabBar());
                    },
                    child: const CounselorObject(),
                  ),
                  const SizedBox(height: 30),
                  const CounselorObject(),
                  const SizedBox(height: 30),
                  const CounselorObject(),
                  const SizedBox(height: 30),
                  const CounselorObject(),
                  const SizedBox(height: 30),
                  const CounselorObject(),
                  const SizedBox(height: 30),
                  const CounselorObject(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
