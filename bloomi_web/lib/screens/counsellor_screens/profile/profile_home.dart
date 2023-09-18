import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_mobile_screen.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_tab_desktop.dart';

import 'package:flutter/material.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: ProfileMobileScreen(),
          tabletBody: ProfileTabDesktopScreen(),
          desktopBody: ProfileTabDesktopScreen()),
    );
  }
}
