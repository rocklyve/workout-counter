class TemperatureData {
  double temperatureSensor1;
  double temperatureSensor2;
  double temperatureSensor3;
  double temperatureSensor4;
  double temperatureSensor5;
  double temperatureSensor6;

  static double divider = 100;

  TemperatureData({
    required this.temperatureSensor1,
    required this.temperatureSensor2,
    required this.temperatureSensor3,
    required this.temperatureSensor4,
    required this.temperatureSensor5,
    required this.temperatureSensor6,
  });

  double getSensorValue(int sensorIndex) {
    switch (sensorIndex) {
      case 0:
        return temperatureSensor1;
      case 1:
        return temperatureSensor2;
      case 2:
        return temperatureSensor3;
      case 3:
        return temperatureSensor4;
      case 4:
        return temperatureSensor5;
      case 5:
        return temperatureSensor6;
      default:
        return 0;
    }
  }

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
