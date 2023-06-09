import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout.dart';

part 'single_workout_state.dart';

class SingleWorkoutCubit extends Cubit<SingleWorkoutState> {
  SingleWorkoutCubit() : super(const SingleWorkoutStateInitial());

  editWorkout(Workout workout, int index) {
    emit(SingleWorkoutEditing(workout: workout, index: index));
  }

  editExercise(int? exerciseIndex) {
    emit(SingleWorkoutEditing(
        workout: state.workout,
        index: (state as SingleWorkoutEditing).index,
        exerciseIndex: exerciseIndex));
  }

  void goHome() {
    emit(const SingleWorkoutStateInitial());
  }
}
