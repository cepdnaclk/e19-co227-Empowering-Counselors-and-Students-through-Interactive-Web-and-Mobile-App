import 'package:flutter/material.dart';
import 'package:bloomi_web/responsive/responsive_layout.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile.dart';
import 'package:bloomi_web/utils/util_constant.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    /// card
    return Container(
      width: _width,
      margin: const EdgeInsets.only(top: 70),
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
      child: CounselorProfile(),
    );
  }
}
