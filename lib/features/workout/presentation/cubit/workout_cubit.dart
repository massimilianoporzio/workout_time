import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_time/features/workout/data/models/workout_model.dart';
import 'package:workout_time/features/workout/domain/entities/workout.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> with UiLoggy {
  WorkoutCubit() : super(WorkoutState.initial());

  getWorkouts() async {
    emit(state.copyWith(status: WorkoutStatus.loading));
    final List<Workout> workouts = [];

    try {
      await Future.delayed(const Duration(seconds: 2));
      final workoutsJson = jsonDecode(await rootBundle
          .loadString("assets/workouts.json")); //SIMULA API CALL
      for (var el in workoutsJson as Iterable) {
        workouts.add(WorkoutModel.fromJson(el));
      }
      emit(state.copyWith(workouts: workouts, status: WorkoutStatus.loaded));
    } on Exception catch (e) {
      loggy.error(e.toString());
      emit(state.copyWith(status: WorkoutStatus.error));
    }
  }
}
