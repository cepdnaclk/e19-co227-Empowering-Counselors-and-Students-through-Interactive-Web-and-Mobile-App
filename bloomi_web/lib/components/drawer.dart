import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return (mediaQueryData.size.width <= 900)
        ? Consumer<UserProvider>(
            builder: (context, value, child) {
              return ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius
                child: Drawer(
                  clipBehavior: Clip.hardEdge,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: UtilConstants.primaryColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 78,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(value.userModel!.imgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              value.userModel!.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: UtilConstants.blackColor,
                              ),
                            ),
                            Text(
                              value.userModel!.email,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: UtilConstants.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.home,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(0);
                        },
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.approval,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Appointment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(1);
                        },
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.contact_mail,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(2);
                        },
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(3);
                        },
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.logout,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          AuthController.signOutUser();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Consumer<UserProvider>(
            builder: (context, value, child) {
              return ClipRRect(
                // Wrap the Drawer with ClipRRect
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius
                child: Drawer(
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
                              width: 80,
                              height: 78,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(value.userModel!.imgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              value.userModel!.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: UtilConstants.blackColor,
                              ),
                            ),
                            Text(
                              value.userModel!.email,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: UtilConstants.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.note_alt_outlined,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Note Take',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(4);
                        },
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: const Icon(
                          Icons.logout,
                          size: 24,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          AuthController.signOutUser();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
