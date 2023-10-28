import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/screens/admin_screens/admin%20charts/indicatorwidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountChart extends StatefulWidget {
  const CountChart({super.key});
  final Color leftBarColor = Colors.yellow;
  final Color middleBarColor = Colors.green;

  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.blue;
  @override
  State<StatefulWidget> createState() => CountChartState();
}

class CountChartState extends State<CountChart> {
  final double width = 7;

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Consumer<UserProvider>(
                          builder: (context, value, child) {
                            return BarChart(
                              BarChartData(
                                barTouchData: BarTouchData(
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.grey,
                                    getTooltipItem: (a, b, c, d) => null,
                                  ),
                                ),
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
                                      getTitlesWidget: bottomTitles,
                                      reservedSize: 42,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: [
                                  makeGroupData(
                                    0,
                                    value.userCount[0].toDouble(),
                                    value.adminCount[0].toDouble(),
                                    value.counsellorCount[0].toDouble(),
                                  ),
                                  makeGroupData(
                                    1,
                                    value.userCount[1].toDouble(),
                                    value.adminCount[1].toDouble(),
                                    value.counsellorCount[1].toDouble(),
                                  ),
                                  makeGroupData(
                                    2,
                                    value.userCount[2].toDouble(),
                                    value.adminCount[2].toDouble(),
                                    value.counsellorCount[2].toDouble(),
                                  ),
                                  makeGroupData(
                                    3,
                                    value.userCount[3].toDouble(),
                                    value.adminCount[3].toDouble(),
                                    value.counsellorCount[3].toDouble(),
                                  ),
                                  makeGroupData(
                                    4,
                                    value.userCount[4].toDouble(),
                                    value.adminCount[4].toDouble(),
                                    value.counsellorCount[4].toDouble(),
                                  ),
                                  makeGroupData(
                                    5,
                                    value.userCount[5].toDouble(),
                                    value.adminCount[5].toDouble(),
                                    value.counsellorCount[5].toDouble(),
                                  ),
                                  makeGroupData(
                                    6,
                                    value.userCount[6].toDouble(),
                                    value.adminCount[6].toDouble(),
                                    value.counsellorCount[6].toDouble(),
                                  ),
                                ],
                                gridData: const FlGridData(show: false),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                const IndicatorWidget(),
              ],
            ),
            const Text(
              'Number of Registration of Users Over Time',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Color.fromARGB(255, 54, 53, 53),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '${DateTime.now().day - 6}',
      '${DateTime.now().day - 5}',
      '${DateTime.now().day - 4}',
      '${DateTime.now().day - 3}',
      '${DateTime.now().day - 2}',
      '${DateTime.now().day - 1}',
      '${DateTime.now().day}'
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.middleBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
