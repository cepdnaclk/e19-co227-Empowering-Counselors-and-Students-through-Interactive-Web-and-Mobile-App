import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return (mediaQueryData.size.width <= 900)
        ? Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(UtilConstants.profImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText("Sachith Dissanayaka",
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          fontColor: UtilConstants.blackColor),
                      const CustomText("sachithdissanayaka135@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          fontColor: UtilConstants.blackColor),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    // Handle Home button tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.approval),
                  title: const Text('Appointment'),
                  onTap: () {
                    // Handle Appointment button tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: const Text('Contact'),
                  onTap: () {
                    // Handle Contact button tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () {
                    // Handle Profile button tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle Home button tap
                  },
                ),
              ],
            ),
          )
        : Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(UtilConstants.profImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText("Sachith Dissanayaka",
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          fontColor: UtilConstants.blackColor),
                      const CustomText("sachithdissanayaka135@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          fontColor: UtilConstants.blackColor),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle Home button tap
                  },
                ),
              ],
            ),
          );
  }
}
