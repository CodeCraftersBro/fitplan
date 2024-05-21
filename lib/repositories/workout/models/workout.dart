import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/models/exercise.dart';

enum LineDirection { up, down, middle }

class Workout extends Equatable {
  final String id;
  final num sort;
  final DateTime date;
  final bool isSet;
  final LineDirection? exerciseIndicator;
  final Exercise exercise; 
  
  const Workout({
    required this.id,
    required this.sort,
    required this.date,
    required this.isSet,
    required this.exercise,
    this.exerciseIndicator
  });

  @override
  List<Object?> get props => [id, sort, date, isSet, exercise,exerciseIndicator]; // Include exercise object

  
}