import 'package:bloomi_web/controllers/meeting_controller.dart';
import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/providers/user_home_provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CalendarProvider extends ChangeNotifier {
  final List<Meeting> meetings = <Meeting>[];

  // Function to parse date and time strings
  DateTime parseDateTime(String dateStr, String timeStr) {
    final List<String> dateParts = dateStr.split('-');
    final List<String> timeParts = timeStr.split(':');

    return DateTime(
      int.parse(dateParts[0]), // Year
      int.parse(dateParts[1]), // Month
      int.parse(dateParts[2].split(' ')[0]), // Day
      int.parse(timeParts[0]), // Hour
      // Second
    );
  }

  Future<List<Meeting>> getDataSource(BuildContext context) async {
    List<AppointmentModel>? appointmentModels =
        Provider.of<AppointmentProvider>(context, listen: false)
            .appointmentModels;

    for (var e in appointmentModels!) {
      final DateTime startTime = DateTime(
        parseDateTime(e.date, e.time).year,
        parseDateTime(e.date, e.time).month,
        parseDateTime(e.date, e.time).day,
      );

      Logger().e(startTime.day);
      final DateTime endTime = startTime.add(const Duration(hours: 2));

      meetings.add(
        Meeting(e.note, startTime, endTime, false),
      );
    }
    for (var e in meetings) {
      Logger().e(e.isAllDay);
    }
    return meetings;
  }
}
