import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_panel.dart';

import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileTabDesktopScreenUser extends StatelessWidget {
  const ProfileTabDesktopScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilConstants.whiteColor,
      body: Column(
        children: [
          const Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePanle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Footer(height: 55, width: width),
        ],
      ),
    );
  }
}
