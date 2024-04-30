import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/models/exercise_type.dart';

class Exercise extends Equatable {
  final String id;
  final String name;
  final ExerciseType type;
  final int sets;

  const Exercise({
    required this.id,
    required this.name,
    required this.type, 
    required this.sets,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        sets,
      ];
}
