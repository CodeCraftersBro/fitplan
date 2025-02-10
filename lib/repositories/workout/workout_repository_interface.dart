import 'package:fitplan/repositories/workout/database.dart';

abstract interface class WorkoutRepositoryInterface {
  Future<List<Workout>> getExerciseListByDate(DateTime date);
  Future<void> addWorkout(Workout workout);
  Future<List<Workout>> getAllWorkouts();
  Future<void> deleteAllWorkouts();
  Future<void> deleteWorkoutById(String id);

  Future<int> getNextSortOrderForDate(DateTime date);
  Future<int> getNextSetIdForDate(DateTime date);
  
  //обновления нескольких тренировок
  Future<void> updateWorkouts(List<Workout> workouts);
  //удаления тренировок по дате
  Future<void> deleteWorkoutsByDate(DateTime date);

 
}