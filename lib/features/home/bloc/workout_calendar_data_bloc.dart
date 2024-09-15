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
    
    log('_onLoadWorkoutCalendarData');
    try {

     emit(WorkoutCalendarLoading());
      
      final dateWithoutTime =
          DateTimeUtils.getDateWithoutTime(event.selectedDate);
      final workoutList =
          await workoutRepository.getExerciseListByDate(dateWithoutTime);

      // Собираем список WorkoutEntity
      List<WorkoutOverview> workoutEntities = [];
      for (int i = 0; i < workoutList.length; i++) {
        final workout = workoutList[i];
        final exercise = await exerciseRepository.getExerciseById(workout.exerciseId);
        if (exercise == null) {
          throw Exception("Exercise not found for id ${workout.exerciseId}");
        }
        final exerciseType = await exerciseTypeRepository.getExerciseTypeById(exercise.exerciseTypeId);

        // Проверяем, что exerciseType не null
        if (exerciseType == null) {
          throw Exception("ExerciseType not found for id ${exercise.exerciseTypeId}");
        }

      
        // Логика для определения workoutExerciseIndicator
      String exerciseIndicator = "middle"; // По умолчанию - middle

  final bool currentIsSet = workout.isSet;
  final int currentSetId = workout.setId;

  // Получаем информацию о предыдущем и следующем элементах
  final bool? previousIsSet = i > 0 ? workoutList[i - 1].isSet : null;
  final int? previousSetId = i > 0 ? workoutList[i - 1].setId : null;

  final bool? nextIsSet = i < workoutList.length - 1 ? workoutList[i + 1].isSet : null;
  final int? nextSetId = i < workoutList.length - 1 ? workoutList[i + 1].setId : null;

  if (currentIsSet) {
    if (i == 0) {
      // Первый элемент в наборе
      exerciseIndicator = "down";
    } else if (i == workoutList.length - 1) {
      // Последний элемент в наборе
      exerciseIndicator = "up";
    } else if (!previousIsSet! || previousSetId != currentSetId) {
      // Текущий элемент первый в наборе, а предыдущий не в наборе или с другим setId
      exerciseIndicator = "down";
    } else if (!nextIsSet! || nextSetId != currentSetId) {
      // Текущий элемент последний в наборе, а следующий не в наборе или с другим setId
      exerciseIndicator = "up";
    } else {
      // Текущий элемент находится в середине сета
      exerciseIndicator = "middle";
    }
  } else {
    exerciseIndicator = ""; // Элемент не в наборе
  }
        final workoutEntity = WorkoutOverview(
          workoutId: workout.id,
          workoutSort: workout.sort, 
          workoutIsSet: workout.isSet, 
          workoutSetId: workout.setId,
          workoutExerciseIndicator:  exerciseIndicator, 
          workoutExerciseId: workout.exerciseId, 
          workoutExerciseName: exercise.name, 
          workoutExerciseTypeId: exerciseType.id, 
          workoutExerciseTypeName: exerciseType.name, 
          workoutExerciseTypeIcon: exerciseType.icon, 
          workoutExerciseTypeCategory: exerciseType.category,
        );

        workoutEntities.add(workoutEntity);
        log(exercise.name+ "||" + workout.isSet.toString()+ "||" + workout.setId.toString());
      }
      
      emit(
        WorkoutCalendarLoaded(workoutList: workoutEntities),
      );
    } catch (e) {
      emit(WorkoutCalendarFailure(e));
    }
  }

}
