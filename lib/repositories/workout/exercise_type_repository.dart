import 'package:fitplan/repositories/workout/exercise_type_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:realm/realm.dart';
// import 'package:uuid/uuid.dart' as uuid_lib;
class ExerciseTypeRepository implements ExerciseTypeRepositoryInterface {
  final Realm realm;

  ExerciseTypeRepository({required this.realm});

  @override
  Future<void> updateExerciseTypesFromAPI() async {
    // var uuid = const uuid_lib.Uuid();
    // Пример обновления данных из API
    // Здесь вы можете сделать запрос к вашему API и обновить данные в Realm
    final List<ExerciseType> exerciseTypesFromAPI = [
      
      ExerciseType('1','Arms','💪'),
      ExerciseType('2','Legs','🦵'),
      ExerciseType('3','Stretching','🧘‍♂️'),
      ExerciseType('4','Shoulders','🤾‍♂️'),
      ExerciseType('5','Back','🧗'),
      ExerciseType('6','Abs','🤸'),
      ExerciseType('7','Chest','🏋️‍♀️'),
      ExerciseType('8','Cardio','🫀'),
    ];

    realm.write(() {
      for (var exerciseType in exerciseTypesFromAPI) {
        realm.add(exerciseType, update: true);
      }
    });
  }

  @override
  Future<List<ExerciseType>> getExerciseTypes() async {
    final exerciseTypes = realm.all<ExerciseType>();
    return exerciseTypes.toList();
  }

  @override
  Future<ExerciseType?> getExerciseTypeById(String id) async {
    final exerciseType = realm.find<ExerciseType>(id);
    return exerciseType;
  }

   Future<void> deleteAll() async {
    realm.write(() {
      realm.deleteAll<ExerciseType>();
    });
  }
}