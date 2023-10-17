// ignore_for_file: library_private_types_in_public_api

import 'package:bloomi_web/controllers/calender_controller.dart';
import 'package:bloomi_web/providers/user_home_provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                child: const Text("Day View")),
          ],
        ),
        Expanded(
          child: SfCalendar(
            view: calenderView,
            controller: calendarController,
            initialSelectedDate: DateTime.now(),
            dataSource: MeetingDataSource(
                Provider.of<CalendarProvider>(context).meetings),
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
}
