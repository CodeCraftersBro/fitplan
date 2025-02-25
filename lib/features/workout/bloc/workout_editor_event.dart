part of 'workout_editor_bloc.dart';
sealed class WorkoutEditorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWorkoutDate extends WorkoutEditorEvent {
  final DateTime selectedDate;

  LoadWorkoutDate({required this.selectedDate});

  @override
  List<Object?> get props => [selectedDate];
}

class UpdateWorkoutDate extends WorkoutEditorEvent {
  final DateTime selectedDate;
  final List<WorkoutOverview> workoutOverviewList;

  UpdateWorkoutDate(this.selectedDate, this.workoutOverviewList);

  @override
  List<Object?> get props => [selectedDate, workoutOverviewList];
}

class ReorderWorkouts extends WorkoutEditorEvent {
  final DateTime selectedDate;
  final List<WorkoutOverview> oldWorkoutList;
  final List<WorkoutOverview> newWorkoutList;

  ReorderWorkouts({
    required this.selectedDate,
    required this.oldWorkoutList,
    required this.newWorkoutList,
  });

  @override
  List<Object?> get props => [selectedDate, oldWorkoutList, newWorkoutList];
}
