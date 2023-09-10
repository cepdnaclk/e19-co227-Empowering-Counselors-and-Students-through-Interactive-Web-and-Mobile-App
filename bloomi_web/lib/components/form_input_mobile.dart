import 'package:bloomi_web/components/custom_textfeild.dart';
import 'package:flutter/material.dart';

class FormInputMobile extends StatelessWidget {
  final String lable;
  final TextEditingController textEditingController;
  const FormInputMobile(
    this.lable, {
    super.key,
    required this.mediaQueryData,
    required this.textEditingController,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      textEditingController: textEditingController,
      lable: lable,
      mediaQueryData: mediaQueryData,
      keyboardType: TextInputType.text,
      width:
          (mediaQueryData.size.width < 500) ? mediaQueryData.size.width : 400,
    );
  }
}
