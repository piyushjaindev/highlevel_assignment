import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../stores/tasks_store.dart';

class CompletedTaskCard extends StatelessWidget {
  const CompletedTaskCard({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.67,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).canvasColor,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/sound_wave.svg',
                          width: 24,
                        ),
                        Text(
                          'FINISHED',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/sound_wave.svg',
                          width: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          task.description,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TasksStore>().dismissTask(task);
              },
              child: const Text('MARK COMPLETE'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
