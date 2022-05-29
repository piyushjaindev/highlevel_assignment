import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../stores/task_timer_store.dart';
import '../stores/tasks_store.dart';

class ActiveTaskCard extends StatefulWidget {
  const ActiveTaskCard({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  State<ActiveTaskCard> createState() => _ActiveTaskCardState();
}

class _ActiveTaskCardState extends State<ActiveTaskCard> {
  late final TaskTimerStore _taskTimerStore = context.read<TaskTimerStore>();
  late final TasksStore _tasksStore = context.read<TasksStore>();

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _disposer = autorun((_) {
      if (_taskTimerStore.timerInSeconds == 0) {
        _tasksStore.markTaskComplete(widget.task);
      }
    });
  }

  @override
  void dispose() {
    log('active task card dispose method');
    _disposer();
    super.dispose();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Observer(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _taskTimerStore.timerString,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(width: 8),
                    _buildIconButtonContainer(
                      icon: _taskTimerStore.isTimerRunning
                          ? Icons.pause
                          : Icons.play_arrow,
                      onTap: _taskTimerStore.isTimerRunning
                          ? _taskTimerStore.pauseTimer
                          : _taskTimerStore.startTimer,
                    ),
                    const SizedBox(width: 8),
                    _buildIconButtonContainer(
                      icon: Icons.stop,
                      onTap: () {
                        _taskTimerStore.pauseTimer();
                        _tasksStore.dismissTask(widget.task);
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(height: 11),
              Text(
                widget.task.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    widget.task.description,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButtonContainer(
      {required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xFF5B5B7D),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
