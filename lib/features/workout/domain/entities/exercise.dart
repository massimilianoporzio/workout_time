import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  Exercise({
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
}
