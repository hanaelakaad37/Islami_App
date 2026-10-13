import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/modules/layout/radio/domain/entities/radio_entity.dart';
import 'package:islami/modules/layout/radio/domain/use_cases/radio_use_case.dart';

import '../../../../../core/network/api_results.dart';
import '../../../../../core/services/audio_play_service.dart';

part 'radio_event.dart';
part 'radio_state.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  final RadioUseCase radioUseCase;
  final AudioPlayService audioPlayerService;

  RadioBloc({required this.radioUseCase, required this.audioPlayerService})
    : super(RadioInitial()) {
    on<GetRadioEvent>(_onGetRadioEvent);
    on<PlayAudioEvent>(_onPlayRadioEvent);
    on<StopAudioEvent>(_onStopRadioEvent);
    on<ToggleMuteEvent>(_onToggleMuteEvent);
  }

  Future<void> _onGetRadioEvent(
    GetRadioEvent event,
    Emitter<RadioState> emit,
  ) async {
    emit(RadioLoading());

    final result = await radioUseCase.call();

    switch (result) {
      case SuccessRequest(data: final radioEntity):
        emit(
          RadioSuccess(
            radioEntity: radioEntity,
            currentURL: null,
            isPlaying: false,
            isMuted: false,
          ),
        );

      case FailureRequest(exception: final exception):
        emit(RadioError(exception.message ?? "Something went wrong"));
    }
  }

  Future<void> _onPlayRadioEvent(
    PlayAudioEvent event,
    Emitter<RadioState> emit,
  ) async {
    await audioPlayerService.play(event.url);

    if (state is RadioSuccess) {
      final currentState = state as RadioSuccess;

      final bool isNewRadio = currentState.currentURL != event.url;

      emit(
        RadioSuccess(
          radioEntity: currentState.radioEntity,
          currentURL: audioPlayerService.currentURL,
          isPlaying: audioPlayerService.isPlaying,
          isMuted: isNewRadio ? false : currentState.isMuted,
        ),
      );
    }
  }

  Future<void> _onStopRadioEvent(
    StopAudioEvent event,
    Emitter<RadioState> emit,
  ) async {
    await audioPlayerService.stop();

    if (state is RadioSuccess) {
      final currentState = state as RadioSuccess;

      emit(
        RadioSuccess(
          radioEntity: currentState.radioEntity,
          currentURL: null,
          isPlaying: false,
          isMuted: false,
        ),
      );
    }
  }

  Future<void> _onToggleMuteEvent(
    ToggleMuteEvent event,
    Emitter<RadioState> emit,
  ) async {
    if (state is RadioSuccess) {
      final currentState = state as RadioSuccess;

      final newIsMuted = !currentState.isMuted;

      await audioPlayerService.mute(newIsMuted ? 0.0 : 1.0);

      emit(
        RadioSuccess(
          radioEntity: currentState.radioEntity,
          currentURL: currentState.currentURL,
          isPlaying: currentState.isPlaying,
          isMuted: newIsMuted,
        ),
      );
    }
  }
}
