import 'package:bloomi_web/components/calender.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CounselorCalendarTablet extends StatefulWidget {
  const CounselorCalendarTablet({super.key});

  @override
  State<CounselorCalendarTablet> createState() =>
      _CounselorCalendarTabletState();
}

class _CounselorCalendarTabletState extends State<CounselorCalendarTablet> {
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
                height: 30,
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 15),
                  onPressed: () {},
                  label: const Text(
                    "Add free days",
                    style: TextStyle(
                        color: UtilConstants.blackColor, fontSize: 13),
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

/*Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 10),
            color: UtilConstants.homeBackgroundColor,
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 10),
            //width: double.infinity,
            child: Row(children: [
              ElevatedButton(
                child: Text(
                  "Add Free Days",
                  style: TextStyle(color: UtilConstants.blackColor),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: UtilConstants.lightgreyColor),
                onPressed: () {},
              ),
            ]),
          ),*/
