import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highlevel_assignment/states/tasks_list_state.dart';
import 'package:highlevel_assignment/widgets/completed_task_card.dart';
import 'package:provider/provider.dart';

import '../data/tasks_data.dart';

void main() {
  late TasksListState _state;

  setUp(() {
    _state = TasksListState();
  });

  Widget _buildTestableWidget() {
    return Provider.value(
      value: _state,
      child: const MaterialApp(
        home: CompletedTaskCard(task: task1),
      ),
    );
  }

  group('completed task card ui test', () {
    testWidgets('check if task title and description are showing',
        (tester) async {
      await tester.pumpWidget(_buildTestableWidget());
      expect(find.text(task1.title), findsOneWidget);
      expect(find.text(task1.description), findsOneWidget);
    });

    testWidgets('check if mark as complete button is showing', (tester) async {
      await tester.pumpWidget(_buildTestableWidget());
      expect(find.text('MARK COMPLETE'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  // group('completed task card functionality test', () {
  //   testWidgets('check if markTaskComplete is called on tapping Mark Complete',
  //       (tester) async {
  //     await tester.pumpWidget(_buildTestableWidget());
  //     final button = find.byType(ElevatedButton);
  //     tester.tap(button);

  //   });
  // });
}
