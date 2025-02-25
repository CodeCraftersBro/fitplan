import 'package:drift/drift.dart';
import 'exercise.dart';


@DataClassName('Workout')
class Workouts extends Table {
  // TextColumn get id => text().customConstraint('PRIMARY KEY NOT NULL')();
  TextColumn get id => text()(); 
  IntColumn get sort => integer()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isSet => boolean().withDefault(const Constant(false))();
  IntColumn get setId => integer()();
  TextColumn get exerciseIndicator => text()();
  TextColumn get exerciseId => text().references(Exercises, #id)();
}
