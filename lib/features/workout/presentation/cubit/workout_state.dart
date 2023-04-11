part of 'workout_cubit.dart';

enum WorkoutStatus {
  initial,
  loading,
  loaded,
  error,
}

class WorkoutState extends Equatable {
  final WorkoutStatus status;
  final List<Workout> workouts;
  const WorkoutState({required this.status, required this.workouts});

  factory WorkoutState.initial() {
    return const WorkoutState(
        workouts: [], status: WorkoutStatus.initial); //inizio con lista vuota
  }

  @override
  List<Object> get props => [workouts];

  @override
  bool? get stringify => true;

  WorkoutState copyWith({
    WorkoutStatus? status,
    List<Workout>? workouts,
  }) {
    return WorkoutState(
      status: status ?? this.status,
      workouts: workouts ?? this.workouts,
    );
  }
}
