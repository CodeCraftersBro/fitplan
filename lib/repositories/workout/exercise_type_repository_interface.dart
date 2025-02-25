import 'package:fitplan/repositories/workout/database.dart';

abstract interface class ExerciseTypeRepositoryInterface {
  Future<void> updateExerciseTypesFromAPI();
  Future<List<ExerciseType>> getExerciseTypes();
  Future<ExerciseType?> getExerciseTypeById(String id);
}