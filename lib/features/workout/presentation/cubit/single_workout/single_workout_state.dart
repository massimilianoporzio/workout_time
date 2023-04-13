part of 'single_workout_cubit.dart';

abstract class SingleWorkoutState extends Equatable {
  final Workout? workout;
  final int? elapsed;

  const SingleWorkoutState({
    this.workout,
    this.elapsed,
  });

  @override
  List<Object?> get props => [workout, elapsed];
}

class SingleWorkoutStateInitial extends SingleWorkoutState {
  const SingleWorkoutStateInitial()
      : super(
          elapsed: 0,
        );

  @override
  List<Object> get props => [];
}

class SingleWorkoutEditing extends SingleWorkoutState {
  final int index;
  final int? exerciseIndex; //indice dell'eventuale esercizio da editare
  const SingleWorkoutEditing(
      {super.workout, required this.index, this.exerciseIndex})
      : super(elapsed: 0);

  @override
  List<Object?> get props => [workout, index, exerciseIndex];

  SingleWorkoutEditing copyWith({
    int? index,
  }) {
    return SingleWorkoutEditing(
      index: index ?? this.index,
    );
  }
}
