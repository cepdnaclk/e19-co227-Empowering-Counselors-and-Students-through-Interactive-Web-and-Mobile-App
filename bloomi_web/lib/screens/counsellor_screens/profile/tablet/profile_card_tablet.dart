import 'package:bloomi_web/screens/counsellor_screens/profile/profile.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileCardTab extends StatelessWidget {
  const ProfileCardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
          color: UtilConstants.whiteColor,
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
