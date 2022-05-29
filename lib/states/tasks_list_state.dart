import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/local_storage_service.dart';
import '../services/service_locator.dart';
import 'task_timer_state.dart';

part 'tasks_list_state.g.dart';

class TasksListState = _TasksListState with _$TasksListState;

abstract class _TasksListState with Store {
  late List<TaskTimerState> taskTimerStores;
  final _localStorage = getIt<LocalStorageService>();

  _TasksListState() {
    activeTasks = ObservableList<TaskModel>.of(_localStorage.activeTasks);
    completedTasks = ObservableList<TaskModel>.of(_localStorage.completedTasks);
    taskTimerStores = List.generate(activeTasks.length, (index) {
      return TaskTimerState(activeTasks[index]);
    });
  }

  late ObservableList<TaskModel> activeTasks;

  late ObservableList<TaskModel> completedTasks;

  @computed
  bool get hasNoTasks => activeTasks.isEmpty && completedTasks.isEmpty;

  @action
  void addNewTask(final TaskModel task) {
    activeTasks.add(task);
    taskTimerStores.add(TaskTimerState(task));
    _saveState();
  }

  @action
  void markTaskComplete(final TaskModel task) {
    int index = activeTasks.indexOf(task);
    if (index != -1) {
      activeTasks.removeAt(index);
      taskTimerStores.removeAt(index);
      completedTasks.add(task);
      _saveState();
    }
  }

  @action
  void dismissTask(final TaskModel task) {
    markTaskComplete(task);
    if (completedTasks.contains(task)) {
      completedTasks.remove(task);
      _saveState();
    }
  }

  void _saveState() {
    _localStorage.activeTasks = activeTasks;
    _localStorage.completedTasks = completedTasks;
  }
}
