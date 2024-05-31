import 'package:fitplan/repositories/workout/exercise_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:realm/realm.dart';

class ExerciseRepository implements ExerciseRepositoryInterface {
  
final Realm realm;

  ExerciseRepository({required this.realm});

  @override
  Future<List<Exercise>> getExercises() async {
    final exercises = realm.all<Exercise>();
    return exercises.toList();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final exercise = realm.find<Exercise>(id);
    return exercise;
  }

  
}
