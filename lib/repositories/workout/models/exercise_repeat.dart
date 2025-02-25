import 'package:drift/drift.dart';
import 'exercise.dart';
import 'workout.dart';



@DataClassName('ExerciseRepeat')
class ExerciseRepeats extends Table {
  // TextColumn get id => text().customConstraint('PRIMARY KEY NOT NULL')();
  TextColumn get id => text()(); 
  IntColumn get sort => integer()();
  DateTimeColumn get date => dateTime()();

  TextColumn get workoutId => text().references(Workouts, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  TextColumn get exerciseType => text()(); // "strength", "cardio", "stretching"

  // Данные для силовых упражнений
  IntColumn get weight => integer().nullable()(); // Вес (в кг)
  IntColumn get reps => integer().nullable()(); // Количество повторений

  // Данные для кардио
  RealColumn get distance => real().nullable()(); // Расстояние (в км)
  IntColumn get duration => integer().nullable()(); // Время (в секундах)

  // Данные для растяжки / планки
  IntColumn get stretchDuration => integer().nullable()(); // Время (в секундах)
}
