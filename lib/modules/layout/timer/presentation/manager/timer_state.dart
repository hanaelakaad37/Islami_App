part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState();
}

final class TimerInitial extends TimerState {
  @override
  List<Object> get props => [];
}

class TimerLoading extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerSuccess extends TimerState {
  final PrayerTimesEntity prayerTimes;

  const TimerSuccess(this.prayerTimes);

  @override
  List<Object?> get props => [prayerTimes];
}

class TimerError extends TimerState {
  final String message;

  const TimerError(this.message);

  @override
  List<Object?> get props => [message];
}
