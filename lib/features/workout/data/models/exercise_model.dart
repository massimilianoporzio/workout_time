import 'package:workout_time/features/workout/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.title,
    required super.prelude,
    required super.duration,
    super.index,
    super.startTime,
  });

  factory ExerciseModel.fromJson(
          Map<String, dynamic> json, int index, int startTime) =>
      ExerciseModel(
          title: json["title"],
          prelude: json["prelude"],
          duration: json["duration"],
          index: index,
          startTime: startTime);

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };
}
