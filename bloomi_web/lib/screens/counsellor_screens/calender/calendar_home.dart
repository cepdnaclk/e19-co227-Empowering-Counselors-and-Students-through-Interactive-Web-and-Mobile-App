import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/calender/calendar_desktop.dart';
import 'package:bloomi_web/screens/counsellor_screens/calender/calendar_mobile.dart';
import 'package:bloomi_web/screens/counsellor_screens/calender/calender_tablet.dart';

import 'package:flutter/material.dart';

class CalendarHome extends StatefulWidget {
  const CalendarHome({super.key});

  @override
  State<CalendarHome> createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: CounselorCalendarMobile(),
          tabletBody: CounselorCalendarTablet(),
          desktopBody: CounselorCalendarDesktop()),
    );
  }
}
