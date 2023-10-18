import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/count_chart.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/indicatorwidget.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/line_bar_chart.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/pie_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int touchedIndex = -1; // Initialize touchedIndex here

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 20), // Adjust spacing

            Column(
              children: [
                const SizedBox(height: 20),
                const CustomText("Welcome to the Admin Dashboard"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Card(
                      child: Container(
                        width: isSmallScreen ? screenSize.width : 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: isSmallScreen ? 150 : 200,
                                  width: isSmallScreen ? 150 : 200,
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 40,
                                      sections: getSections(),
                                      pieTouchData: PieTouchData(touchCallback:
                                          (FlTouchEvent event,
                                              PieTouchResponse?
                                                  pieTouchResponse) {
                                        setState(() {
                                          if (pieTouchResponse == null ||
                                              pieTouchResponse.touchedSection ==
                                                  null) {
                                            touchedIndex = -1;
                                          } else {
                                            touchedIndex = pieTouchResponse
                                                .touchedSection!
                                                .touchedSectionIndex;
                                          }
                                        });
                                      }),
                                    ),
                                  ),
                                ),
                                if (!isSmallScreen) const SizedBox(width: 30),
                                const IndicatorWidget(),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Representation of Percentages of Users',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    DetailedLinebar(),
                  ],
                ),
                const CountChart(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() => PieData.data
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final isTouched = index == touchedIndex;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        final value = PieChartSectionData(
          color: data.color,
          value: data.percentage,
          title: '${data.percentage}%',
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          radius: radius,
        );

        return MapEntry(index, value);
      })
      .values
      .toList();
}
