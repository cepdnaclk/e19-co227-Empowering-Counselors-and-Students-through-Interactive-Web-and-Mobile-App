import 'package:flutter/material.dart';

class AdminFunctions {
  //Admin Panel Datacells
  static DataCell customDatacells(String text) {
    return DataCell(
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  //--------------------Datacolumns---------------------------
  static DataColumn customDataColumns(String text) {
    return DataColumn(
        label: Center(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue.shade300,
            fontSize: 20,
          ),
        ),
      ),
    ));
  }
}
