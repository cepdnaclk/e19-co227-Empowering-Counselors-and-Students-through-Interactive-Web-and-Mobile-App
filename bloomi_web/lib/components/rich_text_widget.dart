import 'package:bloomi_web/models/objects.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class RichTextwidget extends StatelessWidget {
  final String text;
  final String result;
  const RichTextwidget({
    super.key,
    required this.list,
    required this.index,
    required this.text,
    required this.result,
  });

  final List<AppointmentModel> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: UtilConstants.blackColor,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: result,
            style: TextStyle(
              color: UtilConstants.greenColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
