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

  WorkoutEditorBloc(this.workoutRepository) : super(WorkoutEditorInitial()) {
    on<WorkoutEditorEvent>((event, emit) async => switch (event) {
          LoadWorkoutDate() => _onLoadWorkoutDate(event, emit),
          UpdateWorkoutDate() => _onUpdateWorkoutDate(event, emit),
      });
  }

  Future<void> _onLoadWorkoutDate(
    LoadWorkoutDate event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    try {
      final dateWithoutTime =
          DateTimeUtils.getDateWithoutTime(event.selectedDate);
      final workoutList =
          await workoutRepository.getExerciseListByDate(dateWithoutTime);
      emit(
        WorkoutEditorLoaded(workouts: workoutList),
      );
    } catch (e) {
      emit(WorkoutEditorFailure(e));
    }
  }

  Future<void> _onUpdateWorkoutDate(
    UpdateWorkoutDate event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    try {
      final dateWithoutTime =
          DateTimeUtils.getDateWithoutTime(event.selectedDate);

      await workoutRepository.deleteWorkoutsByDate(dateWithoutTime);
      var uuid = const uuid_lib.Uuid();

      List<WorkoutsCompanion> workoutList = [];

      for (int i = 0; i < event.workoutOverviewList.length; i++) {
        int sortOrder =
            await workoutRepository.getNextSortOrderForDate(dateWithoutTime);

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
      final updatedWorkouts =
          await workoutRepository.getExerciseListByDate(dateWithoutTime);
      emit(WorkoutEditorLoaded(workouts: updatedWorkouts));
    } catch (e) {
      print("====updateWorkouts WorkoutEditorFailure ===");
      emit(WorkoutEditorFailure(e));
    }
  }
}
