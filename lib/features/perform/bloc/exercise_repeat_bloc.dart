import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:uuid/uuid.dart' as uuid_lib;
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
      // emit(ExerciseSearchError(message: e.toString()));
    }
  }


  Future<void> _onAddExerciseRepeat(
    AddExerciseRepeat event,
    Emitter<ExerciseRepeatState> emit,
  ) async {
    
    try {
      List<ExerciseRepeat> newRepeats = [];

      for (var data in event.performData) {
         var uuid = const uuid_lib.Uuid();
        final exerciseRepeat = ExerciseRepeat(
          uuid.v4(),
          1, 
          DateTime.now(),
          event.workoutOverview.workoutId,
          event.workoutOverview.workoutExerciseId,
          event.workoutOverview.workoutExerciseTypeCategory,
          weight: data['weight'] != null ? int.tryParse(data['weight']!) : null,
          reps: data['reps'] != null ? int.tryParse(data['reps']!) : null,
          distance: data['distance'] != null ? double.tryParse(data['distance']!) : null,
          duration: data['duration'] != null ? int.tryParse(data['duration']!) : null,
          stretchDuration: data['stretchDuration'] != null ? int.tryParse(data['stretchDuration']!) : null,
        );

        newRepeats.add(exerciseRepeat);
      }

      // Сохраняем все повторения в базу данных
      for (var repeat in newRepeats) {
        await exerciseRepeatRepository.addExerciseRepeat(repeat);
      }

      // Загружаем обновленный список повторений для текущего упражнения
      final updatedRepeats = await exerciseRepeatRepository.getExerciseRepeatsByDate(DateTime.now());
      final filteredRepeats = updatedRepeats.where(
        (repeat) => repeat.exerciseId == event.workoutOverview.workoutExerciseId,
      ).toList();

      emit(ExerciseRepeatsLoaded(repeats: filteredRepeats));
     
    } catch (e) {
      // emit(ExerciseSearchError(message: e.toString()));
    }
  }
  
}
