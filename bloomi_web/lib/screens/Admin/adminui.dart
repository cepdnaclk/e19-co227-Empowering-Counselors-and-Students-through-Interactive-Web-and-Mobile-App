//import 'package:bloomi_web/components/background_color_gradient.dart';
// import 'package:bloomi_web/components/custom_text.dart';
// import 'package:bloomi_web/components/drawer.dart';
// import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/providers/nav_provider/admin_nav_provider.dart';
import 'package:bloomi_web/screens/Admin/admin_control.dart';
import 'package:bloomi_web/screens/Admin/admin_dashboard.dart';
import 'package:bloomi_web/screens/Admin/admin_home.dart';
import 'package:bloomi_web/screens/Admin/admin_profile.dart';
import 'package:bloomi_web/screens/Admin/admin_progress.dart';
import 'package:bloomi_web/screens/Admin/admin_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({Key? key}) : super(key: key);

  @override
  State<Adminpanel> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<Adminpanel> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widget = [
      const AdminHome(),
      const AdminDashboard(),
      const AdminProgress(),
      const AdminControl(),
      const AdminProfile(),
      const AdminSetting(),
    ];
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: Column(
          children: [
            //BackgroundColorGradient(),
            TabBar(
              labelColor: Colors.black,
              dividerColor: const Color.fromARGB(255, 146, 192, 230),
              tabs: [
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(0);
                  },
                  child: const Tab(
                    text: ('Home'),
                    icon: Icon(Icons.home),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(1);
                  },
                  child: const Tab(
                    text: 'Dashboard',
                    icon: Icon(Icons.dashboard),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(2);
                  },
                  child: const Tab(
                    text: 'Progress',
                    icon: Icon(Icons.add_chart),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(3);
                  },
                  child: const Tab(
                    text: 'Controls',
                    icon: Icon(Icons.add_card_sharp),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(4);
                  },
                  child: const Tab(
                    text: 'Profile',
                    icon: Icon(Icons.person),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AdminNavProvider>(context, listen: false)
                        .setIndex(5);
                  },
                  child: const Tab(
                    text: 'Settings',
                    icon: Icon(Icons.settings),
                  ),
                ),
              ],
            ),
            Consumer<AdminNavProvider>(
              builder: (context, value, child) {
                int key = value.getIndex;
                // Build your UI using the key variable.
                return widget[key];
              },
            )
          ],
        ),
      ),
    );
  }
}
