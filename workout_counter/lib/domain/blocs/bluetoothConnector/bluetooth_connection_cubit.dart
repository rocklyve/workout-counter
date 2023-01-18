import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:open_earable/open_earable_manager.dart';

import 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<BluetoothConnectionState> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  BluetoothConnectionCubit() : super(const BluetoothConnectionState.initial());

  late StreamSubscription<List<ScanResult>> bluetoothDevices;
  late BluetoothDevice device;

  void startObserving() {
    // Start search process to look for the ble devices.
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    // Listen to scan results.
    bluetoothDevices = flutterBlue.scanResults.listen(
      (results) {
        // do something with scan results
        for (ScanResult r in results) {
          if (r.device.name.contains('Earable')) {
            flutterBlue.stopScan();
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

    debugPrint('${result.device.name} found! rssi: ${result.rssi}');
    emit(BluetoothConnectionState.loaded(device, true));
    debugPrint(
        'hereeeee ${await OpenEarableManager.shared.getDeviceIdentifier()}');
  }

  void checkout() async {
    debugPrint(
      'checkout services/characteristics for device: ${device.name}',
    );
    await OpenEarableManager.shared.startDataStream();
  }

  void stopObserving() async {
    await device.disconnect();
    emit(const BluetoothConnectionState.loaded(null, false));
    await flutterBlue.stopScan();
  }
}
