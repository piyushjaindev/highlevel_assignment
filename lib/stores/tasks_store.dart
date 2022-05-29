import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import 'task_timer_store.dart';

part 'tasks_store.g.dart';

class TasksStore = _TasksStore with _$TasksStore;

abstract class _TasksStore with Store {
  List<TaskTimerStore> taskTimerStores = [];

  @observable
  ObservableList<TaskModel> activeTasks = ObservableList<TaskModel>();

  @observable
  ObservableList<TaskModel> completedTasks = ObservableList<TaskModel>();

  @computed
  bool get isEmpty => activeTasks.isEmpty && completedTasks.isEmpty;

  @action
  void addNewTask(final TaskModel task) {
    activeTasks.add(task);
    taskTimerStores.add(TaskTimerStore(task));
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
