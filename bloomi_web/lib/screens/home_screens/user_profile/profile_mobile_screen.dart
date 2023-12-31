import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileMobileScreenUser extends StatelessWidget {
  const ProfileMobileScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilConstants.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            //const TopBackground(),
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }
}
