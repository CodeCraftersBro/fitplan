import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/models/exercise.dart';
class Workout extends Equatable {
  final String id;
  final num sort;
  final DateTime date;
  final bool isSet;
  final List<Exercise> exercise; 
  
  const Workout({
    required this.id,
    required this.sort,
    required this.date,
    required this.isSet,
    required this.exercise,
  });

  @override
  List<Object?> get props => [id, sort, date, isSet, exercise]; // Include exercise object

  
}