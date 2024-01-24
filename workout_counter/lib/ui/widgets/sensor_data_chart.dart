import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:workout_counter/domain/models/temperature_data.dart';

class SensorDataChart extends StatelessWidget {
  final List<TemperatureData> objectTempData;
  final List<TemperatureData> sensorTempData;
  final int sensorIndex;

  const SensorDataChart({
    super.key,
    required this.objectTempData,
    required this.sensorTempData,
    required this.sensorIndex,
  });

  String _getSensorName(int sensorIndex) {
    switch (sensorIndex) {
      case 0:
        return 'Tympanic Membrane';
      case 1:
        return 'Concha';
      case 2:
        return 'Ear Canal';
      case 3:
        return 'Out Bottom';
      case 4:
        return 'Out Top';
      case 5:
        return 'Out Middle';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getSensorName(sensorIndex),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(reservedSize: 40, showTitles: true),
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
                      isCurved: true,
                      spots: objectTempData
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value.getSensorValue(sensorIndex)))
                          .toList(),
                      dotData: const FlDotData(show: false),
                      color: Colors.blue,
                    ),
                    LineChartBarData(
                      spots: sensorTempData
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value.getSensorValue(sensorIndex)))
                          .toList(),
                      isCurved: true,
                      dotData: const FlDotData(show: false),
                      color: Colors.red,
                    ),
                  ],
                  lineTouchData: const LineTouchData(enabled: false),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
