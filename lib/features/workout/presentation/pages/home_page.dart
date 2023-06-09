import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_time/features/workout/presentation/cubit/single_workout/single_workout_cubit.dart';

import '../../../../core/utils/helpers.dart';
import '../cubit/workouts_list/workouts_cubit.dart';

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
      body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
        builder: (context, state) {
          switch (state.status) {
            case WorkoutsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case WorkoutsStatus.error:
              return const Center(
                child: Text(
                  "OOPS!",
                ),
              );
            case WorkoutsStatus.loaded:
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                // color: Colors.amber,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ExpansionPanelList.radio(
                    elevation: 0,
                    children: state.workouts.asMap().entries.map(
                      (e) {
                        final workout = e.value;
                        final index = e.key;
                        return ExpansionPanelRadio(
                          value: workout,
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              //Visual Density per renderlo uniforme su tutti i device
                              visualDensity: const VisualDensity(
                                  horizontal: 0,
                                  vertical: VisualDensity.maximumDensity),
                              leading: IconButton(
                                onPressed: () {
                                  context
                                      .read<SingleWorkoutCubit>()
                                      .editWorkout(workout, index);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              title: Text(workout.title!),
                              trailing:
                                  Text(formatTime(workout.totalTime, false)),
                            );
                          },
                          body: ListView.builder(
                            primary: false,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shrinkWrap: true,
                            itemCount: workout.exercises.length,
                            itemBuilder: (context, index) {
                              final ex = workout.exercises[index];
                              return ListTile(
                                onTap: null,
                                visualDensity: const VisualDensity(
                                    horizontal: 0,
                                    vertical: VisualDensity.maximumDensity),
                                leading: Text(
                                  formatTime(
                                    ex.prelude!,
                                    true,
                                  ),
                                ),
                                title: Text(ex.title!),
                                trailing: Text(formatTime(ex.duration!, true)),
                              );
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
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
