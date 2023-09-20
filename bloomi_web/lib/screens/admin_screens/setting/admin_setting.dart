import 'package:bloomi_web/components/custom_button.dart';
import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class AdminSetting extends StatefulWidget {
  const AdminSetting({super.key});

  @override
  State<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                AuthController.signOutUser();
              },
              child: CustomButton(
                "Admin Logout",
                width: 250,
                height: 50,
                onPressed: () {
                  AuthController.signOutUser();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
