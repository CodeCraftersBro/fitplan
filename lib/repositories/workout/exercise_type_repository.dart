import 'package:fitplan/repositories/workout/exercise_type_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';

class ExerciseTypeRepository implements ExerciseTypeRepositoryInterface {

  final List<ExerciseType> _localExerciseTypes = [
    ExerciseType(id: '1', name: 'Cardio', icon: 'assets/icons/cardio.png'),
    ExerciseType(id: '2', name: 'Strength', icon: 'assets/icons/strength.png'),
    // Add the rest of your initial exercise types here...
  ];


  @override
  Future<void> updateExerciseTypesFromAPI() async {
    // TODO: Implement API call to fetch updated exercise types.
    List<ExerciseType> updatedExerciseTypes = [
      ExerciseType(id: '2', name: 'New Cardio', icon: 'assets/icons/cardio.png'),
      // Add any new or updated exercise types here...
    ];

    // Merge updates into the local cache.
    for (var updatedType in updatedExerciseTypes) {
      int index = _localExerciseTypes.indexWhere((type) => type.id == updatedType.id);
      if (index != -1) {
        // Update existing exercise type.
        _localExerciseTypes[index] = updatedType;
      } else {
        // Add new exercise type.
        _localExerciseTypes.add(updatedType);
      }
    }
  }

  @override
  Future<List<ExerciseType>> getExerciseTypes() async {
    return List.unmodifiable(_localExerciseTypes);
  }
 
}