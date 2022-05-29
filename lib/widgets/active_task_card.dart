import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../states/task_timer_state.dart';
import '../states/tasks_list_state.dart';

class ActiveTaskCard extends StatefulWidget {
  const ActiveTaskCard({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  State<ActiveTaskCard> createState() => _ActiveTaskCardState();
}

class _ActiveTaskCardState extends State<ActiveTaskCard> {
  late final TaskTimerState _taskTimerState = context.read<TaskTimerState>();
  late final TasksListState _tasksListState = context.read<TasksListState>();

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _disposer = autorun((_) {
      if (_taskTimerState.timerInSeconds == 0) {
        _tasksListState.markTaskComplete(widget.task);
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
                      _taskTimerState.timerString,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(width: 8),
                    _buildIconButtonContainer(
                      icon: _taskTimerState.isTimerRunning
                          ? Icons.pause
                          : Icons.play_arrow,
                      onTap: _taskTimerState.isTimerRunning
                          ? _taskTimerState.pauseTimer
                          : _taskTimerState.startTimer,
                    ),
                    const SizedBox(width: 8),
                    _buildIconButtonContainer(
                      icon: Icons.stop,
                      onTap: () {
                        _taskTimerState.pauseTimer();
                        _tasksListState.dismissTask(widget.task);
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
