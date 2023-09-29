import 'package:bloomi_web/screens/counsellor_screens/profile/profile_card.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/avatar_edit.dart';
import 'package:flutter/material.dart';

class ProfilePanle extends StatelessWidget {
  const ProfilePanle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 480 ? true : false;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10,
          isMobile ? 100 : 150, isMobile ? 15 : width / 10, 10),
      child: Stack(
        children: [
          const ProfileCard(),
          Expanded(
              child: Container(
                  alignment: Alignment.center, child: const ProfileImage()))
        ],
      ),
    );
  }
}
