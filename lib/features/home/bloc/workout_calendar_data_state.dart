part of 'workout_calendar_data_bloc.dart';

sealed class WorkoutCalendarDataState extends Equatable {
  const WorkoutCalendarDataState();

  @override
  List<Object> get props => [];
}

final class WorkoutCalendarDataInitial extends WorkoutCalendarDataState {}

final class WorkoutCalendarLoading extends WorkoutCalendarDataState {}

final class WorkoutCalendarDataLoaded extends WorkoutCalendarDataState {
  final List<Workout> workouts;

  const WorkoutCalendarDataLoaded({required this.workouts});
  @override
  List<Object> get props => [workouts];
}
