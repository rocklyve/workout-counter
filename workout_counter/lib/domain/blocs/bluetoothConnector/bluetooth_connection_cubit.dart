import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:workout_counter/domain/models/imu_data.dart';

import '../../models/temperature_data.dart';
import 'bluetooth_connection_state.dart' as bluetoothConnectionState;
import 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  final FlutterReactiveBle _flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  QualifiedCharacteristic? _dataCharacteristic;
  final List<DiscoveredDevice> _discoveredDevices = [];
  final int _amountOfDataPoints = 500;
  List<IMUData> _receivedIMUData = [];
  List<TemperatureData> _receivedObjTemperatureData = [];
  List<TemperatureData> _receivedSensorTemperatureData = [];

  BluetoothConnectionCubit() : super(const bluetoothConnectionState.BluetoothConnectionState.initial());

  void startObserving() {
    if (_scanSubscription != null) {
      return;
    }

    _discoveredDevices.clear();

    _scanSubscription = _flutterReactiveBle.scanForDevices(
      withServices: [], // Add required service UUIDs here.
      scanMode: ScanMode.lowLatency,
    ).listen(
      (device) {
        if (device.name.contains('DataTracker') && !_discoveredDevices.contains(device)) {
          print('add device: ${device.name}, ${device.id}');
          _discoveredDevices.add(device);
          emit(BluetoothConnectionState.observing(devices: _discoveredDevices));
        }
      },
      onError: (error) {
        emit(BluetoothConnectionState.error(error.toString()));
      },
    );
  }

  List<DiscoveredDevice> get discoveredDevices => List.unmodifiable(_discoveredDevices);

  Future<void> connectToDevice(String deviceId) async {
    emit(const BluetoothConnectionState.connecting());
    _connection = await _flutterReactiveBle
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    )
        .listen(
      (update) {
        print('connection update: $update');
        if (update.connectionState == DeviceConnectionState.connected ||
            update.connectionState == DeviceConnectionState.connecting) {
          _discoverServices(deviceId);
        }
      },
      onError: (error) {
        emit(BluetoothConnectionState.error(error.toString()));
      },
    );
  }

  Future<void> stopObserving() async {
    _scanSubscription?.cancel();
    emit(const bluetoothConnectionState.BluetoothConnectionState.initial());
  }

  @override
  Future<void> close() {
    _scanSubscription?.cancel();

    return super.close();
  }

  Future<void> _discoverServices(String deviceId) async {
    try {
      final services = await _flutterReactiveBle.getDiscoveredServices(deviceId);
      print('services: $services');
      final targetService = services.firstWhere(
        (service) => service.id.toString() == "001a",
      );

      if (targetService != null) {
        await _subscribeToCharacteristic(targetService, deviceId, "200A"); // imuCharacteristic
        await _subscribeToCharacteristic(targetService, deviceId, "200B"); // objectTempCharacteristic
        await _subscribeToCharacteristic(targetService, deviceId, "200C"); // sensorTempCharacteristic
        emit(BluetoothConnectionState.connected());
      } else {
        emit(BluetoothConnectionState.error("Target service not found"));
      }
    } catch (e) {
      emit(BluetoothConnectionState.error(e.toString()));
    }
  }

  Future<void> _subscribeToCharacteristic(Service service, String deviceId, String characteristicUuid) async {
    final characteristic = QualifiedCharacteristic(
      serviceId: service.id,
      characteristicId: Uuid.parse(characteristicUuid),
      deviceId: deviceId,
    );

    StreamSubscription _ = _flutterReactiveBle.subscribeToCharacteristic(characteristic).listen(
      (data) {
        // Handle received data for each characteristic
        String receivedString = String.fromCharCodes(data);
        // print("Received data from $characteristicUuid: $receivedString");
        IMUData? imuData = _getIMUData(receivedString, characteristicUuid);
        if (imuData != null) _receivedIMUData.add(imuData);
        if (_receivedIMUData.length > _amountOfDataPoints) _receivedIMUData.removeAt(0);

        TemperatureData? objTempData = _getObjTempData(receivedString, characteristicUuid);
        if (objTempData != null) _receivedObjTemperatureData.add(objTempData);
        if (_receivedObjTemperatureData.length > _amountOfDataPoints) _receivedObjTemperatureData.removeAt(0);

        TemperatureData? sensorTempData = _getSensorTempData(receivedString, characteristicUuid);
        if (sensorTempData != null) _receivedSensorTemperatureData.add(sensorTempData);
        if (_receivedSensorTemperatureData.length > _amountOfDataPoints) _receivedSensorTemperatureData.removeAt(0);

        // Create new instances of the lists for the new state
        var newIMUData = List<IMUData>.of(_receivedIMUData);
        var newObjTempData = List<TemperatureData>.of(_receivedObjTemperatureData);
        var newSensorTempData = List<TemperatureData>.of(_receivedSensorTemperatureData);

        emit(BluetoothConnectionState.dataReceived(
          imuData: newIMUData,
          objectTempData: newObjTempData,
          sensorTempData: newSensorTempData,
        ));
      },
      onError: (error) {
        emit(BluetoothConnectionState.error(
          error.toString(),
        ));
      },
    );
  }

  IMUData? _getIMUData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200A') {
      return IMUData.fromString(receivedString);
    }

    return null;
  }

  TemperatureData? _getObjTempData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200B') {
      return TemperatureData.fromString(receivedString);
    }

    return null;
  }

  TemperatureData? _getSensorTempData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200C') {
      return TemperatureData.fromString(receivedString);
    }

    return null;
  }
}
