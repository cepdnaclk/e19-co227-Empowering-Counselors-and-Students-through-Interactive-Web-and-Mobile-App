import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;
  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
