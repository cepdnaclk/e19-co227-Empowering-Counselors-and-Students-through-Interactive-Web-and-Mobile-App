import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/home_screens/user_profile/profile_edit/profile_edit_form.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<String> keys = [];
  final List values = [];
  late int len;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      Map<String, dynamic> profileDetails = {
        "name": value.userModel!.name,
        "Email": value.userModel!.email,
        "PhoneNumber": value.userModel!.phone,
        "Faculty": value.userModel!.faculty,
        "Credentials": value.userModel!.userCredential,
        "imageUrl": value.userModel!.imgUrl,
      };

      for (var entry in profileDetails.entries) {
        final key = entry.key;
        final value = entry.value;

        keys.add(key);
        values.add(value);
      }

      len = keys.length;

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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
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
                            const UserEditForm(),
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
                              fontSize: width > 750 ? 20 : 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    keys[1],
                                    style: TextStyle(
                                        fontSize: width > 750 ? 16 : 12),
                                  ),
                                  width > 750
                                      ? const SizedBox(width: 74)
                                      : const SizedBox(width: 60),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(" :   " + values[1],
                                      style: TextStyle(
                                          fontSize: width > 750 ? 16 : 12)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(keys[2],
                                      style: TextStyle(
                                          fontSize: width > 750 ? 16 : 12)),
                                  const SizedBox(width: 10),
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " :   " + values[2],
                                    style: TextStyle(
                                        fontSize: width > 750 ? 16 : 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(keys[3],
                                      style: TextStyle(
                                          fontSize: width > 750 ? 16 : 12)),
                                  width > 750
                                      ? const SizedBox(width: 62)
                                      : const SizedBox(width: 49),
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " :   " + values[3],
                                    style: TextStyle(
                                        fontSize: width > 750 ? 16 : 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(keys[4],
                                      style: TextStyle(
                                          fontSize: width > 750 ? 16 : 12)),
                                  width > 750
                                      ? const SizedBox(width: 31)
                                      : const SizedBox(width: 26),
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " :   " + values[4],
                                    style: TextStyle(
                                        fontSize: width > 750 ? 16 : 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(keys[4],
                                      style: TextStyle(
                                          fontSize: width > 750 ? 16 : 12)),
                                  width > 750
                                      ? const SizedBox(width: 31)
                                      : const SizedBox(width: 26),
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    " :   " + values[4],
                                    style: TextStyle(
                                        fontSize: width > 750 ? 16 : 12),
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
          ),
        ),
      );
    });
  }
}
