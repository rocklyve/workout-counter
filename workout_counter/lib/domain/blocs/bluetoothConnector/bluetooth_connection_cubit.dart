import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bluetooth_connection_state.dart' as bluetoothConnectionState;

class BluetoothConnectionCubit extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  BluetoothConnectionCubit() : super(const bluetoothConnectionState.BluetoothConnectionState.initial());

  late StreamSubscription<List<ScanResult>> bluetoothDevices;
  late BluetoothDevice device;
  bool isConnecting = false; // Add this line to manage the connection state

  void startObserving() {}

  Future<void> connectDevice(ScanResult result) async {}

  Future<void> checkout() async {}

  Future<void> stopObserving() async {}
}
