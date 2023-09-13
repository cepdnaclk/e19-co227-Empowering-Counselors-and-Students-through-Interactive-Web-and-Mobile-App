import 'package:bloomi_web/components/custom_button.dart';
import 'package:flutter/material.dart';

class FormButtonWeb extends StatelessWidget {
  final String text;
  final bool isLoading;

  const FormButtonWeb(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.isLoading,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      isLoading: isLoading,
      mediaQueryData: mediaQueryData,
      width: mediaQueryData.size.width * 0.3,
    );
  }
}
