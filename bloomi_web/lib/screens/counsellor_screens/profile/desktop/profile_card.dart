import 'package:bloomi_web/screens/counsellor_screens/profile/profile.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    /// card
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: width / 3,
        //margin: const EdgeInsets.symmetric( vertical: 40),
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
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
      ),
    );
  }
}
