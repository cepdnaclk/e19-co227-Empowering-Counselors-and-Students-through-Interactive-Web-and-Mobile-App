import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Tablecellwidget extends StatelessWidget {
  const Tablecellwidget({
    Key? key,
    required this.name,
    required this.indexnumber,
  }) : super(key: key);

  final List<String> name;
  final int indexnumber;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: CustomText(
        name[indexnumber],
        textAlign: TextAlign.center,
        fontSize: 16,
        fontColor: UtilConstants.blackColor,
      ),
    );
  }
}
