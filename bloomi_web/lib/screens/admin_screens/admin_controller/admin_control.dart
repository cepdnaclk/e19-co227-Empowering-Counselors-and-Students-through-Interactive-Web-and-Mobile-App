import 'package:bloomi_web/screens/admin_screens/registration%20_forms/studentform.dart';
import 'package:flutter/material.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({super.key});

  @override
  State<AdminControl> createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Studentform(mediaQueryData: mediaQueryData),
    );
  }
}
