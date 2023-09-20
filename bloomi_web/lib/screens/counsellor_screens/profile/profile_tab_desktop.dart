import 'package:bloomi_web/screens/counsellor_screens/profile/profile_panel.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/top_background.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileTabDesktopScreen extends StatelessWidget {
  const ProfileTabDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        /// background color
        backgroundColor: UtilConstants.whiteColor,
        body: Stack(children: [
          TopBackground(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePanle(),
                ]),
          )
        ]));
  }
}
