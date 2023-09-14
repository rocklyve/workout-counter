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

    this.sensorId = byteData.getUint8(0);

    this.millis = byteData.getUint32(1, Endian.little);

    this.data = {};

    // IMU data starts at byte index 5
    if (this.sensorId == 0) {
      // Since we don't have the size, we need to ensure we have enough data
      if (bytes.length >= 5 + 36) {
        // 5 (header bytes) + 9 * 4 (floats) = 41 bytes
        this.data['acc_x'] = byteData.getFloat32(5, Endian.little);
        this.data['acc_y'] = byteData.getFloat32(9, Endian.little);
        this.data['acc_z'] = byteData.getFloat32(13, Endian.little);
        this.data['gyro_x'] = byteData.getFloat32(17, Endian.little);
        this.data['gyro_y'] = byteData.getFloat32(21, Endian.little);
        this.data['gyro_z'] = byteData.getFloat32(25, Endian.little);
        this.data['mag_x'] = byteData.getFloat32(29, Endian.little);
        this.data['mag_y'] = byteData.getFloat32(33, Endian.little);
        this.data['mag_z'] = byteData.getFloat32(37, Endian.little);
      } else {
        print("Invalid IMU packet size: ${bytes.length}");
      }
    } else {
      print("Unknown sensor ID: ${this.sensorId}");
    }
  }

  @override
  String toString() {
    return 'SensorDataPacket{sensorId: $sensorId, millis: $millis, data: $data}';
  }
}
