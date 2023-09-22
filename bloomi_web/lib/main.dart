import 'package:bloomi_web/firebase_options.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/auth/forgot_password_provider.dart';
import 'package:bloomi_web/providers/auth/google_auth_provider.dart';
import 'package:bloomi_web/providers/auth/login_provider.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/providers/nav_provider/admin_nav_provider.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/note_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/providers/user_home_provider/user_chat.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/splash_screen/splash_desktop.dart';
import 'package:bloomi_web/screens/splash_screen/splash_mobile.dart';
import 'package:bloomi_web/screens/splash_screen/splash_tablet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => SignupProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
      ChangeNotifierProvider(create: (_) => AdminNavProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CounselorRegistrationProvider()),
      ChangeNotifierProvider(create: (_) => UserChatProvider()),
      ChangeNotifierProvider(create: (_) => GoogleAuthProviders()),
      ChangeNotifierProvider(create: (_) => UserAppoinmentProvider()),
      ChangeNotifierProvider(create: (_) => AdminRegistrationProvider()),
      ChangeNotifierProvider(create: (_) => NoteProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
        title: 'BLOOMi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ResponsiveLayout(
          mobileBody: SplashScreenMobile(),
          tabletBody: SplashScreenTablet(),
          desktopBody: SplashDesktop(),
        ));
  }
}
