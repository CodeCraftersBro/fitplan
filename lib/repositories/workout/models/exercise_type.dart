import 'package:equatable/equatable.dart';

class ExerciseType extends Equatable {
  final String id;
  final String name;
  final String icon;

  const ExerciseType({
    required this.id,
    required this.name,
    required this.icon,
  });
  @override
  List<Object> get props => [
        id,
        name,
      ];
}
