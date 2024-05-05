import 'package:fitplan/repositories/workout/models/models.dart';

abstract interface class ExerciseRepositoryInterface {
  Future<List<Exercise>> getExercises();
  Future<Exercise?> getExerciseById(String id);
}