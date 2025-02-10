import 'package:fitplan/repositories/workout/database.dart';

abstract interface class ExerciseRepositoryInterface {
  Future<List<Exercise>> getExercises();
  Future<Exercise?> getExerciseById(String id);
}