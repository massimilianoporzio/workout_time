class Exercise {
  Exercise({
    required this.title,
    required this.prelude,
    required this.duration,
    this.index,
    this.startTime,
  });

  final String title;
  final int prelude;
  final int duration;
  final int? index;
  final int? startTime;
}
