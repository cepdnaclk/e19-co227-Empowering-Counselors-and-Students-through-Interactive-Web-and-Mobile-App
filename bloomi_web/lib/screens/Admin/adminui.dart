import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_activitylog.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_dashboard.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_home.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_navbar.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_panel_drawer.dart';
import 'package:bloomi_web/screens/Admin/screens/admin_setting.dart';
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final List<Widget> widget = [
      const AdminHome(),
      const AdminSetting(),
      const AdminDashboard(),
      const AdminActivityLog(),
    ];
    return Scaffold(
      appBar: (mediaQueryData.size.width <= 900)
          ? AppBar(
              iconTheme: const IconThemeData(color: UtilConstants.primaryColor),
              backgroundColor: UtilConstants.lightgreyColor,
              elevation: 0,
              centerTitle: true,
              title: CustomText("BLOOMI",
                  fontSize: mediaQueryData.size.width * 0.03,
                  fontWeight: FontWeight.w300,
                  fontColor: UtilConstants.primaryColor))
          : PreferredSize(
              preferredSize: Size(mediaQueryData.size.width, 70),
              child: const AdminNavBar(),
            ),
      body: Consumer<NavigationProvider>(
        builder: (context, value, child) {
          return widget[value.currentIndex];
        },
      ),
      drawer: const AdminPanelDrawer(),
      bottomNavigationBar: Footer(mediaQueryData: mediaQueryData),
    );
  }
}
