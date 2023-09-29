import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/image_picker_panel.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounsellorRegistrationProvider>(
        builder: (context, value, child) {
      return Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(value.counsellorModel!.imgUrl),
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
