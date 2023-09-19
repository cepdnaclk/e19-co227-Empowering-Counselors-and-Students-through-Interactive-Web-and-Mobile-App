import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Tablecellwidget extends StatelessWidget {
  const Tablecellwidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: CustomText(
        name,
        textAlign: TextAlign.center,
        fontSize: 16,
        fontColor: UtilConstants.blackColor,
      ),
    );
  }
}
