import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import 'bluetooth_connection_state.dart' as bluetoothConnectionState;
import 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<bluetoothConnectionState.BluetoothConnectionState> {
  final FlutterReactiveBle _flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  QualifiedCharacteristic? _dataCharacteristic;
  final List<DiscoveredDevice> _discoveredDevices = [];

  BluetoothConnectionCubit() : super(const bluetoothConnectionState.BluetoothConnectionState.initial());

  void startObserving() {
    print('startObserving');
    if (_scanSubscription != null) {
      return;
    }

    _discoveredDevices.clear();

    _scanSubscription = _flutterReactiveBle.scanForDevices(
      withServices: [], // Add required service UUIDs here.
      scanMode: ScanMode.lowLatency,
    ).listen(
      (device) {
        if (device.name.contains("DataTracker") && !_discoveredDevices.contains(device)) {
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
    print('connectToDevice: $deviceId');
    emit(BluetoothConnectionState.connecting());
    _connection = await _flutterReactiveBle
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    )
        .listen((update) {
      print('connection update: $update');
      if (update.connectionState == DeviceConnectionState.connected ||
          update.connectionState == DeviceConnectionState.connecting) {
        _discoverServices(deviceId);
      }
    }, onError: (error) {
      emit(BluetoothConnectionState.error(error.toString()));
    });
  }

  Future<void> _discoverServices(String deviceId) async {
    print('_discoverServices: $deviceId');
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

    print('subscribeToCharacteristic: $characteristic');
    _flutterReactiveBle.subscribeToCharacteristic(characteristic).listen((data) {
      // Handle received data for each characteristic
      String receivedString = String.fromCharCodes(data);
      print("Received data from $characteristicUuid: $receivedString");
    }, onError: (error) {
      emit(BluetoothConnectionState.error(error.toString()));
    });
  }

  Future<void> _subscribeToNotifications(QualifiedCharacteristic characteristic) async {
    print('subscribeToNotifications: $characteristic');
    _flutterReactiveBle.subscribeToCharacteristic(characteristic).listen((data) {
      // Handle received data
      String receivedString = String.fromCharCodes(data);
      print("Received data: $receivedString");
    }, onError: (error) {
      emit(BluetoothConnectionState.error(error.toString()));
    });
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
}
