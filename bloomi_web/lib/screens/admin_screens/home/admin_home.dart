import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/indicatorwidget.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/pie_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen =
        screenSize.width < 600; // Adjust the breakpoint as needed

    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 20), // Adjust spacing

            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CustomText("Welcome to the Admin Dashboard"),
                  const SizedBox(height: 20),
                  Card(
                    child: Container(
                      width: isSmallScreen ? screenSize.width : 400,
                      child: Column(
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
                                  ),
                                ),
                              ),
                              if (!isSmallScreen) const SizedBox(width: 30),
                              IndicatorWidget(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() => PieData.data
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final value = PieChartSectionData(
          color: data.color,
          value: data.percentage,
          title: '${data.percentage}%',
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );

        return MapEntry(index, value);
      })
      .values
      .toList();
}
