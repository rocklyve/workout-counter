import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:open_earable/domain/open_earable_data_config.dart';
import 'package:open_earable/open_earable_manager.dart';

import 'bluetooth_connection_state.dart' as bluetoothConnectionState;

class BluetoothConnectionCubit extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  BluetoothConnectionCubit() : super(const bluetoothConnectionState.BluetoothConnectionState.initial());

  late StreamSubscription<List<ScanResult>> bluetoothDevices;
  late BluetoothDevice device;

  void startObserving() {
    // Start search process to look for the ble devices.
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    // Listen to scan results.
    bluetoothDevices = FlutterBluePlus.scanResults.listen(
      (results) {
        // Do something with scan results.
        for (ScanResult r in results) {
          if (r.device.localName.contains('Earable')) {
            FlutterBluePlus.stopScan();
            connectDevice(r);
          }
        }
      },
    );

    return;
  }

  void connectDevice(ScanResult result) async {
    device = result.device;
    await result.device.connect();

    // Setup open earable manager.
    await OpenEarableManager.shared.setup(device);

    debugPrint('${device.localName} found! rssi: ${result.rssi}');
    emit(bluetoothConnectionState.BluetoothConnectionState.loaded(device, true));
    debugPrint('hereeeee ${await OpenEarableManager.shared.getDeviceIdentifier()}');
  }

  void checkout() async {
    debugPrint(
      'checkout services/characteristics for device: ${device.localName}',
    );
    await OpenEarableManager.shared.startDataStream(OEDataConfig(0, 10, 0));
  }

  void stopObserving() async {
    await device.disconnect();
    await FlutterBluePlus.stopScan();
    emit(const bluetoothConnectionState.BluetoothConnectionState.loaded(null, false));
  }
}
