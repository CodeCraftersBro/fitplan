import 'dart:developer';

import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_calendar_data_event.dart';
part 'workout_calendar_data_state.dart';

class WorkoutCalendarDataBloc
    extends Bloc<WorkoutCalendarDataEvent, WorkoutCalendarDataState> {
  final WorkoutRepositoryInterface workoutRepository;
  WorkoutCalendarDataBloc(this.workoutRepository)
      : super(WorkoutCalendarDataInitial()) {
    on<LoadWorkoutCalendarData>((event, emit) async {
      log(event.selectedDate.toString());
      final workoutList =
          await workoutRepository.getExerciseListByDate(event.selectedDate);
      emit(
        WorkoutCalendarDataLoaded(workouts: workoutList),
      );
    });
  }
}
