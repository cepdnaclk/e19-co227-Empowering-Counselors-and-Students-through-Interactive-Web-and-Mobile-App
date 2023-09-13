import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
    this.text, {
    super.key,
    required this.listItem,
    required this.textEditingController,
  });

  final List<String> listItem;
  final String text;
  final TextEditingController textEditingController;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 15),
      width: mediaQueryData.size.width * 0.3,
      height: mediaQueryData.size.height * 0.063,
      decoration: BoxDecoration(
        border: Border.all(color: UtilConstants.blackColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        iconSize: mediaQueryData.size.width * 0.019,
        dropdownColor: UtilConstants.lightgreyColor,
        underline: const SizedBox(),
        value: valueChoose,
        hint: SizedBox(
          // Wrap the TextField with SizedBox to constrain its width
          width: mediaQueryData.size.width * 0.26,
          child: TextField(
            controller: widget.textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.text,
            ),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize:
                  (mediaQueryData.size.width + mediaQueryData.size.height) *
                      0.009,
              color: UtilConstants.blackColor,
            ),
          ),
        ),
        items: widget.listItem.map((value) {
          return DropdownMenuItem(
            value: value,
            child: SizedBox(
              width: (mediaQueryData.size.width) * 0.08,
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            valueChoose = value;
          });
        },
      ),
    );
  }
}
