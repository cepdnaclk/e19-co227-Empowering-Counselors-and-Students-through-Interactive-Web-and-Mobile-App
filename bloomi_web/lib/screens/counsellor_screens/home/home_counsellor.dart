import 'package:bloomi_web/components/dropdown_menu_items.dart';
import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/chat/home/chat_counsellor.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/dashboard_home.dart';
import 'package:bloomi_web/screens/counsellor_screens/home/notification_viewer.dart.dart';
import 'package:bloomi_web/screens/counsellor_screens/note/note.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_home.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeCounsellor extends StatelessWidget {
  HomeCounsellor({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 1000;
    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: Row(
                children: [
                  Image.asset(
                    UtilConstants.primaryImagePath,
                    height: 32,
                    width: 32,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'BLOOMI',
                    style: TextStyle(
                      color: UtilConstants.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: UtilConstants.whiteColor,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    UtilFormMethodNotification.showDialogMethod(context);
                  },
                  child: Stack(
                    children: [
                      const Icon(Icons.notifications,
                          size: 22, color: Colors.white),
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
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    UtilFunction.navigateForward(
                        context, const ChatCounsellor());
                  },
                  child: Stack(
                    children: [
                      const Icon(Icons.message, size: 22, color: Colors.white),
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
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Consumer<CounsellorRegistrationProvider>(
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
                                image:
                                    NetworkImage(value.counsellorModel!.imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            width: 28,
                            height: 28, // Adjust the width to your preference.
                          ),
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            width: 23,
                            height: 23, // Adjust the width to your preference.
                            child: DropDownMenuItems(
                              icon: Icons.arrow_drop_down,
                              name: value.counsellorModel!.name,
                              widget: const ProfileHomeCounsellor(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10)
              ],
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
                      color: UtilConstants.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    UtilFormMethodNotification.showDialogMethod(context);
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
                InkWell(
                  onTap: () {
                    UtilFunction.navigateForward(
                        context, const ChatCounsellor());
                  },
                  child: Stack(
                    children: [
                      const Icon(Icons.message, size: 24, color: Colors.white),
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
                Consumer<CounsellorRegistrationProvider>(
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
                                image:
                                    NetworkImage(value.counsellorModel!.imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            width: 32,
                            height: 32, // Adjust the width to your preference.
                          ),
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            width: 26,
                            height: 26, // Adjust the width to your preference.
                            child: DropDownMenuItems(
                              icon: Icons.arrow_drop_down,
                              name: value.counsellorModel!.name,
                              widget: const ProfileHomeCounsellor(),
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
          isSmallScreen
              ? const SizedBox()
              : ExampleSidebarX(controller: _controller),
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
          color: UtilConstants.canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: UtilConstants.scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: UtilConstants.canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: UtilConstants.actionColor.withOpacity(0.37),
          ),
          gradient: LinearGradient(
            colors: [UtilConstants.canvasColor, UtilConstants.whiteColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            ),
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
      extendedTheme: SidebarXTheme(
        padding: const EdgeInsets.only(top: 10),
        width: 200,
        decoration: BoxDecoration(
          color: UtilConstants.canvasColor,
        ),
      ),
      // footerDivider: UtilConstants.divider,
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {},
        ),
        const SidebarXItem(
          icon: Icons.note_add,
          label: 'Note',
        ),
        const SidebarXItem(
          icon: Icons.person_2_outlined,
          label: 'Profile',
        ),
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
            return const DashboardHome();

          case 1:
            return const NoteCounsellor();

          case 2:
            return const ProfileHomeCounsellor();

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
final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);
