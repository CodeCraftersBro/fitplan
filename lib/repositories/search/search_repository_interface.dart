import 'package:fitplan/repositories/search/models/models.dart';

abstract interface class SearchRepositoryInterface {
  Future<List<ExerciseSearch>> getExerciseCategories();
  Future<List<ExerciseSearch>> getExercisesByTypeId(String id);
  Future<List<ExerciseSearch>> searchExercisesAndCategories(String query);

}