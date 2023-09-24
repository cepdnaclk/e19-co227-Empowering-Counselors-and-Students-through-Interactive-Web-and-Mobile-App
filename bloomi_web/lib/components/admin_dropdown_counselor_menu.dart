import 'package:bloomi_web/providers/admin/counselor_registration_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDropDownCounselorWidget extends StatelessWidget {
  final List<String> listItem;
  final String text;
  final int index;

  const AdminDropDownCounselorWidget({
    super.key,
    required this.listItem,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String? selectedValue;

    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // Add more decoration..
      ),
      hint: Text(
        text,
        style: const TextStyle(fontSize: 14, color: UtilConstants.blackColor),
      ),
      items: listItem
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select $text.';
        }
        return null;
      },
      onChanged: (value) {
        if (index == 1) {
          Provider.of<CounsellorRegistrationProvider>(context, listen: false)
              .setFaculty(value!);
        }
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
