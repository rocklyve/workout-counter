import 'dart:typed_data';

class OEDataConfig {
  int sensorId;
  double sampleRate;
  int latency;

  OEDataConfig(
    this.sensorId,
    this.sampleRate,
    this.latency,
  );

  List<int> toBytes() {
    Uint8List bytes = Uint8List(9);
    bytes.setAll(0, [sensorId]);
    // bytes.insert(0, sensorId);
    bytes.setAll(1, [sampleRate.toInt()]);
    // bytes.insert(1, sampleRate.toInt());
    bytes.setAll(5, [latency.toInt()]);
    // bytes.insert(5, latency.toInt());
    // bytes.add(sampleRate.toInt());
    // bytes.add(latency.toInt());
    ByteBuffer byteBuffer = bytes.buffer;
    Uint8List list = byteBuffer.asUint8List();
    return list;
  }
}
