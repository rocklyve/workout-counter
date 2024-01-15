import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SensorDataChart extends StatelessWidget {
  final List<int> objectTempData;
  final List<int> sensorTempData;
  final int sensorIndex;

  SensorDataChart({
    required this.objectTempData,
    required this.sensorTempData,
    required this.sensorIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Sensor ${sensorIndex + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: [FlSpot(0, objectTempData[sensorIndex].toDouble())],
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  color: Colors.blue,
                ),
                LineChartBarData(
                  spots: [FlSpot(1, sensorTempData[sensorIndex].toDouble())],
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  color: Colors.red,
                ),
              ],
              lineTouchData: LineTouchData(enabled: false),
            ),
          ),
        ),
      ],
    );
  }
}
