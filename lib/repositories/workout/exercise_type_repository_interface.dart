import 'package:fitplan/repositories/workout/models/models.dart';

abstract interface class ExerciseTypeRepositoryInterface {
  Future<void> updateExerciseTypesFromAPI();
  Future<List<ExerciseType>> getExerciseTypes();
}