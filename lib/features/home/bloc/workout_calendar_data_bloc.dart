import 'dart:developer';

import 'package:fitplan/repositories/workout/entity/workout_overview.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:fitplan/utils/date_time_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_calendar_data_event.dart';
part 'workout_calendar_data_state.dart';

class WorkoutCalendarDataBloc
    extends Bloc<WorkoutCalendarDataEvent, WorkoutCalendarDataState> {
  final WorkoutRepositoryInterface workoutRepository;
  final ExerciseRepositoryInterface exerciseRepository;
  final ExerciseTypeRepositoryInterface exerciseTypeRepository;

  WorkoutCalendarDataBloc(this.workoutRepository, this.exerciseRepository,
      this.exerciseTypeRepository)
      : super(WorkoutCalendarInitial()) {
    on<WorkoutCalendarDataEvent>((event, emit) async => switch (event) {
          LoadWorkoutCalendarData() => _onLoadWorkoutCalendarData(event, emit)
        });
  }

  Future<void> _onLoadWorkoutCalendarData(
    LoadWorkoutCalendarData event,
    Emitter<WorkoutCalendarDataState> emit,
  ) async {
    emit(WorkoutCalendarLoading());
    log('_onLoadWorkoutCalendarData');
    try {

      
      final dateWithoutTime =
          DateTimeUtils.getDateWithoutTime(event.selectedDate);
      final workoutList =
          await workoutRepository.getExerciseListByDate(dateWithoutTime);

      // Собираем список WorkoutEntity
      List<WorkoutOverview> workoutEntities = [];
      for (var workout in workoutList) {
        
        final exercise = await exerciseRepository.getExerciseById(workout.exerciseId);
        if (exercise == null) {
          throw Exception("Exercise not found for id ${workout.exerciseId}");
        }
        final exerciseType = await exerciseTypeRepository.getExerciseTypeById(exercise.exerciseTypeId);

        // Проверяем, что exerciseType не null
        if (exerciseType == null) {
          throw Exception("ExerciseType not found for id ${exercise.exerciseTypeId}");
        }

        final workoutEntity = WorkoutOverview(
          workoutId: workout.id,
          workoutSort: workout.sort, 
          workoutIsSet: workout.isSet, 
          workoutExerciseIndicator: workout.exerciseIndicator, 
          workoutExerciseId: workout.exerciseId, 
          workoutExerciseName: exercise.name, 
          workoutExerciseTypeId: exerciseType.id, 
          workoutExerciseTypeName: exerciseType.name, 
          workoutExerciseTypeIcon: exerciseType.icon,
        );

        workoutEntities.add(workoutEntity);
      }

      emit(
        WorkoutCalendarLoaded(workoutList: workoutEntities),
      );
      // emit(
      //   WorkoutCalendarDataLoaded(workouts: workoutList),
      // );
    } catch (e) {
      emit(WorkoutCalendarFailure(e));
    }
  }

}
