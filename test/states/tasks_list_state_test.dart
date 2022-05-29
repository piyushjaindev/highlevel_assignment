import 'package:flutter_test/flutter_test.dart';
import 'package:highlevel_assignment/states/tasks_list_state.dart';

import '../data/tasks_data.dart';

void main() {
  late TasksListState sut;

  setUp(() {
    sut = TasksListState();
  });

  test('check for intial state', () async {
    expect(sut.taskTimerStores.isEmpty, equals(true));
    expect(sut.isEmpty, equals(true));
  });

  group('test task lifecycle', () {
    test('check if task is added to activeTasks list on calling addNewTask',
        () async {
      sut.addNewTask(task1);
      expect(sut.activeTasks.contains(task1), equals(true));
      expect(sut.isEmpty, equals(false));
    });

    test('''check if task is removed from activeTasks list,
     added to completedTasks list on calling markTaskComplete''', () async {
      sut.addNewTask(task1);
      sut.markTaskComplete(task1);
      expect(sut.activeTasks.contains(task1), equals(false));
      expect(sut.completedTasks.contains(task1), equals(true));
      expect(sut.isEmpty, equals(false));
    });

    test(
        'check if task is removed from completedTasks list on calling dismissTask',
        () async {
      sut.addNewTask(task1);
      sut.markTaskComplete(task1);
      sut.dismissTask(task1);
      expect(sut.activeTasks.contains(task1), equals(false));
      expect(sut.completedTasks.contains(task1), equals(false));
      expect(sut.isEmpty, equals(true));
    });
  });
}
