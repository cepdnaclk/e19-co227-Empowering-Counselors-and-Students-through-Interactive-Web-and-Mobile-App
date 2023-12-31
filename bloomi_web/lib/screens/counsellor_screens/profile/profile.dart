import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/profile/profile_edit/profile_edit_form.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounselorProfile extends StatefulWidget {
  const CounselorProfile({super.key});

  @override
  State<CounselorProfile> createState() => _CounselorProfileState();
}

class _CounselorProfileState extends State<CounselorProfile> {
  final List<String> keys = [];
  final List values = [];
  late int len;

  @override
  Widget build(BuildContext context) {
    /*return Consumer<UserProvider>(builder: (context, value, child) {
      Map<String, dynamic> profileDetails = {
        "name": value.userModel!.name,
        "Email": value.userModel!.email,
        "PhoneNumber": value.userModel!.phone,
        "Faculty": value.userModel!.faculty,
        "Credentials": value.userModel!.userCredential,
        "imageUrl": value.userModel!.imgUrl,
      };*/

    return Consumer2<CounsellorRegistrationProvider, UserProvider>(
        builder: (context, value1, value2, child) {
      Map<String, dynamic> profileDetails;

      if (value1.userType == "Counselor") {
        profileDetails = {
          "name": value1.counsellorModel!.name,
          "Email": value1.counsellorModel!.email,
          "PhoneNumber": value1.counsellorModel!.phone,
          "Faculty": value1.counsellorModel!.faculty,
          "Credentials": value1.counsellorModel!.userCredential,
          "imageUrl": value1.counsellorModel!.imgUrl,
        };
      } else if (value2.userModel!.userType == "User") {
        profileDetails = {
          "name": value2.userModel!.name,
          "Email": value2.userModel!.email,
          "PhoneNumber": value2.userModel!.phone,
          "Faculty": value2.userModel!.faculty,
          "Credentials": value2.userModel!.userCredential,
          "imageUrl": value2.userModel!.imgUrl,
        };
      } else {
        profileDetails = {
          "name": "",
          "Email": "",
          "PhoneNumber": "",
          "Faculty": "",
          "Credentials": "",
          "imageUrl": "",
        };
      }

      for (var entry in profileDetails.entries) {
        final key = entry.key;
        final value = entry.value;

        keys.add(key);
        values.add(value);
      }

      len = keys.length;

      final MediaQueryData mediaQueryData = MediaQuery.of(context);

      var width = mediaQueryData.size.width;
      double size = width > 750
          ? 16
          : (width > 450 ? 13 : 12); //fontSize for display details

      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                            return UtilConstants.primaryColor.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return UtilConstants.primaryColor.withOpacity(0.12);
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileDetails['name'],
                        style: TextStyle(
                          fontSize: width > 750 ? 20 : (width > 450 ? 15 : 14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                keys[1],
                                style: TextStyle(
                                    fontSize: size,
                                    fontWeight: FontWeight.bold),
                              ),
                              width > 750
                                  ? const SizedBox(width: 74)
                                  : const SizedBox(width: 61),
                              // ignore: prefer_interpolation_to_compose_strings
                              Text(" :   " + values[1],
                                  style: TextStyle(fontSize: size)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(keys[2],
                                  style: TextStyle(
                                      fontSize: size,
                                      fontWeight: FontWeight.bold)),
                              width > 750
                                  ? const SizedBox(width: 10)
                                  : const SizedBox(width: 6),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                " :   " + values[2],
                                style: TextStyle(fontSize: size),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(keys[3],
                                  style: TextStyle(
                                      fontSize: size,
                                      fontWeight: FontWeight.bold)),
                              width > 750
                                  ? const SizedBox(width: 62)
                                  : const SizedBox(width: 50),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                " :   " + values[3],
                                style: TextStyle(fontSize: size),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(keys[4],
                                  style: TextStyle(
                                      fontSize: size,
                                      fontWeight: FontWeight.bold)),
                              width > 750
                                  ? const SizedBox(width: 31)
                                  : const SizedBox(width: 26),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                " :   " + values[4],
                                style: TextStyle(fontSize: size),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
