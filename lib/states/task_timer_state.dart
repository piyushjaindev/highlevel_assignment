import 'dart:async';

import 'package:mobx/mobx.dart';

import '../models/task_model.dart';

part 'task_timer_state.g.dart';

class TaskTimerState extends _TaskTimerState with _$TaskTimerState {
  TaskTimerState(super.task);
}

abstract class _TaskTimerState with Store {
  final TaskModel task;

  _TaskTimerState(this.task) {
    timerInSeconds = task.duration.inSeconds;
  }

  @observable
  Timer? _timer;

  @observable
  int timerInSeconds = 0;

  @computed
  String get timerString {
    final hours = timerInSeconds ~/ 3600;
    final minutes = (timerInSeconds % 3600) ~/ 60;
    final seconds = timerInSeconds % 60;

    final hoursString = hours < 10 ? '0$hours' : '$hours';
    final minutesString = minutes < 10 ? '0$minutes' : '$minutes';
    final secondsString = seconds < 10 ? '0$seconds' : '$seconds';

    return '$hoursString:$minutesString:$secondsString';
  }

  @computed
  bool get isTimerRunning => _timer != null;

  @action
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerInSeconds > 0) {
        timerInSeconds--;
      } else {
        pauseTimer();
      }
    });
  }

  @action
  void pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
