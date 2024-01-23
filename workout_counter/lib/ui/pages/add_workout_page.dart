import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/routing/router.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import '../../domain/blocs/workoutTracker/workout_tracker_cubit.dart';
import '../../domain/models/workout_type.dart';
import '../widgets/custom_app_bar.dart';

@RoutePage()
class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  final _formKey = GlobalKey<FormState>();
  final List<WorkoutType> _workoutType = [WorkoutType.sitUp, WorkoutType.pushUp];

  WorkoutType? _selectedWorkoutType;

  @override
  void initState() {
    super.initState();
    _selectedWorkoutType = _workoutType.first; // Default to the first workout type
  }

  void _startWorkout() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var bleState = context.read<BluetoothConnectionCubit>().state;
      if (bleState is BluetoothConnectionStateConnected || bleState is BluetoothConnectionStateDataReceived) {
        // call WorkoutTrackerCubit function to start workout
        context.read<WorkoutTrackerCubit>().startCounting(_selectedWorkoutType!);

        context.router.push(const WorkoutTrackerRoute());
      } else {
        print('Bluetooth connection not active. Opening connection page.');

        context.router.push(const BluetoothConnectionRoute());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Workout'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<WorkoutType>(
                value: _selectedWorkoutType,
                decoration: const InputDecoration(labelText: 'Workout Type'),
                onChanged: (WorkoutType? newValue) {
                  _selectedWorkoutType = newValue;
                },
                items: _workoutType.map<DropdownMenuItem<WorkoutType>>((WorkoutType value) {
                  return DropdownMenuItem<WorkoutType>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),
              const SizedBox(height: 50),
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
