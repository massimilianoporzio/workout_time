part of 'workouts_cubit.dart';

enum WorkoutsStatus {
  initial,
  loading,
  loaded,
  error,
}

class WorkoutsState extends Equatable {
  final WorkoutsStatus status;
  final List<Workout> workouts;
  const WorkoutsState({required this.status, required this.workouts});

  factory WorkoutsState.initial() {
    return const WorkoutsState(
        workouts: [], status: WorkoutsStatus.initial); //inizio con lista vuota
  }

  @override
  List<Object> get props => [workouts];

  @override
  bool? get stringify => true;

  WorkoutsState copyWith({
    WorkoutsStatus? status,
    List<Workout>? workouts,
  }) {
    return WorkoutsState(
      status: status ?? this.status,
      workouts: workouts ?? this.workouts,
    );
  }
}
