import 'package:workout_time/features/workout/domain/entities/exercise.dart';

class Workout {
  final String? title;
  final List<Exercise> exercises;
  Workout({
    required this.title,
    required this.exercises,
  });
}
