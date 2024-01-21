import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_state.dart';

import '../../domain/blocs/workoutTracker/workout_tracker_cubit.dart';

@RoutePage()
class WorkoutTrackerPage extends StatefulWidget {
  const WorkoutTrackerPage({Key? key}) : super(key: key);

  @override
  _WorkoutTrackerPageState createState() => _WorkoutTrackerPageState();
}

class _WorkoutTrackerPageState extends State<WorkoutTrackerPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutTrackerCubit, WorkoutTrackerState>(
      builder: (context, state) {
        if (state is WorkoutTrackerStateCounting) {
          return Center(
            child: Text('Push-ups: ${state.pushUpCounter}'),
          );
        }

        return const Center(
          child: Text('Counter not started yet'),
        );
      },
    );
  }
}
