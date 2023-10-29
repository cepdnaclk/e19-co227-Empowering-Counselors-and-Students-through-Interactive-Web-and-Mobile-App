import 'package:bloomi_web/controllers/auth_controller.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:bloomi_web/utils/util_function.dart';
import 'package:bloomi_web/utils/util_method.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownMenuItems extends StatefulWidget {
  const DropDownMenuItems({
    super.key,
    required this.icon,
    required this.name,
    required this.widget,
  });

  final IconData icon;
  final String name;
  final Widget widget;

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
          color: UtilConstants.blackColor,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: MenuItems.buildItem(widget.name),
            ),
          ),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.thirdItems.map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(
            context,
            value! as String,
            widget.widget,
          );
        },
        dropdownStyleData: DropdownStyleData(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: UtilConstants.whiteColor,
          ),
          offset: const Offset(-190, -4),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 38),
            ...List<double>.filled(MenuItems.secondItems.length, 38),
            5,
            ...List<double>.filled(MenuItems.thirdItems.length, 58),
          ],
          padding: const EdgeInsets.only(left: 20, right: 16),
        ),
      ),
    );
  }
}

abstract class MenuItems {
  static const List<String> firstItems = [home];
  static const List<String> secondItems = [settings];
  static const List<String> thirdItems = [logout];

  static const home = 'Sachith Dissanayaka';

  static const settings = 'Settings';
  static const logout = 'Log Out';

  static Widget buildItem(String item) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            item,
            style: const TextStyle(
              color: UtilConstants.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, String item, Widget? widget) {
    switch (item) {
      case MenuItems.home:

        //Do something
        break;
      case MenuItems.settings:
        UtilFunction.navigateForward(context, widget!);
        //Do something
        break;

      case MenuItems.logout:
        UtilMethod.customDialogBox(
          context,
          'Sign Out',
          'Do you Want to Sign Out?',
          onOkPressed: () {
            AuthController.signOutUser();
          },
          onCancelPressed: () {},
        );

        break;
    }
  }
}
