import 'package:drift/drift.dart';
import 'exercise_type.dart'; // Импортируем модель типа упражнения



@DataClassName('Exercise')
class Exercises extends Table {
  TextColumn get id => text()(); 
  // TextColumn get id => text().customConstraint('PRIMARY KEY NOT NULL')();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get exerciseTypeId => text().references(ExerciseTypes, #id)();
  @override
  Set<Column> get primaryKey => {id};
}
