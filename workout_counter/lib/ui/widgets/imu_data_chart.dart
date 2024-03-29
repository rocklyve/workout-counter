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
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                elevation: 2.0,
                margin: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 50, showTitles: true),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 0, showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 0, showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 0, showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: data.item1
                              .asMap()
                              .entries
                              .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                              .toList(),
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          color: Colors.red,
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: data.item2
                              .asMap()
                              .entries
                              .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                              .toList(),
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          color: Colors.green,
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: data.item3
                              .asMap()
                              .entries
                              .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                              .toList(),
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          color: Colors.blue,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      lineTouchData: const LineTouchData(enabled: false),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
