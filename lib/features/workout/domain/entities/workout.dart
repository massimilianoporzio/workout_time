import 'package:equatable/equatable.dart';

import 'package:workout_time/features/workout/domain/entities/exercise.dart';

class Workout extends Equatable {
  final String? title;
  final List<Exercise> exercises;
  const Workout({
    required this.title,
    required this.exercises,
  });

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool? get stringify => true;

  int get totalTime {
    if (exercises.isEmpty) {
      return 0;
    } else {
      var time = exercises.fold(
          0,
          (previousValue, element) =>
              previousValue + element.prelude! + element.duration!);
      return time;
    }
  }
}
