import 'dart:typed_data';

class OESensorDataPacket {
  late final int sensorId;
  late final int millis;
  late final Map<String, dynamic> data;

  OESensorDataPacket.fromBytes(Uint8List bytes) {
    ByteData byteData = ByteData.sublistView(bytes);

    if (bytes.length < 5) {
      // At least 5 bytes for sensorId and millis
      throw Exception("Invalid packet size.");
    }

    sensorId = byteData.getUint8(0);

    millis = byteData.getUint32(1, Endian.little);

    data = {};

    // IMU data starts at byte index 5
    if (sensorId == 0) {
      // Since we don't have the size, we need to ensure we have enough data
      if (bytes.length >= 5 + 36) {
        // 5 (header bytes) + 9 * 4 (floats) = 41 bytes
        data['acc_x'] = byteData.getFloat32(5, Endian.little);
        data['acc_y'] = byteData.getFloat32(9, Endian.little);
        data['acc_z'] = byteData.getFloat32(13, Endian.little);
        data['gyro_x'] = byteData.getFloat32(17, Endian.little);
        data['gyro_y'] = byteData.getFloat32(21, Endian.little);
        data['gyro_z'] = byteData.getFloat32(25, Endian.little);
        data['mag_x'] = byteData.getFloat32(29, Endian.little);
        data['mag_y'] = byteData.getFloat32(33, Endian.little);
        data['mag_z'] = byteData.getFloat32(37, Endian.little);
      } else {
        print("Invalid IMU packet size: ${bytes.length}");
      }
    } else {
      print("Unknown sensor ID: $sensorId");
    }
  }

  @override
  String toString() {
    return 'SensorDataPacket{sensorId: $sensorId, millis: $millis, data: $data}';
  }
}
