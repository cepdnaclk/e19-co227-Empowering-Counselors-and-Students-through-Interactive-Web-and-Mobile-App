import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;

  final double width;
  final double height;
  final double fontSize;
  final double lableFontSize;
  final TextEditingController textEditingController;
  final Widget? icon;
  final int maxLine;

  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.width,
    required this.textEditingController,
    this.height = 50,
    this.fontSize = 14,
    this.lableFontSize = 15,
    this.icon,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: TextField(
        maxLines: maxLine,
        style: TextStyle(
          fontSize: fontSize,
        ),
        controller: textEditingController,
        obscureText: obscure,
        decoration: InputDecoration(
          suffixIcon: icon,
          labelText: lable,
          labelStyle:
              TextStyle(fontSize: lableFontSize, fontWeight: FontWeight.w100),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
