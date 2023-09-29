import 'package:flutter/material.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CounselorCalendarView extends StatelessWidget {
  const CounselorCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      monthViewSettings: const MonthViewSettings(showAgenda: true),
      firstDayOfWeek: 1,
      initialDisplayDate: DateTime.now(),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      selectionDecoration: BoxDecoration(
        color: UtilConstants.lightgreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
