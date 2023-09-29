import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CounselorCalendarDesktop extends StatefulWidget {
  const CounselorCalendarDesktop({super.key});

  @override
  State<CounselorCalendarDesktop> createState() =>
      _CounselorCalendarDesktopState();
}

class _CounselorCalendarDesktopState extends State<CounselorCalendarDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(children: [
            const SizedBox(height: 10),
            const Calender(),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 35,
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 15),
                  onPressed: () {},
                  label: const Text(
                    "Add free days",
                    style: TextStyle(color: UtilConstants.blackColor),
                  ),
                  backgroundColor: UtilConstants.lightgreyColor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
