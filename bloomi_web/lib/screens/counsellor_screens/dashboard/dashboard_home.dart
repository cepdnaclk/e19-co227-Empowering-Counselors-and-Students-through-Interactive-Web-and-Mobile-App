import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/desktop.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/mobile_dashboard.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/tablet_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: DashboardMobile(),
          tabletBody: DashboardTablet(),
          desktopBody: Desktop()),
    );
  }
}
