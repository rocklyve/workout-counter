import 'package:open_earable/domain/open_earable_characteristics.dart';

class OEService {
  String deviceId;
  String uuid;
  List<OECharacteristic> characteristics;

  OEService(this.deviceId, this.uuid, this.characteristics);
}
