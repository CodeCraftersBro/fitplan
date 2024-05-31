import 'package:fitplan/repositories/workout/models/workout.dart';
import 'package:fitplan/repositories/workout/workout_repository_interface.dart';
import 'package:realm/realm.dart';

class WorkoutRepository implements WorkoutRepositoryInterface {
  final Realm realm;

  WorkoutRepository({required this.realm});

  @override
  Future<List<Workout>> getExerciseListByDate(DateTime date) async {
    final workouts = realm.all<Workout>().query('date == \$0', [date]);
    return workouts.toList();
  }

  @override
  Future<void> addWorkout(Workout workout) async {
    realm.write(() {
      realm.add(workout);
    });
  }

  @override
  Future<List<Workout>> getAllWorkouts() async {
    final workouts = realm.all<Workout>();
    return workouts.toList();
  }

  @override
  Future<void> deleteAllWorkouts() async {
    realm.write(() {
      realm.deleteAll<Workout>();
    });
  }

  @override
  Future<void> deleteWorkoutById(String id) async {
    final workout = realm.find<Workout>(id);
    if (workout != null) {
      realm.write(() {
        realm.delete(workout);
      });
    }
  }
}
