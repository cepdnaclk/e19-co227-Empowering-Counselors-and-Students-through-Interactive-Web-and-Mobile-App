import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/mobile/profile_panel_mobile.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({super.key});

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
                  ProfilePanleMobile(),
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
