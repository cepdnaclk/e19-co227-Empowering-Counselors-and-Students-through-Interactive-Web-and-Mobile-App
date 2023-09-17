import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/profile_edit_form.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';

class CounselorProfile extends StatefulWidget {
  CounselorProfile({Key? key}) : super(key: key);

  @override
  State<CounselorProfile> createState() => _CounselorProfileState();
}

class _CounselorProfileState extends State<CounselorProfile> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  Map profileDetails = {
    "name": "Dr Udayakumara",
    "Email": "johndoe@example.com",
    "PhoneNumber": "0771234567",
    "Faculty": "Engineering",
    "Department": "Computer Engineering",
    "Credentials": "Senior Lecture",
    "imageUrl": "assets/images/profileimage.webp",
  };
  List<String> keys = [];
  List values = [];
  late int len;
  @override
  void initState() {
    super.initState();

    for (var entry in profileDetails.entries) {
      final key = entry.key;
      final value = entry.value;

      keys.add(key);
      values.add(value);
    }

    len = keys.length;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.01,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: width * 0.02,
          left: height * 0.02,
          right: height * 0.02,
          top: height * 0.01,
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            UtilConstants.primaryColor),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return UtilConstants.primaryColor
                                  .withOpacity(0.04);
                            }
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return UtilConstants.primaryColor
                                  .withOpacity(0.12);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        UtilFunction.navigateForward(
                          context,
                          const CounselorEditForm(),
                        );
                      },
                      child: const Text('Edit'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileDetails['name'],
                        style: TextStyle(
                          fontSize: width > 750 ? 20 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      for (int x = 1; x < len - 1; x++)
                        Row(
                          children: [
                            Text(
                              keys[x],
                              style: TextStyle(fontSize: width > 750 ? 16 : 12),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ":",
                              style: TextStyle(fontSize: width > 750 ? 16 : 12),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              values[x],
                              style: TextStyle(fontSize: width > 750 ? 16 : 12),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
