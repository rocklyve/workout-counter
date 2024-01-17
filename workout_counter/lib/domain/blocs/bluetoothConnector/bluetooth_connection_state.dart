import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_ble_platform_interface/src/model/discovered_device.dart';
import 'package:workout_counter/domain/models/imu_data.dart';
import 'package:workout_counter/domain/models/temperature_data.dart';

part 'bluetooth_connection_state.freezed.dart';

@freezed
class BluetoothConnectionState with _$BluetoothConnectionState {
  const factory BluetoothConnectionState.initial() = BluetoothConnectionStateInitial;
  const factory BluetoothConnectionState.observing({required List<DiscoveredDevice> devices}) =
      BluetoothConnectionStateObserving;
  const factory BluetoothConnectionState.connecting() = BluetoothConnectionStateConnecting;
  const factory BluetoothConnectionState.connected() = BluetoothConnectionStateConnected;
  const factory BluetoothConnectionState.dataReceived({
    required List<IMUData> imuData,
    required List<TemperatureData> objectTempData,
    required List<TemperatureData> sensorTempData,
  }) = BluetoothConnectionStateDataReceived;
  const factory BluetoothConnectionState.disconnecting() = BluetoothConnectionStateDisconnecting;
  const factory BluetoothConnectionState.disconnected() = BluetoothConnectionStateDisconnected;
  const factory BluetoothConnectionState.error(String message) = BluetoothConnectionStateError;
}
