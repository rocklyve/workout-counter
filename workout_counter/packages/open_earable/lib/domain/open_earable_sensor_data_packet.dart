import 'dart:typed_data';

class OESensorDataPacket {
  late final int sensorId;
  late final int size;
  late final int millis;
  late final List<int> data;

  OESensorDataPacket.fromBytes(Uint8List bytes) {
    ByteData byteData = ByteData.sublistView(bytes);

    if (bytes.length < 6) {
      throw Exception("Invalid packet size.");
    }

    this.sensorId = byteData.getUint8(0);
    this.size = byteData.getUint8(1);
    this.millis = byteData.getUint32(2, Endian.little);

    if (bytes.length < this.size) {
      throw Exception("Invalid size field: Exceeds byte array length.");
    }

    this.data = [];
    for (int i = 0; i < this.size - 6; i++) {
      this.data.add(byteData.getUint8(6 + i));
    }
  }

  @override
  String toString() {
    return 'SensorDataPacket{sensorId: $sensorId, size: $size, millis: $millis, data: $data}';
  }
}
