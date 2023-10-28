import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Students', percentage: 50.0, color: Colors.yellow),
    Data(name: 'Counselors', percentage: 40.0, color: Colors.red),
    Data(name: 'Admins', percentage: 20.0, color: Colors.green),
  ];
}

class Data {
  final String name;
  final double percentage;
  final Color color;
  Data({required this.name, required this.percentage, required this.color});
}
