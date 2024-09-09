import 'package:realm/realm.dart';

part 'workout.realm.dart';

@RealmModel()
class _Workout {
  @PrimaryKey()
  late String id;
  late int sort;
  late DateTime date;
  late bool isSet;
  late int setId;
  late String exerciseIndicator;
  late String exerciseId; 
  
}