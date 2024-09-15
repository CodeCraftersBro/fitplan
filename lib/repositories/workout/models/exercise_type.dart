import 'package:realm/realm.dart';

part 'exercise_type.realm.dart';

@RealmModel()
class _ExerciseType {
  @PrimaryKey()
  late String id;
  late String name;
  late String icon;
  late String category; 
}

