import 'package:flutter/material.dart';

class DataChartWidget extends StatefulWidget {
  @override
  _DataChartWidgetState createState() => _DataChartWidgetState();
}

class _DataChartWidgetState extends State<DataChartWidget> {
  List<double> accelerometerData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Graph')),
      body: Container(),
    );
  }
}
