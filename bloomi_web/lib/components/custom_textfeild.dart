import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;
  final MediaQueryData mediaQueryData;
  final double width;
  final TextEditingController textEditingController;

  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.mediaQueryData,
    required TextInputType keyboardType,
    required this.width,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: mediaQueryData.size.height * 0.063,
      child: TextField(
        style: TextStyle(
          fontSize: mediaQueryData.size.height * 0.02,
        ),
        controller: textEditingController,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(
              fontSize: mediaQueryData.size.height * 0.023,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
