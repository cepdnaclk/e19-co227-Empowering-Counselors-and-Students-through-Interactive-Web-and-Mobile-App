import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CounselorCalender extends StatefulWidget {
  const CounselorCalender({super.key});

  @override
  State<CounselorCalender> createState() => _CounselorCalenderState();
}

class _CounselorCalenderState extends State<CounselorCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          firstDayOfWeek: 1,
          initialDisplayDate: DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 135, 186, 235),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
