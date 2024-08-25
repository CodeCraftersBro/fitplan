import 'package:fitplan/repositories/workout/exercise_repository_interface.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart' as uuid_lib;
class ExerciseRepository implements ExerciseRepositoryInterface {
  
final Realm realm;

  ExerciseRepository({required this.realm});

  @override
  Future<List<Exercise>> getExercises() async {
    final exercises = realm.all<Exercise>();
    return exercises.toList();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final exercise = realm.find<Exercise>(id);
    return exercise;
  }

  Future<void> updateExercise() async {
     var uuid = const uuid_lib.Uuid();

    final List<Exercise> exerciseDemo = [
      // # Arms (Руки)
Exercise(uuid.v4(), 'Bicep Curl', '1'),
Exercise(uuid.v4(), 'Tricep Dip', '1'),
Exercise(uuid.v4(), 'Hammer Curl', '1'),

// # Legs (Ноги)
Exercise(uuid.v4(), 'Squat', '2'),
Exercise(uuid.v4(), 'Lunge', '2'),
Exercise(uuid.v4(), 'Leg Press', '2'),

// # Stretching (Растяжка)
Exercise(uuid.v4(), 'Hamstring Stretch', '3'),
Exercise(uuid.v4(), 'Quad Stretch', '3'),
Exercise(uuid.v4(), 'Shoulder Stretch', '3'),

// # Shoulders (Плечи)
Exercise(uuid.v4(), 'Shoulder Press', '4'),
Exercise(uuid.v4(), 'Lateral Raise', '4'),
Exercise(uuid.v4(), 'Front Raise', '4'),

// # Back (Спина)
Exercise(uuid.v4(), 'Deadlift', '5'),
Exercise(uuid.v4(), 'Pull-up', '5'),
Exercise(uuid.v4(), 'Bent-over Row', '5'),

// # Abs (Пресс)
Exercise(uuid.v4(), 'Crunch', '6'),
Exercise(uuid.v4(), 'Plank', '6'),
Exercise(uuid.v4(), 'Russian Twist', '6'),

// # Chest (Грудь)
Exercise(uuid.v4(), 'Bench Press', '7'),
Exercise(uuid.v4(), 'Chest Fly', '7'),
Exercise(uuid.v4(), 'Incline Press', '7'),

// # Cardio (Кардио)
Exercise(uuid.v4(), 'Running', '8'),
Exercise(uuid.v4(), 'Cycling', '8'),
Exercise(uuid.v4(), 'Jump Rope', '8'),

    ];

    realm.write(() {
      for (var exercise in exerciseDemo) {
        realm.add(exercise, update: true);
      }
    });
  }


  Future<void> deleteAllExercise() async {
    realm.write(() {
      realm.deleteAll<Exercise>();
    });
  }
  
}
