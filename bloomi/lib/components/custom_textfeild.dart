import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;
  final MediaQueryData mediaQueryData;
  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.mediaQueryData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 580,
      height: mediaQueryData.size.height * 0.063,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: lable,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
