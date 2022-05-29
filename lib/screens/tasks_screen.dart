import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../states/tasks_list_state.dart';
import '../widgets/active_task_card.dart';
import '../widgets/completed_task_card.dart';
import 'add_task_screen.dart';
import 'no_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('tasks screen rebuilding');
    final tasksListState = context.read<TasksListState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
      ),
      body: Observer(
        builder: (context) {
          return tasksListState.hasNoTasks
              ? const NoTaskScreen()
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => CompletedTaskCard(
                          task: tasksListState.completedTasks[index],
                        ),
                        childCount: tasksListState.completedTasks.length,
                      ),
                    ),
                    if (!tasksListState.hasNoTasks)
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 25),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => Provider.value(
                          value: tasksListState.taskTimerStores[index],
                          key: ValueKey(tasksListState.activeTasks[index]),
                          child: ActiveTaskCard(
                            task: tasksListState.activeTasks[index],
                          ),
                        ),
                        childCount: tasksListState.activeTasks.length,
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
