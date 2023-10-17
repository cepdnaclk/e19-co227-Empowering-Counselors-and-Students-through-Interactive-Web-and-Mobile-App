import 'package:bloomi_web/controllers/google_calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GoogleCalander extends StatefulWidget {
  const GoogleCalander({super.key});

  @override
  State<GoogleCalander> createState() => _GoogleCalanderState();
}

class _GoogleCalanderState extends State<GoogleCalander> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              Logger().i('Google Calander');
              GoogleCalendarController().getAuth;
            } catch (e) {
              Logger().e(e);
            }
          },
          child: const Text('Google Calander'),
        ),
      ),
    );
  }
}
