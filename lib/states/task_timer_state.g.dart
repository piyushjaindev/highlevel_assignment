// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_timer_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskTimerState on _TaskTimerState, Store {
  Computed<String>? _$timerStringComputed;

  @override
  String get timerString =>
      (_$timerStringComputed ??= Computed<String>(() => super.timerString,
              name: '_TaskTimerState.timerString'))
          .value;
  Computed<bool>? _$isTimerRunningComputed;

  @override
  bool get isTimerRunning =>
      (_$isTimerRunningComputed ??= Computed<bool>(() => super.isTimerRunning,
              name: '_TaskTimerState.isTimerRunning'))
          .value;

  late final _$_timerAtom =
      Atom(name: '_TaskTimerState._timer', context: context);

  @override
  Timer? get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer? value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  late final _$timerInSecondsAtom =
      Atom(name: '_TaskTimerState.timerInSeconds', context: context);

  @override
  int get timerInSeconds {
    _$timerInSecondsAtom.reportRead();
    return super.timerInSeconds;
  }

  @override
  set timerInSeconds(int value) {
    _$timerInSecondsAtom.reportWrite(value, super.timerInSeconds, () {
      super.timerInSeconds = value;
    });
  }

  late final _$_TaskTimerStateActionController =
      ActionController(name: '_TaskTimerState', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_TaskTimerStateActionController.startAction(
        name: '_TaskTimerState.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_TaskTimerStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseTimer() {
    final _$actionInfo = _$_TaskTimerStateActionController.startAction(
        name: '_TaskTimerState.pauseTimer');
    try {
      return super.pauseTimer();
    } finally {
      _$_TaskTimerStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timerInSeconds: ${timerInSeconds},
timerString: ${timerString},
isTimerRunning: ${isTimerRunning}
    ''';
  }
}
