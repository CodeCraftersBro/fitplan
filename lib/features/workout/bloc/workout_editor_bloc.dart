import 'dart:developer';

import 'package:fitplan/repositories/workout/entity/workout_overview.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:fitplan/utils/date_time_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart' as uuid_lib;
import 'package:drift/drift.dart';

part 'workout_editor_event.dart';
part 'workout_editor_state.dart';

class WorkoutEditorBloc extends Bloc<WorkoutEditorEvent, WorkoutEditorState> {
  final WorkoutRepository workoutRepository;
  final ExerciseRepeatRepository exerciseRepeatRepository;

  WorkoutEditorBloc(this.workoutRepository, this.exerciseRepeatRepository) : super(WorkoutEditorInitial()) {
    on<WorkoutEditorEvent>((event, emit) async => switch (event) {
          LoadWorkoutDate() => _onLoadWorkoutDate(event, emit),
          UpdateWorkoutDate() => _onUpdateWorkoutDate(event, emit),
          ReorderWorkouts() => _onReorderWorkouts(event, emit),
      });
  }

  Future<void> _onLoadWorkoutDate(
    LoadWorkoutDate event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    try {
      final dateWithoutTime = DateTimeUtils.getDateWithoutTime(event.selectedDate);
      final workoutList = await workoutRepository.getExerciseListByDate(dateWithoutTime);
      emit(WorkoutEditorLoaded(workouts: workoutList));
    } catch (e) {
      emit(WorkoutEditorFailure(e));
    }
  }

  Future<void> _onUpdateWorkoutDate(
    UpdateWorkoutDate event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    try {
      final dateWithoutTime = DateTimeUtils.getDateWithoutTime(event.selectedDate);
      await workoutRepository.deleteWorkoutsByDate(dateWithoutTime);

      var uuid = const uuid_lib.Uuid();
      List<WorkoutsCompanion> workoutList = [];

      for (int i = 0; i < event.workoutOverviewList.length; i++) {
        // 🆕 Используем `getNextSortOrderForDate` для получения следующего значения сортировки
        int sortOrder = await workoutRepository.getNextSortOrderForDate(dateWithoutTime);

        var workout = WorkoutsCompanion(
          id: Value(uuid.v4()),
          sort: Value(sortOrder),
          date: Value(dateWithoutTime),
          isSet: Value(event.workoutOverviewList[i].workoutIsSet),
          setId: Value(event.workoutOverviewList[i].workoutSetId),
          exerciseIndicator: Value(event.workoutOverviewList[i].workoutExerciseIndicator),
          exerciseId: Value(event.workoutOverviewList[i].workoutExerciseId),
        );

        workoutList.add(workout);
      }

      await workoutRepository.addWorkouts(workoutList);

      // Перезагружаем обновленные тренировки
      final updatedWorkouts = await workoutRepository.getExerciseListByDate(dateWithoutTime);
      emit(WorkoutEditorLoaded(workouts: updatedWorkouts));
    } catch (e) {
      log("====updateWorkouts WorkoutEditorFailure === ${e.toString()}");
      emit(WorkoutEditorFailure(e));
    }
  }

  Future<void> _onReorderWorkouts(
    ReorderWorkouts event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    try {
      log("🏋️‍♂️ BEFORE Reorder - Old Workout List:");
      event.oldWorkoutList.forEach((exercise) => log("${exercise.workoutExerciseName} - Sort: ${exercise.workoutSort}"));

      log("🔄 AFTER Reorder - New Workout List:");
      event.newWorkoutList.forEach((exercise) => log("${exercise.workoutExerciseName} - Sort: ${exercise.workoutSort}"));

      // bool isChanged = _isWorkoutOrderChanged(event.oldWorkoutList, event.newWorkoutList);

      // if (isChanged) {
        final DateTime workoutDate = event.selectedDate;

        // 🔄 Обновляем `exerciseId` в `exercise_repeats`, если они изменились
        for (int i = 0; i < event.oldWorkoutList.length; i++) {
          final oldExerciseId = event.oldWorkoutList[i].workoutExerciseId;
          final newExerciseId = event.newWorkoutList[i].workoutExerciseId;

          if (oldExerciseId != newExerciseId) {
            await exerciseRepeatRepository.updateExerciseRepeatIds(oldExerciseId, newExerciseId);
          }
        }

        // 🔄 Обновляем сортировку в базе данных
        for (int i = 0; i < event.newWorkoutList.length; i++) {
          final workoutOverview = event.newWorkoutList[i];

          // 🆕 Используем `getNextSortOrderForDate` для обновления сортировки
          int newSort =  i;//await workoutRepository.getNextSortOrderForDate(workoutDate);

          await workoutRepository.updateWorkoutSort(
            workoutId: workoutOverview.workoutId,
            newSort: newSort,
          );

          await workoutRepository.updateWorkoutSetId(
            workoutId: workoutOverview.workoutId, 
            newSetId: workoutOverview.workoutSetId,
            newIsSet: workoutOverview.workoutIsSet
          );

        }

        // 🔄 Загружаем обновленные тренировки из базы
        final updatedWorkouts = await workoutRepository.getExerciseListByDate(workoutDate);

        log("✅ Workout Order Updated Successfully");

        // ⏩ Отправляем новое состояние
        emit(WorkoutReordered(reorderedWorkouts: updatedWorkouts));
        emit(WorkoutEditorLoaded(workouts: updatedWorkouts));
        log("🚀 emit(WorkoutReordered) и emit(WorkoutEditorLoaded) вызваны!");
      // }
    } catch (e) {
      log("⚠️ Error in Reorder: ${e.toString()}");
      emit(WorkoutEditorFailure(e));
    }
  }

  bool _isWorkoutOrderChanged(List<WorkoutOverview> oldList, List<WorkoutOverview> newList) {
    if (oldList.length != newList.length) return true;

    for (int i = 0; i < oldList.length; i++) {
      if (oldList[i].workoutExerciseId != newList[i].workoutExerciseId || 
          oldList[i].workoutSort != newList[i].workoutSort) {
        return true;
      }
    }
    return false;
  }
}
