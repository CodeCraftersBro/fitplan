import 'package:fitplan/repositories/workout/models/models.dart';

abstract interface class WorkoutRepositoryInterface {
  Future<List<Exercise>> getExerciseList();
}