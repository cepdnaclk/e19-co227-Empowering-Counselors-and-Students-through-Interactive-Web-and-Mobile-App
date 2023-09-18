import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_card.dart';

class ProfilePanle extends StatelessWidget {
  const ProfilePanle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 450 ? true : false;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 15 : _width / 10,
          isMobile ? 0 : 150, isMobile ? 15 : _width / 10, 10),
      child: Stack(
        children: [
          const ProfileCard(),
          Expanded(
              child:
                  Container(alignment: Alignment.center, child: ProfileImage()))
        ],
      ),
    );
  }

  Widget ProfileImage() => const CircleAvatar(
      radius: 70, backgroundImage: AssetImage(UtilConstants.profImagePath));
}
