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
    BluetoothService? deviceGenService = deviceServices
        ?.where((element) =>
            element.uuid.toString() ==
            '45622510-6468-465a-b141-0b9b0f96b468') // deviceInfoService
        .first;

    BluetoothCharacteristic? deviceGenCharacteristic = deviceGenService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() ==
            '45622512-6468-465a-b141-0b9b0f96b468') // deviceIdentifierCharacteristic / deviceGenerationCharacteristic
        .first;

    List<int>? value2 = await deviceGenCharacteristic?.read();
    // value2 to string
    String value2String = String.fromCharCodes(value2!);
    print('Generation: $value2String');
    return value.toString();
  }

  Future<Stream<OESensorDataPacket>> startDataStream(
      OEDataConfig config) async {
    print("start data stream");
    // fetch characteristic with given OECharacteristic
    BluetoothService? sensorService = deviceServices
        ?.where((element) =>
            element.uuid.toString() ==
            '34c2e3bb-34aa-11eb-adc1-0242ac120002') // sensorService
        .first;

    BluetoothCharacteristic? sensorDataCharacteristic = sensorService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() ==
            '34c2e3bc-34aa-11eb-adc1-0242ac120002') // sensorDataCharacteristic
        .first;

    BluetoothCharacteristic? sensorConfigCharacteristic = sensorService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() ==
            '34c2e3bd-34aa-11eb-adc1-0242ac120002') // sensorConfigCharacteristic
        .first;

    // set config for data stream
    print('write config for data');

    try {
      List<int> configPacket = List<int>.filled(9, 0);
      configPacket[0] = config.sensorId;

      // Pack sampleRate as 4 bytes (float)
      Uint8List sampleRateBytes = floatToBytes(config.sampleRate);
      configPacket.setRange(1, 5, sampleRateBytes);

      // Pack latency as 4 bytes (uint32_t)
      Uint8List latencyBytes = intToBytes(config.latency);
      configPacket.setRange(5, 9, latencyBytes);

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
    // In this code, we pack the sampleRate and latency values into their respective byte representations before sending them in the configPacket. This should ensure that the data sent to the BLE device matches the expected format defined in the Arduino code.

    // List<int>? list = await sensorDataCharacteristic?.read();
    // print('read data');
    // print(list);
    await sensorDataCharacteristic?.setNotifyValue(true);
    print('set notify value set');
    StreamController<OESensorDataPacket> sensorDataController =
        StreamController<OESensorDataPacket>();

    // Handle the case when bluetoothSensorDataCharacteristic is null

    sensorDataCharacteristic?.onValueReceived.listen(
      (value) {
        try {
          // Use the OESensorDataPacket class to unpack the data
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
