import 'package:bloomi_web/components/custom_form_note_taking.dart';
import 'package:bloomi_web/components/note_card.dart';
import 'package:bloomi_web/providers/user_home_provider/note_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar Demo', home: Note());
  }
}

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.all(10),
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: const Calender(),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: NoteCard(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            context: context,
            builder: (context) {
              return Consumer<NoteProvider>(
                builder: (context, value, child) {
                  return const CustomFormNoteTaking();
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      dataSource: MeetingDataSource(_getDataSource()),
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
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
