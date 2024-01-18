import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../domain/models/imu_data.dart';
import '../../domain/models/imu_type.dart';

class IMUDataChart extends StatelessWidget {
  final List<IMUData> dataPoints;
  final String title;
  final IMUType type;

  const IMUDataChart({super.key, required this.dataPoints, required this.title, required this.type});

  Tuple3<List<double>, List<double>, List<double>> _getDataPoints() {
    switch (type) {
      case IMUType.acc:
        return Tuple3(
          dataPoints.map((imuData) => imuData.accData.x).toList(),
          dataPoints.map((imuData) => imuData.accData.y).toList(),
          dataPoints.map((imuData) => imuData.accData.z).toList(),
        );
      case IMUType.gyro:
        return Tuple3(
          dataPoints.map((imuData) => imuData.gyroData.x).toList(),
          dataPoints.map((imuData) => imuData.gyroData.y).toList(),
          dataPoints.map((imuData) => imuData.gyroData.z).toList(),
        );
      case IMUType.mag:
        return Tuple3(
          dataPoints.map((imuData) => imuData.magData.x).toList(),
          dataPoints.map((imuData) => imuData.magData.y).toList(),
          dataPoints.map((imuData) => imuData.magData.z).toList(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Tuple3<List<double>, List<double>, List<double>> data = _getDataPoints();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: data.item1.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())).toList(),
                  isCurved: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: data.item2.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())).toList(),
                  isCurved: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: data.item3.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())).toList(),
                  isCurved: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              lineTouchData: const LineTouchData(enabled: false),
            ),
          ),
        ),
      ],
    );
  }
}
