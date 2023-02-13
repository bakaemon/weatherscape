import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weatherscape/utils/charts/linechart.titles.dart';


class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green
  ];

  final List<double> data;

  LineChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) => LineChart(LineChartData(
        minX: 0,
        maxX: 23,
        minY: 0,
        maxY: 13,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, data[0]),
              FlSpot(4, data[1]),
              FlSpot(8, data[2]),
              FlSpot(12, data[3]),
              FlSpot(16, data[4]),
              FlSpot(23, data[5]),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.9))
                  .toList(),
              gradientFrom: const Offset(0.5, 0),
              gradientTo: const Offset(0.5, 1),
            ),
            gradientFrom: const Offset(0.5, 0),
            gradientTo: const Offset(0.5, 1),
          ),
        ],
      ));
}
