import 'package:bloomi_web/screens/Admin/screens/admin_control.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_dashboard.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_home.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_profile.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_progress.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_setting.dart';
import 'package:flutter/material.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({super.key});

  @override
  State<Adminpanel> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Adminpanel> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(labelColor: Colors.black, tabs: [
                Tab(
                  text: 'Home',
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: 'Dashboard',
                  icon: Icon(Icons.dashboard),
                ),
                Tab(
                  text: 'Progress',
                  icon: Icon(Icons.add_chart),
                ),
                Tab(
                  text: 'Profile',
                  icon: Icon(Icons.person_2),
                ),
                Tab(
                  text: 'Controls',
                  icon: Icon(Icons.add_card_sharp),
                ),
                Tab(
                  text: 'Settings',
                  icon: Icon(Icons.settings),
                ),
              ]),
              Expanded(
                  child: TabBarView(
                children: [
                  AdminHome(),
                  AdminDashboard(),
                  AdminProgress(),
                  AdminControl(),
                  AdminProfile(),
                  AdminSetting(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
