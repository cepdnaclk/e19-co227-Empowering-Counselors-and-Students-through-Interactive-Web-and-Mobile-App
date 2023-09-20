import 'package:bloomi_web/screens/counsellor_screens/profile/profile_panel.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/top_background.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        /// background color
        backgroundColor: UtilConstants.whiteColor,

        /// if is it Mobile. don't use SafeArea
        body: SafeArea(
            child: Stack(children: [
          TopBackground(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePanle(),
                ]),
          )
        ])));
  }
}
