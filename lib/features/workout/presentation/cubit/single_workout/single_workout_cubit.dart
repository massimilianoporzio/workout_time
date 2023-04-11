import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout.dart';

part 'single_workout_state.dart';

class SingleWorkoutCubit extends Cubit<SingleWorkoutState> {
  SingleWorkoutCubit() : super(SingleWorkoutState.initial());
}