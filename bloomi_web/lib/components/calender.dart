import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late List<Meeting> _meetings;
  late CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _meetings = _getDataSource();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        // Customize the calendar's background color
        scaffoldBackgroundColor: Colors.white,
      ),
      child: SfCalendar(
        view: CalendarView.week,
        controller: _calendarController,
        dataSource: MeetingDataSource(_meetings),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        // Customize the header style
        headerStyle: const CalendarHeaderStyle(
          backgroundColor: Colors.blue, // Header background color
          textStyle: TextStyle(
            color: Colors.white, // Header text color
            fontSize: 18.0, // Header text size
          ),
        ),
        onTap: _handleEventTap,
        timeSlotViewSettings: const TimeSlotViewSettings(
          // Customize the day view background color
          timeIntervalHeight: 100, // Customize the time slot height
          timeIntervalWidth: 60, // Customize the time slot width
          timeTextStyle: TextStyle(
            fontSize: 14.0, // Customize time slot text size
            color: Colors.black, // Customize time slot text color
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  void _handleEventTap(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final Meeting selectedEvent = details.appointments![0];
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(selectedEvent.eventName),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Start Time: ${selectedEvent.from.toString()}"),
                Text("End Time: ${selectedEvent.to.toString()}"),
                // Add more details here
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Handle event deletion
                  _deleteEvent(selectedEvent);
                  Navigator.of(context).pop();
                },
                child: const Text("Delete"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  void _deleteEvent(Meeting event) {
    setState(() {
      // Remove the event from the data source
      _meetings.remove(event);
    });
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
}
