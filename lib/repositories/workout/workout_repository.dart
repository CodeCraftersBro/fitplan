import 'package:fitplan/repositories/workout/models/exercise.dart';
import 'package:fitplan/repositories/workout/models/exercise_type.dart';
import 'package:fitplan/repositories/workout/models/workout.dart';
import 'package:fitplan/repositories/workout/workout_repository_interface.dart';

class WorkoutRepository implements WorkoutRepositoryInterface {
  @override
  Future<List<Workout>> getExerciseListByDate(DateTime date) async {
    // Функция для проверки, совпадает ли дата тренировки с заданной датой
    bool isSameDay(DateTime a, DateTime b) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }

    // Создаем список моковых тренировок
    final List<Workout> mockWorkouts = [
      Workout(
        id: '1',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.down,
        exercise: const Exercise(
          id: '8',
          name: 'Bicep curls',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '2',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.middle,
        exercise: const Exercise(
          id: '4',
          name: 'Bicep curls2',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '1',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.middle,
        exercise: const Exercise(
          id: '8',
          name: 'Bicep curls',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '8',
        sort: 2,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.middle,
        exercise: const Exercise(
          id: '5',
          name: 'Lunges',
          typeId: ExerciseType(id: 'run', name: 'Runner', icon: '🏃'),
        ),
      ),
      Workout(
        id: '3',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.up,
        exercise: const Exercise(
          id: '2',
          name: 'Bicep curls3',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '5',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: false,
        exercise: const Exercise(
          id: '7',
          name: 'Overhead press',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '9',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: false,
        exercise: const Exercise(
          id: '7',
          name: 'Overhead press',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '🏃'),
        ),
      ),
      Workout(
        id: '9',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: false,
        exercise: const Exercise(
          id: '7',
          name: 'Overhead press',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '🏃'),
        ),
      ),
      Workout(
        id: '1',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.down,
        exercise: const Exercise(
          id: '8',
          name: 'Bicep curls',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '2',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.middle,
        exercise: const Exercise(
          id: '4',
          name: 'Bicep curls2',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '3',
        sort: 1,
        date: DateTime(2024, 5, 20),
        isSet: true,
        exerciseIndicator: LineDirection.up,
        exercise: const Exercise(
          id: '2',
          name: 'Bicep curls3',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '8',
        sort: 2,
        date: DateTime(2024, 5, 21),
        isSet: false,
        exercise: const Exercise(
          id: '5',
          name: 'Lunges',
          typeId: ExerciseType(id: 'run', name: 'Runner', icon: '🏃'),
        ),
      ),
      // Добавьте больше моковых тренировок по необходимости
    ];

    // Фильтруем список тренировок, чтобы вернуть только те, что соответствуют заданной дате
    final List<Workout> workoutsForDate = mockWorkouts.where((workout) {
      return isSameDay(workout.date, date);
    }).toList();

    return workoutsForDate;
  }
}
