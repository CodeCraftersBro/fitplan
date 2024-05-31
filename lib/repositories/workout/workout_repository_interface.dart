import 'package:fitplan/repositories/workout/models/models.dart';

abstract interface class WorkoutRepositoryInterface {
  Future<List<Workout>> getExerciseListByDate(DateTime date);
  Future<void> addWorkout(Workout workout);
  Future<List<Workout>> getAllWorkouts();
  Future<void> deleteAllWorkouts();
  Future<void> deleteWorkoutById(String id);
}