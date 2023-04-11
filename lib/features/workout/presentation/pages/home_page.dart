import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_time/features/workout/presentation/cubit/workout_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Time!"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.event_available)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body:
          SingleChildScrollView(child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          switch (state.status) {
            case WorkoutStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case WorkoutStatus.error:
              return const Center(
                child: Text(
                  "OOPS!",
                ),
              );
            case WorkoutStatus.loaded:
              return ExpansionPanelList.radio(
                children: state.workouts.map((e) => ExpansionPanelRadio(
                      value: value,
                      headerBuilder: headerBuilder,
                      body: body,
                    )),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      )),
    );
  }
}
