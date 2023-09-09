import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;
  final MediaQueryData mediaQueryData;
  final double width;
  final String hintText;
  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.mediaQueryData,
    required TextInputType keyboardType,
    required this.width,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: mediaQueryData.size.height * 0.063,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: lable,
          hintText: hintText,
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
