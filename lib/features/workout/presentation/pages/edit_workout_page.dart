import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_time/core/utils/helpers.dart';
import 'package:workout_time/features/workout/presentation/cubit/single_workout/single_workout_cubit.dart';
import 'package:workout_time/features/workout/presentation/pages/edit_excercise_page.dart';

class EditWorkoutPage extends StatelessWidget with UiLoggy {
  const EditWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: BlocBuilder<SingleWorkoutCubit, SingleWorkoutState>(
      builder: (context, state) {
        //so che lo stato è editing e lo casto
        SingleWorkoutEditing we = state as SingleWorkoutEditing;
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => context.read<SingleWorkoutCubit>().goHome(),
            ),
          ),
          body: ListView.builder(
            itemCount: we.workout!.exercises.length, //so che non è nullo
            itemBuilder: (context, index) {
              var exercise = we.workout!.exercises[index];
              if (we.exerciseIndex == index) {
                //se l'indice di esercizio emesso è lo stesso dell'esercizio su cui ho cliccato
                return EditExerciseScreen(
                  workout: we.workout,
                  workoutIndex: we.index,
                  exerciseIndex: index,
                );
              } else {
                return ListTile(
                  leading: Text(formatTime(exercise.prelude!, true)),
                  title: Text(exercise.title!),
                  trailing: Text(formatTime(exercise.duration!, true)),
                  onTap: () {
                    loggy.debug("TAPPED ON EXERCISE ${exercise.title!}");
                    context.read<SingleWorkoutCubit>().editExercise(index);
                  },
                );
              }
            },
          ),
        );
      },
    ), onWillPop: () async {
      context.read<SingleWorkoutCubit>().goHome();
      return await Future.value(true);
    });
  }
}
