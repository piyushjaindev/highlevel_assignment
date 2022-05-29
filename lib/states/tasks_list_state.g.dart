// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksListState on _TasksListState, Store {
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_TasksListState.isEmpty'))
      .value;

  late final _$activeTasksAtom =
      Atom(name: '_TasksListState.activeTasks', context: context);

  @override
  ObservableList<TaskModel> get activeTasks {
    _$activeTasksAtom.reportRead();
    return super.activeTasks;
  }

  @override
  set activeTasks(ObservableList<TaskModel> value) {
    _$activeTasksAtom.reportWrite(value, super.activeTasks, () {
      super.activeTasks = value;
    });
  }

  late final _$completedTasksAtom =
      Atom(name: '_TasksListState.completedTasks', context: context);

  @override
  ObservableList<TaskModel> get completedTasks {
    _$completedTasksAtom.reportRead();
    return super.completedTasks;
  }

  @override
  set completedTasks(ObservableList<TaskModel> value) {
    _$completedTasksAtom.reportWrite(value, super.completedTasks, () {
      super.completedTasks = value;
    });
  }

  late final _$_TasksListStateActionController =
      ActionController(name: '_TasksListState', context: context);

  @override
  void addNewTask(TaskModel task) {
    final _$actionInfo = _$_TasksListStateActionController.startAction(
        name: '_TasksListState.addNewTask');
    try {
      return super.addNewTask(task);
    } finally {
      _$_TasksListStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markTaskComplete(TaskModel task) {
    final _$actionInfo = _$_TasksListStateActionController.startAction(
        name: '_TasksListState.markTaskComplete');
    try {
      return super.markTaskComplete(task);
    } finally {
      _$_TasksListStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dismissTask(TaskModel task) {
    final _$actionInfo = _$_TasksListStateActionController.startAction(
        name: '_TasksListState.dismissTask');
    try {
      return super.dismissTask(task);
    } finally {
      _$_TasksListStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeTasks: ${activeTasks},
completedTasks: ${completedTasks},
isEmpty: ${isEmpty}
    ''';
  }
}
