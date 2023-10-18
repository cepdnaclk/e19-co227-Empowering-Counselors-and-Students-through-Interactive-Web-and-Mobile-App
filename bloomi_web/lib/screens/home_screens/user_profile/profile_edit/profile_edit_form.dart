import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_edit/edit_desktop.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_edit/edit_mobile.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_edit/edit_tablet.dart';
import 'package:flutter/material.dart';

class UserEditForm extends StatefulWidget {
  const UserEditForm({super.key});

  @override
  State<UserEditForm> createState() => _CounselorEditFormState();
}

class _CounselorEditFormState extends State<UserEditForm> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const ResponsiveLayout(
          mobileBody: EditMobileUser(),
          tabletBody: EditTabletUser(),
          desktopBody: EditDesktopUser()),
      bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
