import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highlevel_assignment/states/task_timer_state.dart';
import 'package:highlevel_assignment/states/tasks_list_state.dart';
import 'package:highlevel_assignment/widgets/active_task_card.dart';
import 'package:provider/provider.dart';

import '../data/tasks_data.dart';

void main() {
  late TaskTimerState _state;
  const _playKey = ValueKey('play');
  const _pauseKey = ValueKey('pause');

  setUp(() {
    _state = TaskTimerState(task1);
  });

  Widget _buildTestableWidget() {
    return Provider.value(
      value: _state,
      child: const MaterialApp(
        home: ActiveTaskCard(task: task1),
      ),
    );
  }

  group('active task card ui test', () {
    testWidgets('check if task title and description are showing',
        (tester) async {
      await tester.pumpWidget(_buildTestableWidget());
      expect(find.text(task1.title), findsOneWidget);
      expect(find.text(task1.description), findsOneWidget);
      expect(find.text(_state.timerString), findsOneWidget);
    });
  });

  group('active task card functionality test', () {
    testWidgets('check if play button changes to pause button on tapping play',
        (tester) async {
      await tester.pumpWidget(_buildTestableWidget());
      final playButton = find.byKey(_playKey);
      await tester.tap(playButton);
      await tester.pump();
      expect(find.byKey(_pauseKey), findsOneWidget);
      expect(find.byKey(_playKey), findsNothing);
      _state.pauseTimer();
    });

    testWidgets('check if pause button changes to play button on tapping pause',
        (tester) async {
      await tester.pumpWidget(_buildTestableWidget());
      final playButton = find.byKey(_playKey);
      await tester.tap(playButton);
      await tester.pump();
      final pauseButton = find.byKey(_pauseKey);
      await tester.tap(pauseButton);
      await tester.pump();
      expect(find.byKey(_pauseKey), findsNothing);
      expect(find.byKey(_playKey), findsOneWidget);
    });
  });
}
