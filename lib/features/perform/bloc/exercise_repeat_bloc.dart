import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:fitplan/repositories/workout/entity/workout_overview.dart'; 
import 'package:fitplan/repositories/workout/database.dart';
import 'package:uuid/uuid.dart' as uuid_lib;
import 'package:drift/drift.dart';

part 'exercise_repeat_event.dart';
part 'exercise_repeat_state.dart';

class ExerciseRepeatBloc extends Bloc<ExerciseRepeatEvent, ExerciseRepeatState> {
  final ExerciseRepeatRepository exerciseRepeatRepository;

  ExerciseRepeatBloc({
    required this.exerciseRepeatRepository,
  }) : super(ExerciseRepeatInitial()) {
    on<ExerciseRepeatEvent>((event, emit) async => switch (event) {
      LoadExerciseRepeats() => _onLoadExerciseRepeats(event, emit),
      AddExerciseRepeat() => _onAddExerciseRepeat(event, emit),
    });
  }

  Future<void> _onLoadExerciseRepeats(
    LoadExerciseRepeats event,
    Emitter<ExerciseRepeatState> emit,
  ) async {
    try {
      final repeats = await exerciseRepeatRepository.getExerciseRepeatsByDate(event.date);

      // Фильтруем повторения для конкретного упражнения
      final filteredRepeats = repeats.where(
        (repeat) => repeat.exerciseId == event.workoutOverview.workoutExerciseId,
      ).toList();

      emit(ExerciseRepeatsLoaded(repeats: filteredRepeats));
    } catch (e) {
      emit(ExerciseRepeatError(message: e.toString()));
    }
  }

  Future<void> _onAddExerciseRepeat(
    AddExerciseRepeat event,
    Emitter<ExerciseRepeatState> emit,
  ) async {
    try {
      List<ExerciseRepeatsCompanion> newRepeats = [];
      var uuid = const uuid_lib.Uuid();

      for (var data in event.performData) {
        final exerciseRepeat = ExerciseRepeatsCompanion(
          id: Value(uuid.v4()),
          sort: Value(1), 
          date: Value(DateTime.now()),
          workoutId: Value(event.workoutOverview.workoutId),
          exerciseId: Value(event.workoutOverview.workoutExerciseId),
          exerciseType: Value(event.workoutOverview.workoutExerciseTypeCategory),
          weight: Value(data['weight'] != null ? int.tryParse(data['weight']!) : null),
          reps: Value(data['reps'] != null ? int.tryParse(data['reps']!) : null),
          distance: Value(data['distance'] != null ? double.tryParse(data['distance']!) : null),
          duration: Value(data['duration'] != null ? int.tryParse(data['duration']!) : null),
          stretchDuration: Value(data['stretchDuration'] != null ? int.tryParse(data['stretchDuration']!) : null),
        );

        newRepeats.add(exerciseRepeat);
      }

      // Сохраняем все повторения в базу данных
      await exerciseRepeatRepository.addExerciseRepeats(newRepeats);

      // Загружаем обновленный список повторений для текущего упражнения
      final updatedRepeats = await exerciseRepeatRepository.getExerciseRepeatsByDate(DateTime.now());
      final filteredRepeats = updatedRepeats.where(
        (repeat) => repeat.exerciseId == event.workoutOverview.workoutExerciseId,
      ).toList();

      emit(ExerciseRepeatsLoaded(repeats: filteredRepeats));
    } catch (e) {
      emit(ExerciseRepeatError(message: e.toString()));
    }
  }
}
