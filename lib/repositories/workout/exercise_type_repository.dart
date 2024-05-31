import 'package:fitplan/repositories/workout/exercise_type_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:realm/realm.dart';

class ExerciseTypeRepository implements ExerciseTypeRepositoryInterface {

  final Realm realm;

  ExerciseTypeRepository({required this.realm});
  
  @override
  Future<ExerciseType?> getExerciseTypeById(String id) {
    // TODO: implement getExerciseTypeById
    throw UnimplementedError();
  }
  
  @override
  Future<List<ExerciseType>> getExerciseTypes() {
    // TODO: implement getExerciseTypes
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateExerciseTypesFromAPI() {
    // TODO: implement updateExerciseTypesFromAPI
    throw UnimplementedError();
  }


 
}