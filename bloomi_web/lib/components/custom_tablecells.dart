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
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(
          name[indexnumber],
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
