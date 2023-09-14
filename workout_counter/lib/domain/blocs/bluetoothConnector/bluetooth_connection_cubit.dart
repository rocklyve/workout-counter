import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:open_earable/domain/open_earable_data_config.dart';
import 'package:open_earable/domain/open_earable_sensor_data_packet.dart';
import 'package:open_earable/open_earable_manager.dart';

import 'bluetooth_connection_state.dart' as bluetoothConnectionState;

class BluetoothConnectionCubit
    extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  BluetoothConnectionCubit()
      : super(
            const bluetoothConnectionState.BluetoothConnectionState.initial());

  late StreamSubscription<List<ScanResult>> bluetoothDevices;
  late BluetoothDevice device;
  bool isConnecting = false; // Add this line to manage the connection state

  void startObserving() {
    print('start observing called');
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    bluetoothDevices = FlutterBluePlus.scanResults.listen(
      (results) {
        for (ScanResult r in results) {
          if (r.device.localName.contains('Earable') ||
              r.device.localName.contains('NANO-')) {
            if (isConnecting) {
              // Check if already connecting
              return;
            }
            isConnecting = true; // Set flag to true as you start connecting

            FlutterBluePlus.stopScan();
            connectDevice(r);
          }
        }
      },
    );
  }

  Future<void> connectDevice(ScanResult result) async {
    print('connect device called');
    device = result.device;
    await result.device.connect();

    // After successful connection, you may reset the flag
    isConnecting = false;

    await OpenEarableManager.shared.setup(device);

    debugPrint('${device.localName} found! rssi: ${result.rssi}');
    emit(
        bluetoothConnectionState.BluetoothConnectionState.loaded(device, true));
    debugPrint(
        'device Identifier: ${await OpenEarableManager.shared.getDeviceIdentifier()}');
  }

  Future<void> checkout() async {
    debugPrint(
        'checkout services/characteristics for device: ${device.localName}');
    Stream<OESensorDataPacket> dataStream =
        await OpenEarableManager.shared.startDataStream(OEDataConfig(0, 32, 0));
    double threshold = 40; // Just an example value
    double lastValue = 0;
    int pushupCount = 0;
    bool isGoingUp = false;

    dataStream.listen((event) {
      OESensorDataPacket packet = event;
      debugPrint('data: ${packet.data}');
      double zValue = packet.data['acc_z'];

      if (zValue > lastValue + threshold) {
        if (!isGoingUp) {
          isGoingUp = true;
        }
      } else if (zValue < lastValue - threshold) {
        if (isGoingUp) {
          isGoingUp = false;
          pushupCount++;
        }
      }

      lastValue = zValue;
      debugPrint('Push-up count: $pushupCount');
    });
  }

  Future<void> stopObserving() async {
    await device.disconnect();

    // You may also reset the flag here if the device gets disconnected
    isConnecting = false;

    await FlutterBluePlus.stopScan();
    emit(const bluetoothConnectionState.BluetoothConnectionState.loaded(
        null, false));
  }
}
