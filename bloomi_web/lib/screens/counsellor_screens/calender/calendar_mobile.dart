import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/screens/counsellor_screens/calender/add_free_days.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CounselorCalendarMobile extends StatefulWidget {
  const CounselorCalendarMobile({super.key});

  @override
  State<CounselorCalendarMobile> createState() =>
      _CounselorCalendarMobileState();
}

class _CounselorCalendarMobileState extends State<CounselorCalendarMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 25,
                  child: FloatingActionButton.extended(
                    extendedPadding: const EdgeInsets.symmetric(horizontal: 15),
                    onPressed: () {
                      dialogBox(context);
                    },
                    label: const Text(
                      "Add free days",
                      style: TextStyle(
                          color: UtilConstants.blackColor, fontSize: 12),
                    ),
                    backgroundColor: UtilConstants.lightgreyColor,
                  ),
                ),
              ),
              //const SizedBox(height: 5),
              const Calendar(),
            ]),
          ),
        ),
      ),
    );
  }

  void dialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddFreeDays(),
    );
  }
}
