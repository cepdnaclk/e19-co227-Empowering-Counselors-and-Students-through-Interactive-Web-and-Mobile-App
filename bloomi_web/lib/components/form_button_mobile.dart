import 'package:bloomi_web/components/custom_button.dart';
import 'package:flutter/material.dart';

class FormButtonMobile extends StatelessWidget {
  final String text;

  const FormButtonMobile(
    this.text, {
    super.key,
    required this.mediaQueryData,
    required this.isLoading,
  });

  final MediaQueryData mediaQueryData;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      mediaQueryData: mediaQueryData,
      isLoading: isLoading,
      width:
          (mediaQueryData.size.width < 500) ? mediaQueryData.size.width : 400,
    );
  }
}
