import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/desktop/profile_desktop_screen.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/mobile/profile_mobile_screen.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/tablet/profile_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProfileHomeCounsellor extends StatefulWidget {
  const ProfileHomeCounsellor({super.key});

  @override
  State<ProfileHomeCounsellor> createState() => _ProfileHomeCounsellorState();
}

class _ProfileHomeCounsellorState extends State<ProfileHomeCounsellor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: ProfileMobileScreen(),
          tabletBody: ProfileTabletScreen(),
          desktopBody: ProfileDesktopScreen()),
    );
  }
}
