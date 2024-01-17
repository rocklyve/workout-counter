import 'package:workout_counter/domain/models/acc_data.dart';

import 'gyro_data.dart';
import 'mag_data.dart';

class IMUData {
  final AccData accData;
  final GyroData gyroData;
  final MagData magData;

  static double divider = 100;

  IMUData({
    required this.accData,
    required this.gyroData,
    required this.magData,
  });

  static fromString(String e) {
    List<double> data = e.split(',').map((e) => double.parse(e)).toList();
    if (data.length < 9) {
      return _fillDataAsMuchAsPossible(data);
    }

    return IMUData(
      accData: AccData(
        x: data[0] / divider,
        y: data[1] / divider,
        z: data[2] / divider,
      ),
      gyroData: GyroData(
        x: data[3] / divider,
        y: data[4] / divider,
        z: data[5] / divider,
      ),
      magData: MagData(
        x: data[6] / divider,
        y: data[7] / divider,
        z: data[8] / divider,
      ),
    );
  }

  static IMUData _fillDataAsMuchAsPossible(List<double> data) {
    var accData = AccData(x: 0, y: 0, z: 0);
    var gyroData = GyroData(x: 0, y: 0, z: 0);
    var magData = MagData(x: 0, y: 0, z: 0);

    for (int i = 0; i < data.length; i++) {
      switch (i) {
        case 0:
          accData.x = data[i] / divider;
          break;
        case 1:
          accData.y = data[i] / divider;
          break;
        case 2:
          accData.z = data[i] / divider;
          break;
        case 3:
          gyroData.x = data[i] / divider;
          break;
        case 4:
          gyroData.y = data[i] / divider;
          break;
        case 5:
          gyroData.z = data[i] / divider;
          break;
        case 6:
          magData.x = data[i] / divider;
          break;
        case 7:
          magData.y = data[i] / divider;
          break;
        case 8:
          magData.z = data[i] / divider;
          break;
      }
    }

    return IMUData(accData: accData, gyroData: gyroData, magData: magData);
  }
}
