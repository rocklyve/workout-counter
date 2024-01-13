import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_earable_flutter/src/open_earable_flutter.dart';

import 'bluetooth_connection_state.dart' as bluetoothConnectionState;

class BluetoothConnectionCubit extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  BluetoothConnectionCubit() : super(const bluetoothConnectionState.BluetoothConnectionState.initial());

  final OpenEarable _openEarable = OpenEarable();
  StreamSubscription? _scanSubscription;
  List discoveredDevices = [];
  bool _connectedToEarable = false;
  bool _waitingToConnect = false;
  String? _deviceIdentifier;
  String? _deviceFirmwareVersion;

  void startObserving() {
    _startScanning();
  }

  void _startScanning() async {
    emit(const bluetoothConnectionState.BluetoothConnectionState.loading());
    discoveredDevices.removeWhere((device) => device.id != _openEarable.bleManager.connectedDevice?.id);
    _openEarable.bleManager.startScan();
    _scanSubscription?.cancel();
    _scanSubscription = _openEarable.bleManager.scanStream.listen((incomingDevice) {
      if (incomingDevice.name.isNotEmpty && !discoveredDevices.any((device) => device.id == incomingDevice.id)) {
        discoveredDevices.add(incomingDevice);
        _connectedToEarable = true;
        print('found device: ${incomingDevice.name}');
        if (!_waitingToConnect && incomingDevice.name.contains('Earable')) {
          _waitingToConnect = true;
          _connectToDevice(incomingDevice);
        }
      }
    });
  }

  Future<void> _connectToDevice(device) async {
    _scanSubscription?.cancel();
    await _openEarable.bleManager.connectToDevice(device);
  }

  Future<void> _writeSensorConfig() async {
    OpenEarableSensorConfig config = OpenEarableSensorConfig(sensorId: 3, samplingRate: 0, latency: 0);
    _openEarable.sensorManager.writeSensorConfig(config);
    //_openEarable.sensorManager.subscribeToSensorData(3);
  }

  Future<void> connectDevice() async {}

  Future<void> checkout() async {}

  Future<void> stopObserving() async {}
}
