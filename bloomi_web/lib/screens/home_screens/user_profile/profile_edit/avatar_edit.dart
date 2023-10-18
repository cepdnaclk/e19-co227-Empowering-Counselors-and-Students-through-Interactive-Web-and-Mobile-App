import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/image_picker_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProfileImageUser extends StatelessWidget {
  const ProfileImageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<UserProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          CircleAvatar(
            radius: width < 480 ? 50 : 90,
            backgroundImage: NetworkImage(value.userModel!.imgUrl),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                dialogBox(context);
              },
              icon: const Icon(Icons.add_a_photo),
              color: UtilConstants.blackColor,
            ),
          ),
        ],
      );
    });
  }

  void dialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ImagePick(),
    );
  }
}
