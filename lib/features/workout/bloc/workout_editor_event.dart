part of 'workout_editor_bloc.dart';

sealed class WorkoutEditorEvent extends Equatable {
  const WorkoutEditorEvent();

  @override
  List<Object> get props => [];
}

class LoadWorkoutDate extends WorkoutEditorEvent {
  final DateTime selectedDate;

  const LoadWorkoutDate(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class UpdateWorkoutDate extends WorkoutEditorEvent {
  final List<WorkoutOverview> workoutOverviewList;
  final DateTime selectedDate;

  const UpdateWorkoutDate(this.selectedDate,this.workoutOverviewList );

  @override
  List<Object> get props => [selectedDate,workoutOverviewList];
}
