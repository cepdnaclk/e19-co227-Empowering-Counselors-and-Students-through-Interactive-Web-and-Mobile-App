import 'package:bloomi_web/screens/home_screens/user_profile/profile_card.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_edit/avatar_edit.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfilePanle extends StatelessWidget {
  const ProfilePanle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 480 ? true : false;
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10,
          isMobile ? 10 : 10, isMobile ? 15 : width / 10, 10),
      child: Container(
        height: hight * 0.8,
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              UtilConstants.canvasColor,
              UtilConstants.greyColor
            ], // Customize the colors as desired
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center, child: const ProfileImageUser()),
            const ProfileCard(),
          ],
        ),
      ),
    );
  }
}
