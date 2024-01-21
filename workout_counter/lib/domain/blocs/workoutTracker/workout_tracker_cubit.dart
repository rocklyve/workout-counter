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
    return false;
  }
}
