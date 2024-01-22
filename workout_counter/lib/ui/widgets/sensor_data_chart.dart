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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sensor ${sensorIndex + 1}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
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
        ],
      ),
    );
  }
}
