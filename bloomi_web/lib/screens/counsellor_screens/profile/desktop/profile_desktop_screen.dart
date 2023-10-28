import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/desktop/profile_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileDesktopScreen extends StatelessWidget {
  const ProfileDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilConstants.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfilePanle(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Footer(height: 55, width: width),
          ),
        ],
      ),
      //bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
