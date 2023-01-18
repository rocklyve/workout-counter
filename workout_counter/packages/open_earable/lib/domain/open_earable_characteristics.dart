import 'open_earable_properties.dart';

class OECharacteristic {
  String deviceId;
  String uuid;
  String serviceUUID;

  OEProperties properties;

  OECharacteristic(this.deviceId, this.uuid, this.serviceUUID, this.properties);
}
