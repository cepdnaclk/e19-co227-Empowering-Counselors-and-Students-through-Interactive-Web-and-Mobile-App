import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_activitylog.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_dashboard.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_navbar.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_panel_drawer.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_setting.dart';
import 'package:bloomi_web/screens/Admin/screens/counselor_control.dart';
import 'package:bloomi_web/screens/Admin/screens/students_control.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({Key? key}) : super(key: key);

  @override
  State<Adminpanel> createState() => _AdminpanelState();
}

class _AdminpanelState extends State<Adminpanel> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List<Widget> widget = [
      const AdminDashboard(),
      const StudentControl(),
      const Counselorcontrol(),
      const AdminActivityLog(),
      const AdminSetting(),
    ];
    return Scaffold(
      appBar: (width <= 900)
          ? AppBar(
              iconTheme: const IconThemeData(color: UtilConstants.primaryColor),
              backgroundColor: UtilConstants.lightgreyColor,
              elevation: 0,
              centerTitle: true,
              title: CustomText("BLOOMI",
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w300,
                  fontColor: UtilConstants.primaryColor))
          : PreferredSize(
              preferredSize: Size(width, 70),
              child: const AdminNavBar(),
            ),
      body: Consumer<NavigationProvider>(
        builder: (context, value, child) {
          return widget[value.currentIndex];
        },
      ),
      drawer: const AdminPanelDrawer(),
      bottomNavigationBar: Footer(height: height, width: width),
    );
  }
}
