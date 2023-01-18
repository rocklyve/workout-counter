library open_earable;

import 'package:flutter_blue/flutter_blue.dart';
import 'package:open_earable/open_earable_exception.dart';

class OpenEarableManager {
  static final OpenEarableManager _shared = OpenEarableManager._();
  BluetoothDevice? device;

  OpenEarableManager._();

  static OpenEarableManager get shared => _shared;

  void setup(
    BluetoothDevice device,
  ) {
    this.device = device;
  }

  void getBatteryState() {
    _guard();
    return;
  }

  void _guard() {
    if (device == null) {
      throw const OpenEarableSetupException(
        'setup() method not executed. Call this '
        'method before using other functionalities',
      );
    }
  }
}
