import 'package:flutter/material.dart';

import '../widgets/active_task_card.dart';
import '../widgets/completed_task_card.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => const CompletedTaskCard(),
              childCount: 3,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => const ActiveTaskCard(),
              childCount: 5,
            ),
          ),
        ],
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
