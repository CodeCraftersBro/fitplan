import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/workout/models/exercise.dart';

class Workout extends Equatable {
  final String id;
  final String name;
  final String description;
  final String color;
  final List<Exercise> exercises;
  

  const Workout(this.color, {
    required this.id,
    required this.name,
    this.exercises = const [],
    this.description = ''
  });
  
  @override
  List<Object?> get props => [];

 
}