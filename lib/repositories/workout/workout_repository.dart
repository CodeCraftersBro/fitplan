import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';


class WorkoutRepository implements WorkoutRepositoryInterface {
  @override
  Future<List<Workout>> getExerciseListByDate(DateTime date) async {
    // Replace this with your actual implementation to fetch workouts from a database or other source
    // This is a placeholder implementation for demonstration purposes.

    final today = DateTime.now();
     bool isSameDay(DateTime a, DateTime b) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }
    
   
    var workouts = [ 
      // Workouts for today
      if (isSameDay(date, today))
        Workout(
          id: '1',
          sort: 1,
          date: date,
          setId: 1,
          exercise: Exercise(
            id: '1',
            name: 'Push-ups',
            typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
          ),
        ),
      Workout(
        id: '2',
        sort: 3,
        date: date,
        setId: null,
        exercise: Exercise(
          id: '2',
          name: 'Squats',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
      Workout(
        id: '3',
        sort: 2,
        date: date,
        setId: 1,
        exercise: Exercise(
          id: '4',
          name: 'Push-downs',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),

      // Workouts for tomorrow
      if (isSameDay(date, today.add(const Duration(days: 1))))
        Workout(
          id: '4',
          sort: 1,
          date: date,
          setId: 2,
          exercise: Exercise(
            id: '5',
            name: 'Lunges',
            typeId: ExerciseType(id: 'strength', name: 'Runner', icon: '🏃'),
          ),
        ),
      Workout(
        id: '5',
        sort: 2,
        date: date,
        setId: 3,
        exercise: Exercise(
          id: '6',
          name: 'Rows',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),

      // Workouts for the day after tomorrow
      if (isSameDay(date, today.add(const Duration(days: 2))))
        Workout(
          id: '6',
          sort: 1,
          date: date,
          setId: 3,
          exercise: Exercise(
            id: '7',
            name: 'Overhead press',
            typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
          ),
        ),
      Workout(
        id: '7',
        sort: 2,
        date: date,
        setId: 3,
        exercise: Exercise(
          id: '8',
          name: 'Bicep curls',
          typeId: ExerciseType(id: 'strength', name: 'Strength', icon: '💪'),
        ),
      ),
    ];
    workouts.sort((a, b) => a.sort.compareTo(b.sort));
    // workouts = [];
    return workouts;
  }
}
