import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailedLinebar extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  DetailedLinebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 300,
                width: 900,
                child: Consumer<UserProvider>(
                  builder: (context, value, child) {
                    return LineChart(
                      LineChartData(
                        maxX: 8,
                        minX: 0,
                        backgroundColor: UtilConstants.mainGridLineColor,
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return const FlLine(
                              color: Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(1, value.countList[0].toDouble()),
                              FlSpot(2, value.countList[1].toDouble()),
                              FlSpot(3, value.countList[2].toDouble()),
                              FlSpot(4, value.countList[3].toDouble()),
                              FlSpot(5, value.countList[4].toDouble()),
                              FlSpot(6, value.countList[5].toDouble()),
                              FlSpot(
                                  7,
                                  value.countList[6]
                                      .toDouble()), //has to import items
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          // leftTitles: AxisTitles(
                          //   sideTitles: SideTitles(
                          //     showTitles: true,
                          //     interval: 1,
                          //     getTitlesWidget: leftTitleWidgets,
                          //     reservedSize: 42,
                          //   ),
                          // ),
                        ),
                      ),
                    );
                  },
                )),
            const Text(
              'User Engagement Over Time',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('${DateTime.now().day - 6}', style: style);
        break;
      case 2:
        text = Text('${DateTime.now().day - 5}', style: style);
        break;
      case 3:
        text = Text('${DateTime.now().day - 4}', style: style);
        break;
      case 4:
        text = Text('${DateTime.now().day - 3}', style: style);
        break;
      case 5:
        text = Text('${DateTime.now().day - 2}', style: style);
        break;
      case 6:
        text = Text('${DateTime.now().day - 1}', style: style);
        break;
      case 7:
        text = Text('${DateTime.now().day}', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
