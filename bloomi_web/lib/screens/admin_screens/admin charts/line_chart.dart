// import 'package:bloomi_web/providers/users/user_provider.dart';
// import 'package:bloomi_web/utils/util_constant.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class _LineChart extends StatelessWidget {
//   const _LineChart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(
//       builder: (context, value, child) {
//         return LineChart(sampleData1(value));
//       },
//     );
//   }

//   LineChartData sampleData1(UserProvider value) {
//     return LineChartData(
//       lineTouchData: lineTouchData1,
//       gridData: gridData,
//       titlesData: titlesData1,
//       borderData: borderData,
//       lineBarsData: lineBarsData1(value),
//       minX: 0,
//       maxX: 32,
//       minY: 0,
//     );
//   }

//   LineTouchData get lineTouchData1 => LineTouchData(
//         handleBuiltInTouches: true,
//         touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//         ),
//       );

//   FlTitlesData get titlesData1 => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       );

//   List<LineChartBarData> lineBarsData1(UserProvider value) {
//     return [
//       lineChartBarData1_1(value),
//       lineChartBarData1_2(value),
//       lineChartBarData1_3(value),
//     ];
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 12,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = Text('${DateTime.now().day - 6}', style: style);
//         break;
//       case 7:
//         text = Text('${DateTime.now().day - 5}', style: style);
//         break;
//       case 12:
//         text = Text('${DateTime.now().day - 4}', style: style);
//         break;
//       case 17:
//         text = Text('${DateTime.now().day - 3}', style: style);
//         break;
//       case 22:
//         text = Text('${DateTime.now().day - 2}', style: style);
//         break;
//       case 27:
//         text = Text('${DateTime.now().day - 1}', style: style);
//         break;
//       case 32:
//         text = Text('${DateTime.now().day}', style: style);
//         break;
//       default:
//         text = const Text('');
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10,
//       child: text,
//     );
//   }

//   SideTitles get bottomTitles => SideTitles(
//         showTitles: true,
//         reservedSize: 32,
//         interval: 1,
//         getTitlesWidget: bottomTitleWidgets,
//       );

//   FlGridData get gridData => const FlGridData(show: false);

//   FlBorderData get borderData => FlBorderData(
//         show: true,
//         border: Border(
//           bottom: BorderSide(
//               color: UtilConstants.primary.withOpacity(0.2), width: 4),
//           left: const BorderSide(color: Colors.transparent),
//           right: const BorderSide(color: Colors.transparent),
//           top: const BorderSide(color: Colors.transparent),
//         ),
//       );

//   LineChartBarData lineChartBarData1_1(UserProvider value) {
//     return LineChartBarData(
//       isCurved: true,
//       color: UtilConstants.contentColorGreen,
//       barWidth: 8,
//       isStrokeCapRound: true,
//       dotData: const FlDotData(show: false),
//       belowBarData: BarAreaData(show: false),
//       spots: [
//         FlSpot(2, value.counsellorCount[0].toDouble()),
//         FlSpot(7, value.counsellorCount[6].toDouble()),
//         FlSpot(12, value.counsellorCount[6].toDouble()),
//         FlSpot(17, value.counsellorCount[3].toDouble()),
//         FlSpot(22, value.counsellorCount[4].toDouble()),
//         FlSpot(27, value.counsellorCount[5].toDouble()),
//         FlSpot(32, value.counsellorCount[6].toDouble()),
//       ],
//     );
//   }

//   LineChartBarData lineChartBarData1_2(UserProvider value) {
//     return LineChartBarData(
//       isCurved: true,
//       color: UtilConstants.contentColorPink,
//       barWidth: 8,
//       isStrokeCapRound: true,
//       dotData: const FlDotData(show: false),
//       belowBarData: BarAreaData(
//         show: false,
//         color: UtilConstants.contentColorPink.withOpacity(0),
//       ),
//       spots: const [
//         FlSpot(2, 1),
//         FlSpot(7, 2.8),
//         FlSpot(12, 1.2),
//         FlSpot(17, 2.8),
//         FlSpot(22, 2.6),
//         FlSpot(27, 3.9),
//         FlSpot(32, 1),
//       ],
//     );
//   }

//   LineChartBarData lineChartBarData1_3(UserProvider value) {
//     return LineChartBarData(
//       isCurved: true,
//       color: UtilConstants.contentColorCyan,
//       barWidth: 8,
//       isStrokeCapRound: true,
//       dotData: const FlDotData(show: false),
//       belowBarData: BarAreaData(show: false),
//       spots: const [
//         FlSpot(2, 2.8),
//         FlSpot(7, 1.9),
//         FlSpot(12, 3),
//         FlSpot(17, 1.3),
//         FlSpot(22, 2.5),
//         FlSpot(27, 2.8),
//         FlSpot(32, 1.9),
//       ],
//     );
//   }
// }

// class LineChartSample1 extends StatefulWidget {
//   const LineChartSample1({super.key});

//   @override
//   State<StatefulWidget> createState() => LineChartTwo();
// }

// class LineChartTwo extends State<LineChartSample1> {
//   late bool isShowingMainData;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           width: 600,
//           height: 335,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   const SizedBox(height: 250, width: 450, child: _LineChart()),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   SizedBox(
//                     height: 200,
//                     width: 120,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 16,
//                               height: 16,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: UtilConstants.contentColorGreen,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Text(
//                               'Requested ',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 54, 53, 53),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 16,
//                               height: 16,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: UtilConstants.contentColorCyan,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Text(
//                               'Accepted ',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 54, 53, 53),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 16,
//                               height: 16,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: UtilConstants.contentColorPink,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Text(
//                               'Declined ',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 54, 53, 53),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const Text(
//                 'Appointments Details of the Users',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w100,
//                   fontSize: 14,
//                   color: Color.fromARGB(255, 54, 53, 53),
//                 ),
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
