import 'package:bloomi_web/providers/admin/admin_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class TestingNavigator extends StatelessWidget {
  TestingNavigator({super.key});
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Consumer<AdminRegistrationProvider>(
          builder: (context, value, child) {
            // Return a widget from the builder function.
            return Container(
              height: 57,
              margin: const EdgeInsets.only(right: 30, left: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 80,
                    height: 50,
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
                    height: 10,
                  ),
                  Text(
                    value.adminModel!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UtilConstants.blackColor,

                      // Use Colors.black instead of UtilConstants.blackColor
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      //side bar widget,
    );
  }
}

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key, required controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.home, label: 'Home'),
      ],
    );
  }
}
