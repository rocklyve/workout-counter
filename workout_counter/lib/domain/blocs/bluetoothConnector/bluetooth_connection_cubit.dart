import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:workout_counter/domain/models/imu_data.dart';
import 'package:workout_counter/domain/models/low_pass_filter.dart';

import '../../models/temperature_data.dart';
import 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<BluetoothConnectionState> {
  final FlutterReactiveBle _flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription? _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  final List<DiscoveredDevice> _discoveredDevices = [];
  final int _amountOfDataPoints = 200;
  List<IMUData> _receivedIMUData = <IMUData>[];
  List<TemperatureData> _receivedObjTemperatureData = [];
  List<TemperatureData> _receivedSensorTemperatureData = [];

  BluetoothConnectionCubit() : super(const BluetoothConnectionState.initial());

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
          // If device is not already in the list, don't add it.
          if (!_discoveredDevices.contains(device)) _discoveredDevices.add(device);
          emit(BluetoothConnectionState.observing(devices: _discoveredDevices));
        }
      },
      onError: (error) {
        emit(BluetoothConnectionState.error(error.toString()));
      },
    );
  }

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

        if (update.connectionState == DeviceConnectionState.disconnected) {
          emit(const BluetoothConnectionState.disconnected());
        }
      },
      onError: (error) {
        emit(BluetoothConnectionState.error(error.toString()));
      },
    );
  }

  Future<void> stopObserving() async {
    _scanSubscription?.cancel();
    emit(const BluetoothConnectionState.initial());
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
        (service) => service.id.toString() == '001a',
      );

      if (targetService != null) {
        await _subscribeToCharacteristic(targetService, deviceId, '200A'); // ImuCharacteristic.
        await _subscribeToCharacteristic(targetService, deviceId, '200B'); // ObjectTempCharacteristic.
        await _subscribeToCharacteristic(targetService, deviceId, '200C'); // SensorTempCharacteristic.
        emit(const BluetoothConnectionState.connected());
      } else {
        emit(const BluetoothConnectionState.error('Target service not found'));
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

    LowPassFilter accXFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter accYFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter accZFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter gyroXFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter gyroYFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter gyroZFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter magXFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter magYFilter = LowPassFilter(alpha: 0.1);
    LowPassFilter magZFilter = LowPassFilter(alpha: 0.1);

    StreamSubscription _ = _flutterReactiveBle.subscribeToCharacteristic(characteristic).listen(
      (data) {
        // Handle received data for each characteristic.
        String receivedString = String.fromCharCodes(data);
        // Print("Received data from $characteristicUuid: $receivedString");.
        IMUData? imuData = _getIMUData(receivedString, characteristicUuid);
        if (imuData != null) {
          imuData = _filterIMUData(imuData, accXFilter, accYFilter, accZFilter, gyroXFilter, gyroYFilter, gyroZFilter,
              magXFilter, magYFilter, magZFilter);
          _receivedIMUData.add(imuData);
        }
        if (_receivedIMUData.length > _amountOfDataPoints) _receivedIMUData.removeAt(0);

        TemperatureData? objTempData = _getObjTempData(receivedString, characteristicUuid);
        if (objTempData != null) _receivedObjTemperatureData.add(objTempData);
        if (_receivedObjTemperatureData.length > _amountOfDataPoints) _receivedObjTemperatureData.removeAt(0);

        TemperatureData? sensorTempData = _getSensorTempData(receivedString, characteristicUuid);
        if (sensorTempData != null) _receivedSensorTemperatureData.add(sensorTempData);
        if (_receivedSensorTemperatureData.length > _amountOfDataPoints) _receivedSensorTemperatureData.removeAt(0);

        // Create new instances of the lists for the new state.
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

  IMUData _filterIMUData(
    IMUData data,
    LowPassFilter accXFilter,
    LowPassFilter accYFilter,
    LowPassFilter accZFilter,
    LowPassFilter gyroXFilter,
    LowPassFilter gyroYFilter,
    LowPassFilter gyroZFilter,
    LowPassFilter magXFilter,
    LowPassFilter magYFilter,
    LowPassFilter magZFilter,
  ) {
    data.accData.x = accXFilter.filter(data.accData.x);
    data.accData.y = accYFilter.filter(data.accData.y);
    data.accData.z = accZFilter.filter(data.accData.z);
    data.gyroData.x = gyroXFilter.filter(data.gyroData.x);
    data.gyroData.y = gyroYFilter.filter(data.gyroData.y);
    data.gyroData.z = gyroZFilter.filter(data.gyroData.z);
    data.magData.x = magXFilter.filter(data.magData.x);
    data.magData.y = magYFilter.filter(data.magData.y);
    data.magData.z = magZFilter.filter(data.magData.z);

    return data;
  }

  IMUData? _getIMUData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200A') {
      return IMUData.fromString(receivedString);
    }

    return null;
  }

  TemperatureData? _getObjTempData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200B') {
      TemperatureData data = TemperatureData.fromString(receivedString);
      if (_receivedObjTemperatureData.isNotEmpty) {
        data.temperatureSensor1 = data.temperatureSensor1 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor1
            : data.temperatureSensor1;
        data.temperatureSensor2 = data.temperatureSensor2 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor2
            : data.temperatureSensor2;
        data.temperatureSensor3 = data.temperatureSensor3 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor3
            : data.temperatureSensor3;
        data.temperatureSensor4 = data.temperatureSensor4 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor4
            : data.temperatureSensor4;
        data.temperatureSensor5 = data.temperatureSensor5 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor5
            : data.temperatureSensor5;
        data.temperatureSensor6 = data.temperatureSensor6 == 0
            ? _receivedObjTemperatureData.last.temperatureSensor6
            : data.temperatureSensor6;
      }

      return data;
    }

    return null;
  }

  TemperatureData? _getSensorTempData(String receivedString, String characteristicUuid) {
    if (characteristicUuid == '200C') {
      TemperatureData data = TemperatureData.fromString(receivedString);
      if (_receivedSensorTemperatureData.isNotEmpty) {
        data.temperatureSensor1 = data.temperatureSensor1 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor1
            : data.temperatureSensor1;
        data.temperatureSensor2 = data.temperatureSensor2 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor2
            : data.temperatureSensor2;
        data.temperatureSensor3 = data.temperatureSensor3 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor3
            : data.temperatureSensor3;
        data.temperatureSensor4 = data.temperatureSensor4 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor4
            : data.temperatureSensor4;
        data.temperatureSensor5 = data.temperatureSensor5 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor5
            : data.temperatureSensor5;
        data.temperatureSensor6 = data.temperatureSensor6 == 0
            ? _receivedSensorTemperatureData.last.temperatureSensor6
            : data.temperatureSensor6;

        return data;
      }

      return null;
    }
  }
}
