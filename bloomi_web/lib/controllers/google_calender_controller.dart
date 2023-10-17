import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';

class GoogleCalendarController {
  Future<CalendarApi?> getAuth() async {
    try {
      Logger().e("message");
      final clientId = ClientId(
        "277496527429-m3aiv2r6lou8p34m03i0htqd4vut3e39.apps.googleusercontent.com", // Replace with your client ID
        "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", // Replace with your client secret
      );

      Logger().e(clientId);
      final client = await clientViaUserConsent(clientId, [
        'https://www.googleapis.com/auth/calendar',
        'https://www.googleapis.com/auth/calendar.events'
      ], (url) {
        Logger().e("Please go to the following URL and grant access:");
        Logger().e("  $url");
      });

      Logger().e(client);

      final calendarApi = CalendarApi(client);
      final events = await calendarApi.events
          .list('primary'); // Add .execute() to await the result

      for (final event in events.items!) {
        Logger().e(event.summary);
      }
      return calendarApi;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
