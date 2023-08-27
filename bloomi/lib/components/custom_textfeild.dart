import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  const CustomTextFeild({
    super.key,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
