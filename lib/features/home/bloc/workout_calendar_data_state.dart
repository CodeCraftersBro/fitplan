part of 'workout_calendar_data_bloc.dart';

sealed class WorkoutCalendarDataState extends Equatable {
  const WorkoutCalendarDataState();

  @override
  List<Object> get props => [];
}

final class WorkoutCalendarInitial extends WorkoutCalendarDataState {}

final class WorkoutCalendarLoading extends WorkoutCalendarDataState {}

// final class WorkoutCalendarDataLoaded extends WorkoutCalendarDataState {
//   final List<Workout> workouts;

//   const WorkoutCalendarDataLoaded({required this.workouts});
//   @override
//   List<Object> get props => [workouts];
// }

final class WorkoutCalendarLoaded extends WorkoutCalendarDataState {
  final List<WorkoutOverview> workoutList;

  const WorkoutCalendarLoaded({required this.workoutList});
  @override
  List<Object> get props => [];
}


final class WorkoutCalendarFailure extends WorkoutCalendarDataState {
  final Object exception;

  const WorkoutCalendarFailure(this.exception);
  @override
  List<Object> get props => [exception];
}


