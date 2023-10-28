import 'package:bloomi_web/screens/admin_screens/admin%20charts/indicatorwidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, 13);
    final barGroup2 = makeGroupData(1, 16, 12, 40);
    final barGroup3 = makeGroupData(2, 18, 5, 20);
    final barGroup4 = makeGroupData(3, 20, 16, 5);
    final barGroup5 = makeGroupData(4, 17, 6, 3);
    final barGroup6 = makeGroupData(5, 19, 1.5, 7);
    final barGroup7 = makeGroupData(6, 10, 1.5, 9);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

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
                  width: 300,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: BarChart(
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
                            barGroups: showingBarGroups,
                            gridData: const FlGridData(show: false),
                          ),
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
