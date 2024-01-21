import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_cubit.dart';
import 'package:workout_counter/routing/router.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';

@RoutePage()
class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String _workoutType = "Pushups";
  int _target = 0;
  int _time = 0;

  void _startWorkout() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var bleState = context.read<BluetoothConnectionCubit>().state;
      if (bleState is BluetoothConnectionStateConnected || bleState is BluetoothConnectionStateDataReceived) {
        print('Starting workout with type $_workoutType, target $_target, time $_time');

        // call WorkoutTrackerCubit function to start workout
        context.read<WorkoutTrackerCubit>().startCounting();

        context.router.push(const WorkoutTrackerRoute());
      } else {
        print('Bluetooth connection not active. Opening connection page.');
        context.router.push(const BluetoothConnectionRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Workout')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Target (0 for unlimited)'),
                keyboardType: TextInputType.number,
                initialValue: '0',
                onSaved: (value) => _target = int.parse(value ?? '0'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Time in seconds (0 for unlimited)'),
                keyboardType: TextInputType.number,
                initialValue: '0',
                onSaved: (value) => _time = int.parse(value ?? '0'),
              ),
              ElevatedButton(
                onPressed: _startWorkout,
                child: const Text('Start Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
