import 'package:bloomi/components/custom_text.dart';
import 'package:flutter/material.dart';

class CounsillerSelect extends StatefulWidget {
  const CounsillerSelect({super.key});

  @override
  State<CounsillerSelect> createState() => _CounsillerSelectState();
}

class _CounsillerSelectState extends State<CounsillerSelect> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomText("Choose your Counselor."),
        ),
      ),
    );
  }
}
