import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import 'package:http/http.dart' show BaseRequest, Response;
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' show IOClient, IOStreamedResponse;
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class GoogleCalender extends StatefulWidget {
  const GoogleCalender({super.key});

  @override
  State<GoogleCalender> createState() => _GoogleCalenderState();
}

class _GoogleCalenderState extends State<GoogleCalender> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '277496527429-m3aiv2r6lou8p34m03i0htqd4vut3e39.apps.googleusercontent.com',
    scopes: <String>[GoogleAPI.CalendarApi.calendarScope],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {}
    });
    _googleSignIn.signInSilently();
  }

  Future<List<GoogleAPI.Event>?> getGoogleEventsData() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      Logger().e(googleUser);
      // final GoogleAPIClient httpClient =
      //     GoogleAPIClient(await googleUser!.authHeaders);
      Uri uri = Uri.parse("http://localhost:56703/");
      final Map<String, String> headers = await googleUser!.authHeaders;
      const String apiKey = 'AIzaSyC3dp2eVve96PWs_5RIXqRaNV96ifE9hdQ';

      final http.Client httpClient = http.Client();
      headers['Authorization'] = 'Bearer $apiKey';

      headers.forEach((key, value) {
        httpClient.head(uri, headers: <String, String>{key: value});
      });

      Logger().e(httpClient);

      final GoogleAPI.CalendarApi calendarApi =
          GoogleAPI.CalendarApi(httpClient);
      final GoogleAPI.Events calEvents = await calendarApi.events.list(
        "primary",
      );

      Logger().e(calEvents.items);
      Logger().e("Hiiiii");
      final List<GoogleAPI.Event> appointments = <GoogleAPI.Event>[];
      if (calEvents.items != null) {
        for (int i = 0; i < calEvents.items!.length; i++) {
          final GoogleAPI.Event event = calEvents.items![i];
          if (event.start == null) {
            continue;
          }
          appointments.add(event);
        }
      }

      return appointments;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getGoogleEventsData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Stack(
            children: [
              SfCalendar(
                view: CalendarView.month,
                initialDisplayDate: DateTime(2020, 7, 15, 9, 0, 0),
                dataSource: GoogleDataSource(events: snapshot.data),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
              snapshot.data != null
                  ? Container()
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_googleSignIn.currentUser != null) {
      _googleSignIn.disconnect();
      _googleSignIn.signOut();
    }

    super.dispose();
  }
}

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({required List<GoogleAPI.Event>? events}) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.endTimeUnspecified != null && event.endTimeUnspecified!
        ? (event.start?.date ?? event.start!.dateTime!.toLocal())
        : (event.end?.date != null
            ? event.end!.date!.add(const Duration(days: -1))
            : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location ?? '';
  }

  @override
  String getNotes(int index) {
    return appointments![index].description ?? '';
  }

  @override
  String getSubject(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.summary == null || event.summary!.isEmpty
        ? 'No Title'
        : event.summary!;
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url,
          headers: (headers != null ? (headers..addAll(_headers)) : headers));
}
