import 'package:flutter/material.dart';

class AdminFunctions {
  //Admin Panel Datacells
  static DataCell customDatacells(String text) {
    return DataCell(
      Text(
        text,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  //--------------------Datacolumns---------------------------
  static DataColumn customDataColumns(String text) {
    return DataColumn(
        label: Text(
      text,
      style: TextStyle(
        color: Colors.blue.shade300,
        fontSize: 18,
      ),
    ));
  }
}
