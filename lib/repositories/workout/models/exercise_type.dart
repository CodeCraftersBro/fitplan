import 'package:realm/realm.dart';

part 'exercise_type.realm.dart';

@RealmModel()
class _ExerciseType {
  @PrimaryKey()
  late String id;
  late String name;
  late String icon;

  // const ExerciseType({
  //   required this.id,
  //   required this.name,
  //   required this.icon,
  // });
  // @override
  // List<Object> get props => [
  //       id,
  //       name,
  //       icon,
  //     ];
}
