import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

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
