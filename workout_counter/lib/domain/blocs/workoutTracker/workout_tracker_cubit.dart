import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_state.dart';
import 'package:workout_counter/domain/models/imu_data.dart';

import '../bluetoothConnector/bluetooth_connection_cubit.dart';
import '../bluetoothConnector/bluetooth_connection_state.dart';

class WorkoutTrackerCubit extends Cubit<WorkoutTrackerState> {
  final BluetoothConnectionCubit bluetoothConnectionCubit;
  StreamSubscription? imuDataSubscription;
  int _pushUpCounter = 0;
  bool _isInPushup = false;

  WorkoutTrackerCubit(this.bluetoothConnectionCubit) : super(const WorkoutTrackerState.initial());

  @override
  Future<void> close() {
    imuDataSubscription?.cancel();

    return super.close();
  }

  Future<void> startCounting() async {
    if (bluetoothConnectionCubit.state is BluetoothConnectionStateConnected ||
        bluetoothConnectionCubit.state is BluetoothConnectionStateDataReceived) {
      emit(const WorkoutTrackerStateCounting(pushUpCounter: 0));
      _pushUpCounter = 0;
      _subscribeToIMUData();
    } else {
      emit(const WorkoutTrackerStateError('No device connected'));
    }
  }

  Future<void> stopCounting() async {
    imuDataSubscription?.cancel();
    emit(const WorkoutTrackerState.initial());
  }

  void _subscribeToIMUData() {
    imuDataSubscription = bluetoothConnectionCubit.stream.listen((state) {
      if (state is BluetoothConnectionStateDataReceived) {
        if (_isPushUp(state.imuData)) {
          _pushUpCounter++;
          emit(WorkoutTrackerStateCounting(pushUpCounter: _pushUpCounter));
        }
      }
    });
  }

  bool _isPushUp(List<IMUData> imuData) {
    // Implement push-up detection logic based on IMU data
    print('Z (ACC): ${imuData.last.accData.z}, (GYRO): ${imuData.last.gyroData.z}');
    const double pushUpStartThreshold = 20; // Adjust based on your data
    const double pushUpEndThreshold = -10; // Adjust based on your data

    IMUData latestData = imuData.last;

    // If latest measured acceleration is not in the range of 4 m/s^2, it's not a push-up.
    if (latestData.accData.z > 4 || latestData.accData.z < -4) {
      return false;
    }

    if (!_isInPushup && latestData.gyroData.z > pushUpStartThreshold) {
      _isInPushup = true;
    } else if (_isInPushup && latestData.gyroData.z < pushUpEndThreshold) {
      _isInPushup = false;
      return true;
    }

    return false;
  }
}
