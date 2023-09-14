library open_earable;

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:open_earable/domain/open_earable_sensor_data_packet.dart';
import 'package:open_earable/open_earable_exception.dart';

import 'domain/open_earable_ble_characteristics.dart';
import 'domain/open_earable_ble_services.dart';
import 'domain/open_earable_data_config.dart';

class OpenEarableManager {
  static final OpenEarableManager _shared = OpenEarableManager._();
  BluetoothDevice? device;
  List<BluetoothService>? deviceServices;

  OpenEarableManager._();

  static OpenEarableManager get shared => _shared;

  Future<void> setup(
    BluetoothDevice device,
  ) async {
    this.device = device;

    // Initialize empty list for deviceServices
    deviceServices = [];

    // Discover all services
    deviceServices = await device.discoverServices();
  }

  Future<String> getDeviceIdentifier() async {
    _guard();
    BluetoothService? deviceInfoService = deviceServices
        ?.where((element) => element.uuid.toString() == oEDeviceInfoServiceUUID)
        .first;

    BluetoothCharacteristic? deviceIdentifierCharacteristic = deviceInfoService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == oEDeviceIdentifierCharacteristicUUID)
        .first;

    List<int>? value = await deviceIdentifierCharacteristic?.read();

    String generationString = await getDeviceGeneration();
    print('Generation: $generationString');

    return value.toString();
  }

  Future<String> getDeviceGeneration() async {
    BluetoothService? deviceGenService = deviceServices
        ?.where((element) => element.uuid.toString() == oEDeviceInfoServiceUUID)
        .first;

    BluetoothCharacteristic? deviceGenCharacteristic = deviceGenService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == oEDeviceGenerationCharacteristicUUID)
        .first;

    List<int>? generationRawValue = await deviceGenCharacteristic?.read();
    // value2 to string
    String generationRawValueString =
        String.fromCharCodes(generationRawValue ?? []);

    return generationRawValueString;
  }

  Future<Stream<OESensorDataPacket>> startDataStream(
      OEDataConfig config) async {
    // First initialize the sensor service and characteristics
    BluetoothService? sensorService = deviceServices
        ?.where((element) => element.uuid.toString() == oESensorServiceUUID)
        .first;

    BluetoothCharacteristic? sensorDataCharacteristic = sensorService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == oESensorDataCharacteristicUUID)
        .first;

    BluetoothCharacteristic? sensorConfigCharacteristic = sensorService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == oESensorConfigCharacteristicUUID)
        .first;

    // Now we can send the configuration packet to the BLE device
    try {
      List<int> configPacket = _buildConfigPacket(config);

      if (sensorConfigCharacteristic != null) {
        if (sensorConfigCharacteristic.properties.writeWithoutResponse) {
          await sensorConfigCharacteristic.write(configPacket,
              withoutResponse: true);
        } else {
          await sensorConfigCharacteristic.write(configPacket);
        }
        print('Configuration packet sent successfully');
      } else {
        print('Bluetooth Sensor Config Characteristic is null');
      }
    } catch (e) {
      print('Error sending configuration packet: $e');
    }

    await sensorDataCharacteristic?.setNotifyValue(true);
    StreamController<OESensorDataPacket> sensorDataController =
        StreamController<OESensorDataPacket>();

    sensorDataCharacteristic?.onValueReceived.listen(
      (value) {
        try {
          OESensorDataPacket packet =
              OESensorDataPacket.fromBytes(Uint8List.fromList(value));
          sensorDataController.add(packet);
        } catch (e) {
          print("Error parsing packet: $e");
        }
      },
    );

    return sensorDataController.stream;
  }

  List<int> _buildConfigPacket(OEDataConfig config) {
    List<int> configPacket = List<int>.filled(9, 0);
    configPacket[0] = config.sensorId;

    // Pack sampleRate as 4 bytes (float)
    Uint8List sampleRateBytes = floatToBytes(config.sampleRate);
    configPacket.setRange(1, 5, sampleRateBytes);

    // Pack latency as 4 bytes (uint32_t)
    Uint8List latencyBytes = intToBytes(config.latency);
    configPacket.setRange(5, 9, latencyBytes);

    return configPacket;
  }

  Uint8List floatToBytes(double value) {
    var bytes = Uint8List.fromList(List<int>.filled(4, 0));
    var buffer = bytes.buffer.asByteData();
    buffer.setFloat32(0, value, Endian.little);
    return bytes;
  }

  Uint8List intToBytes(int value) {
    var bytes = Uint8List.fromList(List<int>.filled(4, 0));
    var buffer = bytes.buffer.asByteData();
    buffer.setInt32(0, value, Endian.little);
    return bytes;
  }

  Uint8List packSensorData(
      int sensorId, int size, int millis, List<int> sensorData) {
    ByteData byteData = ByteData(size);
    byteData.setUint8(0, sensorId);
    byteData.setUint8(1, size);
    byteData.setUint32(2, millis, Endian.little);

    for (int i = 0; i < sensorData.length; i++) {
      byteData.setUint8(6 + i, sensorData[i]);
    }

    return byteData.buffer.asUint8List();
  }

  void unpackSensorData(Uint8List bytes) {
    ByteData byteData = ByteData.sublistView(bytes);

    int sensorId = byteData.getUint8(0);
    int size = byteData.getUint8(1);
    int millis = byteData.getUint32(2, Endian.little);

    List<int> sensorData = [];
    for (int i = 0; i < size - 6; i++) {
      sensorData.add(byteData.getUint8(6 + i));
    }

    print("sensorId: $sensorId, size: $size, millis: $millis");
    print("sensorData: $sensorData");
  }

  void _guard() {
    if (device == null) {
      throw const OpenEarableSetupException(
        'setup() method not executed. Call this '
        'method before using other functionalities',
      );
    }
  }

  Future<BluetoothCharacteristic?> _getCharacteristic(
    String serviceUUID,
    String uuid,
  ) async {
    BluetoothCharacteristic? returnedCaracteristic;
    List<BluetoothService>? services = await device?.discoverServices();
    services?.forEach(
      (service) {
        // Reads all characteristics
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          returnedCaracteristic = c;
        }
      },
    );
    return returnedCaracteristic;
  }
}
