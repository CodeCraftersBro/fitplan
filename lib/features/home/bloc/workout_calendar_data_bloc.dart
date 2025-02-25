import 'dart:developer';

import 'package:fitplan/repositories/workout/entity/workout_overview.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:fitplan/utils/date_time_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_calendar_data_event.dart';
part 'workout_calendar_data_state.dart';

class WorkoutCalendarDataBloc
    extends Bloc<WorkoutCalendarDataEvent, WorkoutCalendarDataState> {
  final WorkoutRepository workoutRepository;
  final ExerciseRepository exerciseRepository;
  final ExerciseTypeRepository exerciseTypeRepository;
  final ExerciseRepeatRepository exerciseRepeatRepository;

  WorkoutCalendarDataBloc(this.workoutRepository, this.exerciseRepository,
      this.exerciseTypeRepository, this.exerciseRepeatRepository)
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


      log("🏋️‍♂️ Workout List:");
      workoutList.forEach((exercise) => log("${exercise} - Sort: ${exercise.sort}"));


      List<WorkoutOverview> workoutEntities = [];

      for (int i = 0; i < workoutList.length; i++) {
        final workout = workoutList[i];

        final exercise = await exerciseRepository.getExerciseById(workout.exerciseId);
        if (exercise == null) {
          throw Exception("Exercise not found for id ${workout.exerciseId}");
        }

        final exerciseType = await exerciseTypeRepository.getExerciseTypeById(exercise.exerciseTypeId);
        if (exerciseType == null) {
          throw Exception("ExerciseType not found for id ${exercise.exerciseTypeId}");
        }

        // Логика определения `workoutExerciseIndicator`
        String exerciseIndicator = "middle"; 

        final bool currentIsSet = workout.isSet;
        final int currentSetId = workout.setId;

        final bool? previousIsSet = i > 0 ? workoutList[i - 1].isSet : null;
        final int? previousSetId = i > 0 ? workoutList[i - 1].setId : null;

        final bool? nextIsSet =
            i < workoutList.length - 1 ? workoutList[i + 1].isSet : null;
        final int? nextSetId =
            i < workoutList.length - 1 ? workoutList[i + 1].setId : null;

        if (currentIsSet) {
          if (i == 0) {
            exerciseIndicator = "down";
          } else if (i == workoutList.length - 1) {
            exerciseIndicator = "up";
          } else if (!previousIsSet! || previousSetId != currentSetId) {
            exerciseIndicator = "down";
          } else if (!nextIsSet! || nextSetId != currentSetId) {
            exerciseIndicator = "up";
          } else {
            exerciseIndicator = "middle";
          }
        } else {
          exerciseIndicator = "";
        }

        // Загрузка повторений (подходов) для упражнения
        log('_onLoadExerciseRepeats');
        int workoutExerciseRepeats = 0;
        List<ExerciseRepeat> workoutExerciseRepeatList = [];

        try {
          final repeats = await exerciseRepeatRepository.getExerciseRepeatsByWorkout(workout.id);
          workoutExerciseRepeatList = repeats
              .where((repeat) => repeat.exerciseId == workout.exerciseId)
              .toList();
          workoutExerciseRepeats = workoutExerciseRepeatList.length;
        } catch (e) {
          log("Ошибка загрузки повторений: $e");
        }

        final workoutEntity = WorkoutOverview(
          workoutId: workout.id,
          workoutSort: workout.sort,
          workoutIsSet: workout.isSet,
          workoutSetId: workout.setId,
          workoutExerciseIndicator: exerciseIndicator,
          workoutExerciseId: workout.exerciseId,
          workoutExerciseName: exercise.name,
          workoutExerciseTypeId: exerciseType.id,
          workoutExerciseTypeName: exerciseType.name,
          // workoutExerciseTypeIcon: exerciseType.icon,
          workoutExerciseTypeIcon: exerciseType.icon ?? "",
          workoutExerciseTypeCategory: exerciseType.category,
          workoutExerciseRepeats: workoutExerciseRepeats,
          workoutExerciseRepeatList: workoutExerciseRepeatList,
        );

        workoutEntities.add(workoutEntity);
      }

      emit(WorkoutCalendarLoaded(workoutList: workoutEntities));
    } catch (e) {
      emit(WorkoutCalendarFailure(e.toString()));
    }
  }
}
