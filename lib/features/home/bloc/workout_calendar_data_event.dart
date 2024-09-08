part of 'workout_calendar_data_bloc.dart';

sealed class WorkoutCalendarDataEvent extends Equatable {}

class LoadWorkoutCalendarData extends WorkoutCalendarDataEvent {
  final DateTime selectedDate;

   LoadWorkoutCalendarData({required this.selectedDate});

  @override
  List<Object> get props => [selectedDate];
}


