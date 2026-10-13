import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/core/network/api_results.dart';
import 'package:islami/modules/layout/timer/domain/entities/timer_entity.dart';
import 'package:islami/modules/layout/timer/domain/use_case/timer_use_case.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final TimerUseCase timerUseCase;

  TimerBloc(this.timerUseCase) : super(TimerInitial()) {
    on<GetPrayTimeEvent>(_onGetPrayTimeEvent);
  }

  Future<void> _onGetPrayTimeEvent(
    GetPrayTimeEvent event,
    Emitter<TimerState> emit,
  ) async {
    emit(TimerLoading());
    final result = await timerUseCase.call();
    switch (result) {
      case SuccessRequest(data: final prayerTimes):
        emit(TimerSuccess(prayerTimes));
      case FailureRequest(exception: final exception):
        emit(TimerError(exception.message ?? "Something went wrong"));
    }
  }
}
