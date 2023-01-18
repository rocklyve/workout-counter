import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../utils/print.dart';
import 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<BluetoothConnectionState> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  BluetoothConnectionCubit() : super(const BluetoothConnectionState.initial());

  late StreamSubscription<List<ScanResult>> bluetoothDevices;
  late BluetoothDevice device;

  void startObserving() {
    // Start stream subscription and return stream.
    print('now start looking for ble devices');
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

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
    debugPrintNoOp('${result.device.name} found! rssi: ${result.rssi}');
    emit(BluetoothConnectionState.loaded(device, true));
  }

  void checkout() async {
    debugPrintNoOp(
      'checkout services/characteristics for device: ${device.name}',
    );
    List<BluetoothService> services = await device.discoverServices();
    debugPrintNoOp('found ${services.length} services');
    services.forEach(
      (service) {
        debugPrintNoOp(
          'found ${service.characteristics.length} characteristics for service ${service.uuid}',
        );
        service.characteristics.forEach(
          (characteristic) async {
            List<int> value = await characteristic.read();
            debugPrintNoOp('read: $value');
          },
        );
        // Do something with service.
      },
    );
  }

  void stopObserving() async {
    await device.disconnect();
    emit(const BluetoothConnectionState.loaded(null, false));
    await flutterBlue.stopScan();
  }
}
