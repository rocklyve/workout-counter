import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_state.dart';
import 'package:workout_counter/domain/models/imu_data.dart';

import '../../models/workout_type.dart';
import '../bluetoothConnector/bluetooth_connection_cubit.dart';
import '../bluetoothConnector/bluetooth_connection_state.dart';

class WorkoutTrackerCubit extends Cubit<WorkoutTrackerState> {
  final BluetoothConnectionCubit bluetoothConnectionCubit;
  StreamSubscription? imuDataSubscription;
  int _exerciseCounter = 0;
  bool _isInExercise = false;
  WorkoutType? _workoutType;

  WorkoutTrackerCubit(this.bluetoothConnectionCubit) : super(const WorkoutTrackerState.initial());

  @override
  Future<void> close() {
    imuDataSubscription?.cancel();

    return super.close();
  }

  Future<void> startCounting(WorkoutType type) async {
    if (bluetoothConnectionCubit.state is BluetoothConnectionStateConnected ||
        bluetoothConnectionCubit.state is BluetoothConnectionStateDataReceived) {
      emit(const WorkoutTrackerStateCounting(exerciseCounter: 0));
      _workoutType = type;
      _exerciseCounter = 0;
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
        if (_isExercise(state.imuData)) {
          _exerciseCounter++;
          emit(WorkoutTrackerStateCounting(exerciseCounter: _exerciseCounter));
        }
      }
    });
  }

  bool _isExercise(List<IMUData> imuData) {
    if (_workoutType == null) {
      return false;
    }

    switch (_workoutType) {
      case WorkoutType.pushUp:
        return _isPushUp(imuData);
      case WorkoutType.sitUp:
        return _isSitUp(imuData);
      default:
        return false;
    }
  }

  bool _isPushUp(List<IMUData> imuData) {
    // Implement push-up detection logic based on IMU data
    print('Z (ACC): ${imuData.last.accData.z}, (GYRO): ${imuData.last.gyroData.z}');
    const double pushUpStartThreshold = 20;
    const double pushUpEndThreshold = -10;

    IMUData latestData = imuData.last;

    if (latestData.accData.z > 4 || latestData.accData.z < -4) {
      return false;
    }

    if (!_isInExercise && latestData.gyroData.z > pushUpStartThreshold) {
      _isInExercise = true;
    } else if (_isInExercise && latestData.gyroData.z < pushUpEndThreshold) {
      _isInExercise = false;

      return true;
    }

    return false;
  }

  bool _isSitUp(List<IMUData> imuData) {
    // Implement push-up detection logic based on IMU data
    print('Z (ACC): ${imuData.last.accData.z}, (GYRO): ${imuData.last.gyroData.z}');
    const double sitUpStartThreshold = 20; // Adjust based on your data
    const double sitUpEndThreshold = -10; // Adjust based on your data

    IMUData latestData = imuData.last;

    // If latest measured acceleration is not in the range of 4 m/s^2, it's not a push-up.
    if (latestData.accData.z > 4 || latestData.accData.z < -4) {
      return false;
    }

    if (!_isInExercise && latestData.gyroData.z > sitUpStartThreshold) {
      _isInExercise = true;
    } else if (_isInExercise && latestData.gyroData.z < sitUpEndThreshold) {
      _isInExercise = false;
      return true;
    }

    return false;
  }
}
