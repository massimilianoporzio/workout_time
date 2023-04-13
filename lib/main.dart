import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_time/features/workout/presentation/cubit/single_workout/single_workout_cubit.dart';

import 'package:workout_time/features/workout/presentation/pages/home_page.dart';

import 'features/workout/presentation/cubit/workouts_list/workouts_cubit.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  runApp(const WorkoutTime());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class WorkoutTime extends StatelessWidget with UiLoggy {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'My Workouts',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Color.fromARGB(255, 66, 74, 96),
            ),
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SingleWorkoutCubit(),
            ),
            BlocProvider(create: (context) {
              WorkoutsCubit workoutCubit = WorkoutsCubit();
              if (workoutCubit.state.workouts.isEmpty) {
                loggy.debug("...loading json since the state is empty");
                workoutCubit.getWorkouts();
                //aggiorna già lo stato in fase di creazione così quello che arriva è
                //già con la lista popolata.
              } else {
                loggy.debug("...the state is not empty...");
              }
              return workoutCubit;
            }),
          ],
          child: BlocBuilder<SingleWorkoutCubit, SingleWorkoutState>(
            builder: (context, state) {
              if (state is SingleWorkoutStateInitial) {
                return const HomePage();
              } else if (state is SingleWorkoutEditing) {
                return Container();
              }
              return Container();
            },
          ),
        ));
  }
}
