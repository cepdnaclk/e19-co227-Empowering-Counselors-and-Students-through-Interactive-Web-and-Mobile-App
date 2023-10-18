import 'package:bloomi_web/screens/counsellor_screens/profile/profile.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    /// card
    return Container(
      width: width / 3,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      padding: EdgeInsets.fromLTRB(
          10, MediaQuery.of(context).size.width < 450 ? 80 : 20, 10, 10),
      decoration: BoxDecoration(
          color: UtilConstants.tropicalBlurColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: UtilConstants.blackColor.withOpacity(.1),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: const CounselorProfile(),
    );
  }
}
