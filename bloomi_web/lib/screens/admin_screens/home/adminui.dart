import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/admin_control.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/counselor_control.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/students_control.dart';
import 'package:bloomi_web/screens/admin_screens/home/admin_home.dart';
import 'package:bloomi_web/screens/admin_screens/log_activity/admin_activitylog.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class AdminPanel extends StatelessWidget {
  AdminPanel({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: const Text('BLOOMI'),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: canvasColor,
              title: const Text(
                'BLOOMI',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: white,
                  ),
                ),
                const SizedBox(width: 10),
                Consumer<AdminRegistrationProvider>(
                  builder: (context, value, child) {
                    // Return a widget from the builder function.
                    return Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(value.adminModel!.imgUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          value.adminModel!.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: UtilConstants.whiteColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
                const SizedBox(width: 5),
              ],
            ),
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: UtilConstants.greyColor,

        // hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),

        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, backgroundcolor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        padding: EdgeInsets.only(top: 30),
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      items: [
        const SidebarXItem(
          icon: Icons.home,
          label: 'Home',
        ),
        const SidebarXItem(
          icon: Icons.person_2_outlined,
          label: 'Student',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Counselor',
        ),
        const SidebarXItem(
          icon: Icons.admin_panel_settings_outlined,
          label: 'Admin',
        ),
        const SidebarXItem(
          icon: Icons.access_time,
          label: 'Activity Log',
        ),
        SidebarXItem(
            icon: Icons.logout,
            label: 'Sign Out',
            onTap: () {
              UtilMethod.customDialogBox(
                context,
                'Sign Out',
                'Do you Want to Sign Out?',
                onOkPressed: () {
                  AuthController.signOutUser();
                },
                onCancelPressed: () {},
              );
            }),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const AdminHome();
          case 1:
            return const StudentControl();
          case 2:
            return const Counselorcontrol();
          case 3:
            return const AdminControl();
          case 4:
            return const AdminActivityLog();

          default:
            return const Text('');
        }
      },
    );
  }
}

const primaryColor = Color(0xFF2E2E48);
const canvasColor = Color(0xFF272643);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color.fromARGB(255, 50, 50, 132).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
const backgroundcolor = Color.fromARGB(33, 50, 22, 172);
