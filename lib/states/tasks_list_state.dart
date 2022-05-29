import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import 'task_timer_state.dart';

part 'tasks_list_state.g.dart';

class TasksListState = _TasksListState with _$TasksListState;

abstract class _TasksListState with Store {
  List<TaskTimerState> taskTimerStores = [];

  @observable
  ObservableList<TaskModel> activeTasks = ObservableList<TaskModel>();

  @observable
  ObservableList<TaskModel> completedTasks = ObservableList<TaskModel>();

  @computed
  bool get isEmpty => activeTasks.isEmpty && completedTasks.isEmpty;

  @action
  void addNewTask(final TaskModel task) {
    activeTasks.add(task);
    taskTimerStores.add(TaskTimerState(task));
  }

  @action
  void markTaskComplete(final TaskModel task) {
    int index = activeTasks.indexOf(task);
    if (index != -1) {
      activeTasks.removeAt(index);
      taskTimerStores.removeAt(index);
      completedTasks.add(task);
    }
  }

  @action
  void dismissTask(final TaskModel task) {
    markTaskComplete(task);
    completedTasks.remove(task);
  }
}
