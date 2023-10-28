import 'package:bloomi_web/screens/counsellor_screens/profile/desktop/profile_card.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/avatar_edit.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfilePanleMobile extends StatelessWidget {
  const ProfilePanleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    //bool isMobile = MediaQuery.of(context).size.width < 480 ? true : false;
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;

    /*margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10,
          isMobile ? 10 : 10, isMobile ? 15 : width / 10, 10),*/
    return Container(
      height: hight * 0.7,
      width: width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            UtilConstants.canvasColor,
            const Color.fromARGB(255, 167, 167, 188)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(alignment: Alignment.center, child: const ProfileImage()),
          const ProfileCard(),
        ],
      ),
    );
  }
}
