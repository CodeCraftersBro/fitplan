import 'package:drift/drift.dart';



@DataClassName('ExerciseType')
class ExerciseTypes extends Table {
  TextColumn get id => text()();
  // TextColumn get id => text().customConstraint('PRIMARY KEY NOT NULL')(); 
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get icon => text().nullable()();
  TextColumn get category => text()();

   @override
  Set<Column> get primaryKey => {id};
  
}
