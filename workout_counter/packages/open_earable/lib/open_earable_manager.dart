library open_earable;

import 'package:flutter_blue/flutter_blue.dart';
import 'package:open_earable/domain/open_earable_characteristics.dart';
import 'package:open_earable/domain/open_earable_properties.dart';
import 'package:open_earable/domain/open_earable_services.dart';
import 'package:open_earable/open_earable_exception.dart';

class OpenEarableManager {
  static final OpenEarableManager _shared = OpenEarableManager._();
  BluetoothDevice? device;
  List<OEService>? deviceServices;

  OpenEarableManager._();

  static OpenEarableManager get shared => _shared;

  Future<void> setup(
    BluetoothDevice device,
  ) async {
    this.device = device;

    // read services and characteristics and store them into the deviceServices
    deviceServices = [];
    List<BluetoothService> services = await device.discoverServices();
    services.forEach(
      (service) {
        List<OECharacteristic> serviceCharacteristics = [];
        service.characteristics.forEach(
          (characteristic) async {
            serviceCharacteristics.add(
              OECharacteristic(
                characteristic.deviceId.toString(),
                characteristic.uuid.toString(),
                characteristic.serviceUuid.toString(),
                OEProperties(
                  characteristic.properties.broadcast,
                  characteristic.properties.read,
                  characteristic.properties.writeWithoutResponse,
                  characteristic.properties.write,
                  characteristic.properties.notify,
                  characteristic.properties.indicate,
                  characteristic.properties.authenticatedSignedWrites,
                  characteristic.properties.extendedProperties,
                  characteristic.properties.notifyEncryptionRequired,
                  characteristic.properties.indicateEncryptionRequired,
                ),
              ),
            );
            deviceServices?.add(
              OEService(
                service.deviceId.toString(),
                service.uuid.toString(),
                serviceCharacteristics,
              ),
            );
          },
        );
      },
    );
  }

  // service 1 -> 45622510-6468-465a-b141-0b9b0f96b468 deviceInfoService
  //              45622511-6468-465a-b141-0b9b0f96b468 deviceIdentifierCharacteristic / deviceGenerationCharacteristic
  //              45622512-6468-465a-b141-0b9b0f96b468 deviceIdentifierCharacteristic / deviceGenerationCharacteristic

  // service 2 -> 34c2e3bb-34aa-11eb-adc1-0242ac120002 sensorService
  //              34c2e3bc-34aa-11eb-adc1-0242ac120002 sensorDataCharacteristic
  //              34c2e3bd-34aa-11eb-adc1-0242ac120002 sensorConfigCharacteristic

  // sensorDataCharactereistic
  // uuid:        34c2e3bc-34aa-11eb-adc1-0242ac120002

  Future<String> getDeviceIdentifier() async {
    _guard();
    OEService? deviceInfoService = deviceServices
        ?.where((element) =>
            element.uuid.toString() == '45622510-6468-465a-b141-0b9b0f96b468')
        .first;

    OECharacteristic? deviceIdentifierCharacteristic = deviceInfoService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == '45622511-6468-465a-b141-0b9b0f96b468')
        .first;
    BluetoothCharacteristic? bluetoothCharacteristic = await _getCharacteristic(
      deviceIdentifierCharacteristic?.serviceUUID ?? '',
      deviceIdentifierCharacteristic?.uuid ?? '',
    );
    List<int>? value = await bluetoothCharacteristic?.read();
    return value.toString();
  }

  Future<void> startDataStream() async {
    OEService? deviceInfoService = deviceServices
        ?.where((element) =>
            element.uuid.toString() == '34c2e3bb-34aa-11eb-adc1-0242ac120002')
        .first;

    OECharacteristic? deviceIdentifierCharacteristic = deviceInfoService
        ?.characteristics
        ?.where((element) =>
            element.uuid.toString() == '34c2e3bc-34aa-11eb-adc1-0242ac120002')
        .first;
    BluetoothCharacteristic? bluetoothCharacteristic = await _getCharacteristic(
      deviceIdentifierCharacteristic?.serviceUUID ?? '',
      deviceIdentifierCharacteristic?.uuid ?? '',
    );
    await bluetoothCharacteristic?.setNotifyValue(true);
    bluetoothCharacteristic?.value.listen(
      (value) {
        // do something with new value
        print('readed data: ${value}');
      },
    );
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
      String serviceUUID, String uuid) async {
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
