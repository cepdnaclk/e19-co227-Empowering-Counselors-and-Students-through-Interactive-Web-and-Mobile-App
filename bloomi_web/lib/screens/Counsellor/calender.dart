import 'package:flutter/material.dart';

class CounselorCalender extends StatefulWidget {
  const CounselorCalender({super.key});

  @override
  State<CounselorCalender> createState() => _CounselorCalenderState();
}

class _CounselorCalenderState extends State<CounselorCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Calender"),
    ));
  }
}
