import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/workoutTracker/workout_tracker_state.dart';

import '../../domain/blocs/workoutTracker/workout_tracker_cubit.dart';
import '../widgets/custom_app_bar.dart';

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
                    value: state.pushUpCounter,
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
