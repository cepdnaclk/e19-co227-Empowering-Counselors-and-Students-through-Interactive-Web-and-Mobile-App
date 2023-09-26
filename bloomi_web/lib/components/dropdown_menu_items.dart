import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownMenuItems extends StatefulWidget {
  const DropDownMenuItems({super.key, required this.icon});

  final IconData icon;

  @override
  State<DropDownMenuItems> createState() => _DropDownMenuItemsState();
}

class _DropDownMenuItemsState extends State<DropDownMenuItems> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          widget.icon,
          size: 25,
          color: UtilConstants.whiteColor,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UtilConstants.whiteColor,
          ),
          offset: const Offset(20, -10),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            5,
            ...List<double>.filled(MenuItems.secondItems.length, 58),
          ],
          padding: const EdgeInsets.only(left: 20, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Sachith Dissanayaka');
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: UtilConstants.blackColor, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: UtilConstants.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.logout:
        AuthController.signOutUser();
        break;
    }
  }
}
