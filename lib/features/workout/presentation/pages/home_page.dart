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
      body: BlocBuilder<WorkoutCubit, WorkoutState>(
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
              return SingleChildScrollView(
                child: ExpansionPanelList.radio(
                  children: state.workouts
                      .map(
                        (workout) => ExpansionPanelRadio(
                          value: workout,
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              //Visual Density per renderlo uniforme su tutti i device
                              visualDensity: const VisualDensity(
                                  horizontal: 0,
                                  vertical: VisualDensity.maximumDensity),
                              leading: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              title: Text(workout.title!),
                            );
                          },
                          body: ListView.builder(
                            shrinkWrap: true,
                            itemCount: workout.exercises.length,
                            itemBuilder: (context, index) {
                              final ex = workout.exercises[index];
                              return ListTile(
                                onTap: null,
                                visualDensity: const VisualDensity(
                                    horizontal: 0,
                                    vertical: VisualDensity.maximumDensity),
                                leading: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                title: Text(ex.title!),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
