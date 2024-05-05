import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/models/exercise.dart';
class Workout extends Equatable {
  final String id;
  final num sort;
  final DateTime date;
  final num? setId;
  final Exercise exercise; // Single exercise reference

  const Workout({
    required this.id,
    required this.sort,
    required this.date,
    this.setId,
    required this.exercise,
  });

  @override
  List<Object?> get props => [id, sort, date, setId, exercise]; // Include exercise object

  
  String get exerciseName => exercise.name;
  String get exerciseType => exercise.typeId.name; 

  
}