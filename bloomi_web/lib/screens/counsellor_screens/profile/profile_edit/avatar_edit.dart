import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/image_picker_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(UtilConstants.profImagePath),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              ImagePick();
            },
            icon: Icon(Icons.photo_camera),
            color: UtilConstants.blackColor,
          ),
        ),
      ],
    );
  }
}
