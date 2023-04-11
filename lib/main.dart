import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_time/features/workout/presentation/cubit/workout_cubit.dart';

void main() {
  runApp(const WorkoutTime());
}

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 66, 74, 96),
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) {
          WorkoutCubit workoutCubit = WorkoutCubit();
          if (workoutCubit.state.workouts.isEmpty) {
            workoutCubit.getWorkouts();
            //aggiorna già lo stato in fase di creazione così quello che arriva è
            //già con la lista popolata.
          }
          return workoutCubit;
        },
        child: Container(),
      ),
    );
  }
}
