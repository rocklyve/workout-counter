import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_state.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import '../../domain/blocs/workoutTracker/workout_tracker_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/sensor_data_chart.dart';

@RoutePage()
class WorkoutTrackerPage extends StatefulWidget {
  const WorkoutTrackerPage({Key? key}) : super(key: key);

  @override
  _WorkoutTrackerPageState createState() => _WorkoutTrackerPageState();
}

class _WorkoutTrackerPageState extends State<WorkoutTrackerPage> {
  Widget _buildTemperatureCharts() {
    return BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
      builder: (context, state) {
        return (state is BluetoothConnectionStateDataReceived)
            ? Column(children: [
                Row(children: [
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 0,
                  )),
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 1,
                  )),
                ]),
                Row(children: [
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 2,
                  )),
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 3,
                  )),
                ]),
                Row(children: [
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 4,
                  )),
                  Expanded(
                      child: SensorDataChart(
                    objectTempData: state.objectTempData,
                    sensorTempData: state.sensorTempData,
                    sensorIndex: 5,
                  )),
                ]),
              ])
            : Container();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tracker',
      ),
      body: BlocBuilder<WorkoutTrackerCubit, WorkoutTrackerState>(
        builder: (context, state) {
          if (state is WorkoutTrackerStateCounting) {
            return Center(
              child: Column(
                children: [
                  AnimatedFlipCounter(
                    duration: const Duration(milliseconds: 300),
                    value: state.exerciseCounter,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 120,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // button which closes the page
                  _buildTemperatureCharts(),
                  ElevatedButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text('Stop'),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Center(
              child: Column(
                children: [
                  Text('Counter not started yet'),
                  const SizedBox(height: 20),
                  // button which closes the page
                  ElevatedButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
