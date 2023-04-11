import 'package:workout_time/features/workout/data/models/exercise_model.dart';
import 'package:workout_time/features/workout/domain/entities/exercise.dart';

import '../../domain/entities/workout.dart';

class WorkoutModel extends Workout {
  WorkoutModel({
    required super.title,
    required super.exercises,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = [];
    int index = 0;
    int startTime = 0;
    for (var ex in json['exercises'] as Iterable) {
      exercises.add(ExerciseModel.fromJson(json, index, startTime));
      index++;
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return WorkoutModel(title: json['title'] as String?, exercises: exercises);
  }

  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};
}
