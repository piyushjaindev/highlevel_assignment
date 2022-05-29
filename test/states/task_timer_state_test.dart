import 'package:flutter_test/flutter_test.dart';
import 'package:highlevel_assignment/states/task_timer_state.dart';

import '../data/tasks_data.dart';

void main() {
  late TaskTimerState sut;

  setUp(() {
    sut = TaskTimerState(task1);
  });

  test('check for intial state', () async {
    expect(sut.timerInSeconds, equals(task1.duration.inSeconds));
    expect(sut.isTimerRunning, equals(false));
  });

  group('test startTimer function', () {
    test('check if timer starts on calling startTimer', () async {
      sut.startTimer();
      expect(sut.isTimerRunning, equals(true));
    });

    test('check if timer is stopped when timerInSeconds is zero', () async {
      sut.startTimer();
      await Future.delayed(task1.duration);
      await Future.delayed(const Duration(seconds: 1));
      expect(sut.isTimerRunning, equals(false));
    });
  });

  group('test pauseTimer function', () {
    test('check if timer is cancelled on calling pauseTimer', () async {
      sut.pauseTimer();
      expect(sut.isTimerRunning, equals(false));
    });
  });
}
