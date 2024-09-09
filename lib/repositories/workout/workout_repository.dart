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

  @override
  Future<int> getNextSortOrderForDate(DateTime date) async {
    final workouts = await getExerciseListByDate(date);

    if (workouts.isEmpty) {
      return 1;
    } else {
      // Ищем максимальное значение сортировки и увеличиваем его на 1
      final maxSortOrder =
          workouts.map((w) => w.sort).reduce((a, b) => a > b ? a : b);
      return maxSortOrder + 1;
    }
  }

  @override
  Future<int> getNextSetIdForDate(DateTime date) async {
    // Получаем все тренировки для указанной даты
    final workouts = realm.all<Workout>().query('date == \$0', [date]);

    // Если на эту дату нет тренировок, то первый номер сета будет 1
    if (workouts.isEmpty) {
      return 1;
    } else {
      // Находим максимальное значение setId и увеличиваем его на 1
      final maxSetId =
          workouts.map((w) => w.setId).reduce((a, b) => a > b ? a : b);
      return maxSetId + 1;
    }
  }

  @override
  Future<void> updateWorkouts(List<Workout> workouts) async {
    //  print("====updateWorkouts ===");
    // for (int i = 0; i < workouts.length; i++) {
    //   print(workouts[i].id + " || " + workouts[i].sort.toString());
    //   final workout = realm.find<Workout>(workouts[i].id);
    //   if (workout != null) {
    //     realm.write(() {
    //       realm.delete(workout);
    //     });
    //   }
    // }

    realm.write(() {
      for (var workout in workouts) {
        realm.add(workout, update: true);
      }
    });
  }

  @override
  Future<void> deleteWorkoutsByDate(DateTime date) async {
    realm.write(() {
      final workoutsToDelete =
          realm.all<Workout>().query('date == \$0', [date]);
      realm.deleteMany(workoutsToDelete);
    });
  }
}
