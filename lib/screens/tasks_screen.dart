import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/task_timer_store.dart';
import '../stores/tasks_store.dart';
import '../widgets/active_task_card.dart';
import '../widgets/completed_task_card.dart';
import 'add_task_screen.dart';
import 'no_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('tasks screen rebuilding');
    final tasksStore = context.read<TasksStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
      ),
      body: Observer(
        builder: (context) {
          return tasksStore.isEmpty
              ? const NoTaskScreen()
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => CompletedTaskCard(
                          task: tasksStore.completedTasks[index],
                        ),
                        childCount: tasksStore.completedTasks.length,
                      ),
                    ),
                    if (!tasksStore.isEmpty)
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 25),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => Provider.value(
                          value: tasksStore.taskTimerStores[index],
                          key: ValueKey(tasksStore.activeTasks[index]),
                          child: ActiveTaskCard(
                            task: tasksStore.activeTasks[index],
                          ),
                        ),
                        childCount: tasksStore.activeTasks.length,
                      ),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTaskScreen(),
          );
        },
        child: const Icon(
          Icons.add_circle_outline_outlined,
          size: 35,
        ),
      ),
    );
  }
}
