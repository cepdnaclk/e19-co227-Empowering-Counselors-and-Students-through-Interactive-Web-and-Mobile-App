// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleapis/calendar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';

// class GoogleCalendar {
//   final FirebaseAuth _auth;
//   final GoogleSignIn _googleSignIn;
//   final CalendarApi _calendarApi;

//   GoogleCalendar(this._auth, this._googleSignIn, this._calendarApi);

//   factory GoogleCalendar.withNoValue() {
//     final auth = FirebaseAuth.instance;
//     final googleSignIn = GoogleSignIn.standard();
//     final calendarApi =  CalendarApi(await clientViaApplicationDefaultCredentials(scopes: []));

//     return GoogleCalendar(auth, googleSignIn, calendarApi);
//   }

//   Future<void> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await _auth.signInWithCredential(credential);
//     }
//   }

//   Future<String> _getClientId() async {
//     return "";
//   }

//   Future<String> _getClientSecret() async {
//     return "";
//   }

//   Future<List<Event>?> listUpcomingEvents() async {
//     final request = _calendarApi.events.list(
//       'primary',
//       timeMin: (DateTime.now()),
//       showDeleted: false,
//       singleEvents: true,
//       maxResults: 10,
//       orderBy: 'startTime',
//     );

//     final response = await request;

//     final events = response.items;
//     return events;
//   }
// }