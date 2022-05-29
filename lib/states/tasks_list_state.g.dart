// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksListState on _TasksListState, Store {
  Computed<bool>? _$hasNoTasksComputed;

  @override
  bool get hasNoTasks =>
      (_$hasNoTasksComputed ??= Computed<bool>(() => super.hasNoTasks,
              name: '_TasksListState.hasNoTasks'))
          .value;

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
hasNoTasks: ${hasNoTasks}
    ''';
  }
}
