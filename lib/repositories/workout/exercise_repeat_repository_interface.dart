import 'package:fitplan/repositories/workout/database.dart';

abstract class ExerciseRepeatRepositoryInterface {
  Future<void> addExerciseRepeat(ExerciseRepeatsCompanion repeat);
  Future<void> addExerciseRepeats(List<ExerciseRepeatsCompanion> repeats);
  Future<void> updateExerciseRepeat(ExerciseRepeat repeat);
  Future<void> deleteExerciseRepeat(String id);
  Future<void> deleteExerciseRepeatsByWorkoutAndExercise(String workoutId, String exerciseId);
  Future<List<ExerciseRepeat>> getExerciseRepeatsByWorkout(String workoutId);
  Future<List<ExerciseRepeat>> getExerciseRepeatsByDate(DateTime date);
  Future<ExerciseRepeat?> getExerciseRepeatById(String id);
}
