import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_workout_state.dart';

class SingleWorkoutCubit extends Cubit<SingleWorkoutState> {
  SingleWorkoutCubit() : super(SingleWorkoutInitial());
}
