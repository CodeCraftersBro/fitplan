import 'package:fitplan/repositories/workout/models/models.dart';

abstract class ExerciseRepeatRepositoryInterface {
  Future<void> addExerciseRepeat(ExerciseRepeat repeat);
  Future<void> updateExerciseRepeat(ExerciseRepeat repeat);
  Future<void> deleteExerciseRepeat(String id);
  Future<List<ExerciseRepeat>> getExerciseRepeatsByWorkout(String workoutId);
  Future<List<ExerciseRepeat>> getExerciseRepeatsByDate(DateTime date);
  Future<ExerciseRepeat?> getExerciseRepeatById(String id);
}
