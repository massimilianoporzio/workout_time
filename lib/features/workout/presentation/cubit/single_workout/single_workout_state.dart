part of 'single_workout_cubit.dart';

class SingleWorkoutState extends Equatable {
  final Workout? workout;
  final int? elapsed;

  const SingleWorkoutState({
    this.workout,
    this.elapsed,
  });

  factory SingleWorkoutState.initial() =>
      const SingleWorkoutState(elapsed: 0, workout: null);

  @override
  List<Object?> get props => [workout, elapsed];
}
