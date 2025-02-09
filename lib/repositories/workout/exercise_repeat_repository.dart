import 'package:realm/realm.dart';
import 'package:fitplan/repositories/workout/exercise_repeat_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';

class ExerciseRepeatRepository implements ExerciseRepeatRepositoryInterface {
  final Realm realm;

  ExerciseRepeatRepository({required this.realm});

  @override
  Future<void> addExerciseRepeat(ExerciseRepeat repeat) async {
    realm.write(() {
      realm.add(repeat);
    });
  }

  @override
  Future<void> updateExerciseRepeat(ExerciseRepeat repeat) async {
    realm.write(() {
      realm.add(repeat, update: true);
    });
  }

  @override
  Future<void> deleteExerciseRepeat(String id) async {
    final repeat = realm.find<ExerciseRepeat>(id);
    if (repeat != null) {
      realm.write(() {
        realm.delete(repeat);
      });
    }
  }

  @override
  Future<List<ExerciseRepeat>> getExerciseRepeatsByWorkout(String workoutId) async {
    final repeats = realm.all<ExerciseRepeat>().query('workoutId == \$0', [workoutId]);
    return repeats.toList();
  }

  @override
  Future<List<ExerciseRepeat>> getExerciseRepeatsByDate(DateTime date) async {
    final repeats = realm.all<ExerciseRepeat>().query('date == \$0', [date]);
    return repeats.toList();
  }

  @override
  Future<ExerciseRepeat?> getExerciseRepeatById(String id) async {
    return realm.find<ExerciseRepeat>(id);
  }
}
