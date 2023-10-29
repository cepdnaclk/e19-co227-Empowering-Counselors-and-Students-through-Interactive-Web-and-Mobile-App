import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_mobile_screen.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_tab_desktop.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/tablet/profile_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProfileHomeUser extends StatefulWidget {
  const ProfileHomeUser({super.key});

  @override
  State<ProfileHomeUser> createState() => _ProfileHomeUserState();
}

class _ProfileHomeUserState extends State<ProfileHomeUser> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: ProfileMobileScreenUser(),
          tabletBody: ProfileTabletScreenUser(),
          desktopBody: ProfileDesktopScreenUser()),
    );
  }
}
