import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';// Replace with the actual file name
// Use the @GenerateMocks annotation to specify which classes to mock.
@GenerateMocks([MockApiClient]) // Replace ApiClient with the actual class you want to mock
void main() {
  // Run the build_runner command to generate the mock class.
  // flutter pub run build_runner build

  group('ExerciseTypeRepository', () {
    // Create an instance of the repository to test.
    final repository = ExerciseTypeRepository();
    // Create a mock API client.
    final mockApiClient = MockApiClient();

    test('updates exercise types from API', () async {
      // Use Mockito to simulate the API call.
      when(mockApiClient.fetchExerciseTypesFromAPI())
          .thenAnswer((_) async => [
                ExerciseType(id: '1', name: 'New Cardio', icon: 'assets/icons/cardio.png'),
                // Add any new or updated exercise types here...
              ]);

      // Update the repository with the mocked API data.
      await repository.updateExerciseTypesFromAPI();

      // Verify that the local cache has been updated.
      final exerciseTypes = await repository.getExerciseTypes();
      expect(exerciseTypes, isNotEmpty);
      expect(exerciseTypes.first.name, equals('New Cardio'));
    });
  });
}
