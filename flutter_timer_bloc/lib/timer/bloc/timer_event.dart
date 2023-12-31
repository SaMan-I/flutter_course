part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted(this.duration);
  final int duration;
}

final class TimerPause extends TimerEvent {
  const TimerPause();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
