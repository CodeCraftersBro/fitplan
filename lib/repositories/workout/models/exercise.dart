import 'package:realm/realm.dart';

part 'exercise.realm.dart';

@RealmModel()
class _Exercise  {
  @PrimaryKey()
  late String id;
  late String name;
  late String exerciseTypeId;
}