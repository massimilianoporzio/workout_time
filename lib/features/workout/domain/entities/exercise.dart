import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  const Exercise({
    required this.title,
    required this.prelude,
    required this.duration,
    this.index,
    this.startTime,
  });

  final String? title;
  final int? prelude;
  final int? duration;
  final int? index;
  final int? startTime;

  @override
  List<Object?> get props {
    return [
      title,
      prelude,
      duration,
      index,
      startTime,
    ];
  }

  @override
  bool? get stringify => true;

  Exercise copyWith({
    String? title,
    int? prelude,
    int? duration,
    int? index,
    int? startTime,
  }) {
    return Exercise(
      title: title ?? this.title,
      prelude: prelude ?? this.prelude,
      duration: duration ?? this.duration,
      index: index ?? this.index,
      startTime: startTime ?? this.startTime,
    );
  }
}
