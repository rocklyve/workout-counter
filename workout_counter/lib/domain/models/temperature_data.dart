class TemperatureData {
  final double temperatureSensor1;
  final double temperatureSensor2;
  final double temperatureSensor3;
  final double temperatureSensor4;
  final double temperatureSensor5;
  final double temperatureSensor6;

  static double divider = 100;

  TemperatureData({
    required this.temperatureSensor1,
    required this.temperatureSensor2,
    required this.temperatureSensor3,
    required this.temperatureSensor4,
    required this.temperatureSensor5,
    required this.temperatureSensor6,
  });

  static fromString(String e) {
    List<double> data = e.split(',').map((e) => double.parse(e)).toList();

    return TemperatureData(
      temperatureSensor1: data[0] / divider,
      temperatureSensor2: data[1] / divider,
      temperatureSensor3: data[2] / divider,
      temperatureSensor4: data[3] / divider,
      temperatureSensor5: data[4] / divider,
      temperatureSensor6: data[5] / divider,
    );
  }
}
