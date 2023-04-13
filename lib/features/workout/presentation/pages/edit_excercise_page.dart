import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_time/features/workout/presentation/cubit/workouts_list/workouts_cubit.dart';

import '../../domain/entities/workout.dart';

class EditExerciseScreen extends StatefulWidget {
  final Workout? workout;
  final int workoutIndex;
  final int? exerciseIndex;

  const EditExerciseScreen(
      {super.key,
      this.workout,
      required this.workoutIndex,
      this.exerciseIndex});

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  late TextEditingController? _titleController;

  @override
  void initState() {
    _titleController = TextEditingController(
        text: widget.workout!.exercises[widget.exerciseIndex!].title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.center,
                controller: _titleController,
                onChanged: (value) {
                  setState(() {
                    //cambio il titolo all'esercizio e lo riassegno al workout
                    widget.workout!.exercises[widget.exerciseIndex!] = widget
                        .workout!.exercises[widget.exerciseIndex!]
                        .copyWith(title: value);
                  });
                  //dopo aver aggiornato lo stato del widget
                  //salvo lo stato del cubit
                  // context
                  //     .read<WorkoutsCubit>()
                  //     .saveWorkout(widget.workout!, widget.workoutIndex);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
