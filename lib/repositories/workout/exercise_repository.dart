import 'package:fitplan/repositories/workout/exercise_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';

class ExerciseRepository implements ExerciseRepositoryInterface {
  final List<Exercise> _exercises = [
    const Exercise(
      id: '1',
      name: 'Отжимания',
      typeId: ExerciseType(id: 'strength', name: 'Силовые', icon: '💪'),
    ),
    const Exercise(
      id: '2',
      name: 'Приседания',
      typeId: ExerciseType(id: 'strength', name: 'Силовые', icon: '💪'),
    ),
    const Exercise(
      id: '3',
      name: 'Бег',
      typeId: ExerciseType(id: 'cardio', name: 'Кардио', icon: '🏃'),
    ),
  ];

  @override
  Future<List<Exercise>> getExercises() async {
    return _exercises; 
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    return _exercises.firstWhere((exercise) => exercise.id == id);
  }

 
  Future<void> addExercise(Exercise exercise) async {
    _exercises.add(exercise);
  }

  Future<void> updateExercise(Exercise exercise) async {
    final index = _exercises.indexWhere((e) => e.id == exercise.id);
    if (index != -1) {
      _exercises[index] = exercise;
    }
  }

  Future<void> deleteExercise(String id) async {
    _exercises.removeWhere((exercise) => exercise.id == id);
  }
  
  
}
