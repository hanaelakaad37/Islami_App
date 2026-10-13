import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/network/api_results.dart';
import '../../../../../core/services/audio_play_service.dart';
import '../../domain/entities/reciters_entity.dart';
import '../../domain/use_cases/reciters_use_case.dart';

part 'reciters_event.dart';
part 'reciters_state.dart';

class RecitersBloc extends Bloc<RecitersEvent, RecitersState> {
  final AudioPlayService audioService = GetIt.I<AudioPlayService>();

  RecitersBloc() : super(RecitersInitial()) {
    on<GetRecitersEvent>(_onGetRecitersEvent);
    on<PlayReciterEvent>(_onPlayReciterEvent);
    on<MuteReciterEvent>(_onMuteReciterEvent);
    on<NextSurahEvent>(_onNextSurahEvent);
    on<PreviousSurahEvent>(_onPreviousSurahEvent);
  }

  FutureOr<void> _onGetRecitersEvent(
    GetRecitersEvent event,
    Emitter<RecitersState> emit,
  ) async {
    emit(RecitersLoading());

    final result = await GetIt.I<RecitersUseCase>().call();

    switch (result) {
      case SuccessRequest(data: final recitersEntity):
        emit(
          RecitersSuccess(
            recitersEntity: recitersEntity,
            currentURL: audioService.currentURL,
            isPlaying: audioService.isPlaying,
            isMuted: audioService.currentVolume == 0,
          ),
        );

      case FailureRequest(exception: final exception):
        emit(RecitersError(exception.message ?? 'Something went wrong'));
    }
  }

  FutureOr<void> _onPlayReciterEvent(
    PlayReciterEvent event,
    Emitter<RecitersState> emit,
  ) async {
    await audioService.play(event.url);

    final currentState = state;

    if (currentState is RecitersSuccess) {
      emit(
        RecitersSuccess(
          recitersEntity: currentState.recitersEntity,
          currentURL: audioService.currentURL,
          isPlaying: audioService.isPlaying,
          isMuted: audioService.currentVolume == 0,
        ),
      );
    }
  }

  FutureOr<void> _onMuteReciterEvent(
    MuteReciterEvent event,
    Emitter<RecitersState> emit,
  ) async {
    if (state is RecitersSuccess) {
      final currentState = state as RecitersSuccess;

      final newIsMuted = !currentState.isMuted;

      await audioService.mute(newIsMuted ? 0.0 : 1.0);

      emit(
        RecitersSuccess(
          recitersEntity: currentState.recitersEntity,
          currentURL: currentState.currentURL,
          isPlaying: currentState.isPlaying,
          isMuted: newIsMuted,
        ),
      );
    }
  }

  FutureOr<void> _onNextSurahEvent(
    NextSurahEvent event,
    Emitter<RecitersState> emit,
  ) async {
    if (event.currentSurah > 114) return;

    final surahNumber = event.currentSurah.toString().padLeft(3, '0');
    final url = '${event.server}$surahNumber.mp3';
    await audioService.play(url);
    final currentState = state;

    if (currentState is RecitersSuccess) {
      emit(
        RecitersSuccess(
          recitersEntity: currentState.recitersEntity,
          currentURL: audioService.currentURL,
          isPlaying: audioService.isPlaying,
          isMuted: audioService.currentVolume == 0,
        ),
      );
    }
  }

  FutureOr<void> _onPreviousSurahEvent(
    PreviousSurahEvent event,
    Emitter<RecitersState> emit,
  ) async {
    if (event.currentSurah < 1) return;

    final surahNumber = event.currentSurah.toString().padLeft(3, '0');
    final url = '${event.server}$surahNumber.mp3';
    await audioService.play(url);
    final currentState = state;
    if (currentState is RecitersSuccess) {
      emit(
        RecitersSuccess(
          recitersEntity: currentState.recitersEntity,
          currentURL: audioService.currentURL,
          isPlaying: audioService.isPlaying,
          isMuted: audioService.currentVolume == 0,
        ),
      );
    }
  }
}
