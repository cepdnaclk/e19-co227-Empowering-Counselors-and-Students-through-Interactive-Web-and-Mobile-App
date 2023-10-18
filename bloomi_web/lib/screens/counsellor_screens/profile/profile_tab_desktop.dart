import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileTabDesktopScreen extends StatelessWidget {
  const ProfileTabDesktopScreen({super.key});

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
                //TopBackground(),
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
