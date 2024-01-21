import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_tracker_state.freezed.dart';

@freezed
class WorkoutTrackerState with _$WorkoutTrackerState {
  const factory WorkoutTrackerState.initial() = WorkoutTrackerStateInitial;
  const factory WorkoutTrackerState.counting({required int pushUpCounter}) = WorkoutTrackerStateCounting;
  const factory WorkoutTrackerState.error(String message) = WorkoutTrackerStateError;
}
