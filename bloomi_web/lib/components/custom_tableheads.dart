import 'package:flutter/material.dart';

class Tableheads extends StatelessWidget {
  const Tableheads({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent,
          fontSize: 20,
        ),
      ),
    );
  }
}
