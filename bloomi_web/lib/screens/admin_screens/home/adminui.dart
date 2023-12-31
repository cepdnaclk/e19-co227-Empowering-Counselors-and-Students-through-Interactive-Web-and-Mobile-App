import 'package:bloomi_web/components/dropdown_menu_items.dart';
import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/admin_control.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/counselor_control.dart';
import 'package:bloomi_web/screens/admin_screens/admin_table/students_control.dart';
import 'package:bloomi_web/screens/admin_screens/home/admin_home.dart';
import 'package:bloomi_web/screens/admin_screens/log_activity/admin_activitylog.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class AdminPanel extends StatelessWidget {
  AdminPanel({super.key});

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
              title: const Text('BLOOMI',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: UtilConstants.whiteColor,
                ),
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: canvasColor,
              title: Row(
                children: [
                  Image.asset(
                    UtilConstants.primaryImagePath,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'BLOOMI',
                    style: TextStyle(
                      color: UtilConstants.contentColorCyan,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    // UserNotification.showDialogMethod(context);
                  },
                  child: Stack(
                    children: [
                      const Icon(Icons.notifications,
                          size: 24, color: Colors.white),
                      Positioned(
                        right: -0.6,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Consumer<AdminRegistrationProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              color: canvasColor,
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(value.adminModel!.imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 24,
                            child: DropDownMenuItems(
                              icon: Icons.arrow_drop_down,
                              name: value.adminModel!.name,
                              widget: AdminPanel(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10)
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
    super.key,
    required SidebarXController controller,
  })  : _controller = controller;

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
      items: const [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
        ),
        SidebarXItem(
          icon: Icons.person_2_outlined,
          label: 'Student',
        ),
        SidebarXItem(
          icon: Icons.people,
          label: 'Counselor',
        ),
        SidebarXItem(
          icon: Icons.admin_panel_settings_outlined,
          label: 'Admin',
        ),
        SidebarXItem(
          icon: Icons.access_time,
          label: 'Activity Log',
        ),
        // SidebarXItem(
        //     icon: Icons.logout,
        //     label: 'Sign Out',
        //     onTap: () {
        //       UtilMethod.customDialogBox(
        //         context,
        //         'Sign Out',
        //         'Do you Want to Sign Out?',
        //         onOkPressed: () {
        //           AuthController.signOutUser();
        //         },
        //         onCancelPressed: () {},
        //       );
        //     }),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    required this.controller,
  });

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
