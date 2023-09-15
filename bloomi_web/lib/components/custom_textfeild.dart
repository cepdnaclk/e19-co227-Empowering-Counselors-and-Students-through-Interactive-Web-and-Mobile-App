import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;

  final double width;
  final double height;
  final double fontSize;
  final double lableFontSize;
  final TextEditingController textEditingController;

  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.width,
    required this.textEditingController,
    this.height = 50,
    this.fontSize = 14,
    this.lableFontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        style: TextStyle(
          fontSize: fontSize,
        ),
        controller: textEditingController,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle:
              TextStyle(fontSize: lableFontSize, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
