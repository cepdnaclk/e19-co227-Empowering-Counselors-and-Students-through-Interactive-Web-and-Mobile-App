// ignore_for_file: library_private_types_in_public_api

import 'package:bloomi_web/controllers/calender_controller.dart';
import 'package:bloomi_web/controllers/meeting_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarView calenderView = CalendarView.month;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    backgroundColor: Colors.grey[200]),
                onPressed: () {
                  setState(() {
                    calenderView = CalendarView.week;
                    calendarController.view = calenderView;
                  });
                },
                child: const Text("Week View")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    backgroundColor: Colors.grey[200]),
                onPressed: () {
                  setState(() {
                    calenderView = CalendarView.month;
                    calendarController.view = calenderView;
                  });
                },
                child: const Text("Moth View")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    backgroundColor: Colors.grey[200]),
                onPressed: () {
                  setState(() {
                    calenderView = CalendarView.day;
                    calendarController.view = calenderView;
                  });
                },
                child: const Text("Year View")),
          ],
        ),
        Expanded(
          child: SfCalendar(
            view: calenderView,
            controller: calendarController,
            initialSelectedDate: DateTime.now(),
            dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
            ),
            selectionDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ),
      ],
    ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting('Conference', startTime, endTime, false),
    );
    meetings.add(
      Meeting('Conference', startTime, endTime, false),
    );

    return meetings;
  }
}
